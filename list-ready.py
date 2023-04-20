#!/usr/bin/env python3
import ast
import functools
import subprocess

with open('/tmp/top.txt', 'r') as top_f:
  top = set(l.strip() for l in top_f)
realise_dry_run = subprocess.Popen(
  ['nix-store', '-r', '--dry-run', *top],
  stderr=subprocess.PIPE,
)
to_build = []
to_fetch = []
unknown = []
dst = None
for l in realise_dry_run.stderr:
  l = str(l, 'utf-8')
  if 'will be built' in l:
    dst = to_build
  elif 'will be fetched' in l:
    dst = to_fetch
  elif 'don\'t know how' in l:
    dst = unknown
  elif dst is not None:
    dst.append(l.strip())
realise_dry_run.wait()
if realise_dry_run.returncode != 0:
  raise Exception('realise dry run return code %d' % realise_dry_run.returncode)
to_build_s = set(to_build)
unknown_s = set(unknown)

@functools.lru_cache(maxsize=None)
def check_status(drv_path):
  if drv_path in unknown_s:
    return 'unbuildable'
  if drv_path not in to_build_s:
    return 'available'
  with open(drv_path, 'r') as drv_f:
    drv_b = drv_f.read()
  (outputs, input_drvs, input_srcs, platform, builder, builder_args, env) = ast.literal_eval(drv_b[6:])
  for input_drv_path, input_drv_outputs in input_drvs:
    input_drv_status = check_status(input_drv_path)
    if input_drv_status == 'unbuildable':
      return 'unbuildable'
    if input_drv_status != 'available':
      return 'unready'
  if any(name == 'preferLocalBuild' and value == '1' for name, value in env):
    return 'available'
  return 'ready'
for drv_path in to_build:
  status = check_status(drv_path)
  if status == 'ready':
    print(drv_path)
