why are we building openexr even
but the threading test rebuilds a thread pool rapidly, which is somehow making the container run out of threads
(some kind of limit, `cat /sys/fs/cgroup/pids/pids.max` 512)

simulation:

```py
import threading

def start_thread():
  t = threading.Thread(target=id, args=[0])
  t.start()
  return t

for i in range(10000):
  threads = [start_thread() for j in range(32)]
  for t in threads:
    t.join()
```
