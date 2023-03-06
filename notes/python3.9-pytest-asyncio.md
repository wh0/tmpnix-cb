```
============================= test session starts ==============================
platform linux -- Python 3.9.13, pytest-7.1.1, pluggy-1.0.0
rootdir: /tmp/nix-build-python3.9-pytest-asyncio-0.18.3.drv-0/source, configfile: setup.cfg, testpaths: tests
plugins: asyncio-0.18.3, flaky-3.7.0, hypothesis-6.40.0
asyncio: mode=auto
collected 75 items                                                             

tests/test_asyncio_fixture.py .......                                    [  9%]
tests/test_dependent_fixtures.py ..                                      [ 12%]
tests/test_event_loop_scope.py ....                                      [ 17%]
tests/test_flaky_integration.py .                                        [ 18%]
tests/test_simple.py ..x.F.F........s..                                  [ 42%]
tests/test_subprocess.py .                                               [ 44%]
tests/async_fixtures/test_async_fixtures.py .                            [ 45%]
tests/async_fixtures/test_async_fixtures_scope.py .                      [ 46%]
tests/async_fixtures/test_async_fixtures_with_finalizer.py ..            [ 49%]
tests/async_fixtures/test_async_gen_fixtures.py ..                       [ 52%]
tests/async_fixtures/test_nested.py .                                    [ 53%]
tests/async_fixtures/test_parametrized_loop.py ....                      [ 58%]
tests/hypothesis/test_base.py .......                                    [ 68%]
tests/hypothesis/test_inherited_test.py ..                               [ 70%]
tests/loop_fixture_scope/test_loop_fixture_scope.py ..                   [ 73%]
tests/markers/test_class_marker.py .                                     [ 74%]
tests/markers/test_module_marker.py ..                                   [ 77%]
tests/modes/test_auto_mode.py ......                                     [ 85%]
tests/modes/test_legacy_mode.py ....                                     [ 90%]
tests/modes/test_strict_mode.py ...                                      [ 94%]
tests/multiloop/test_alternative_loops.py ..                             [ 97%]
tests/respect_event_loop_policy/test_respects_event_loop_policy.py ..    [100%]

=================================== FAILURES ===================================
___________________________ test_unused_port_fixture ___________________________
tests/test_simple.py:47: in test_unused_port_fixture
    server1 = await asyncio.start_server(closer, host="localhost", port=unused_tcp_port)
/tmp/nix/store/pmcprpmmhn5crv44f2rwrfwirgis86yy-python3-3.9.13/lib/python3.9/asyncio/streams.py:94: in start_server
    return await loop.create_server(factory, host, port, **kwds)
/tmp/nix/store/pmcprpmmhn5crv44f2rwrfwirgis86yy-python3-3.9.13/lib/python3.9/asyncio/base_events.py:1506: in create_server
    raise OSError(err.errno, 'error while attempting '
E   OSError: [Errno 99] error while attempting to bind on address ('::1', 49314, 0, 0): cannot assign requested address
_______________________ test_unused_port_factory_fixture _______________________
tests/test_simple.py:96: in test_unused_port_factory_fixture
    server1 = await asyncio.start_server(closer, host="localhost", port=port1)
/tmp/nix/store/pmcprpmmhn5crv44f2rwrfwirgis86yy-python3-3.9.13/lib/python3.9/asyncio/streams.py:94: in start_server
    return await loop.create_server(factory, host, port, **kwds)
/tmp/nix/store/pmcprpmmhn5crv44f2rwrfwirgis86yy-python3-3.9.13/lib/python3.9/asyncio/base_events.py:1506: in create_server
    raise OSError(err.errno, 'error while attempting '
E   OSError: [Errno 99] error while attempting to bind on address ('::1', 44224, 0, 0): cannot assign requested address
=========================== short test summary info ============================
SKIPPED [1] tests/test_simple.py:238: Test a skip error inside asyncio
XFAIL tests/test_simple.py::test_asyncio_marker_fail
  need a failure
============== 2 failed, 71 passed, 1 skipped, 1 xfailed in 6.29s ==============
error: builder for '/tmp/nix/store/2smrsx1xvacd61l5s67a44hzg6x3mmv5-python3.9-pytest-asyncio-0.18.3.drv' failed with exit code 1
error: 1 dependencies of derivation '/tmp/nix/store/2p8ram6zy2w521qhb63a01y3fhzc6mia-python3.9-asgiref-3.5.0.drv' failed to build
error: 1 dependencies of derivation '/tmp/nix/store/jxvrl8nxrxady091k8qgckypwvnf1rmr-python3.9-django-3.2.13.drv' failed to build
error: 1 dependencies of derivation '/tmp/nix/store/kpp9lk34mgfsb767lb3jp58g37hv3xc4-python3.9-typogrify-2.0.7.drv' failed to build
error: 1 dependencies of derivation '/tmp/nix/store/8hmhb7va3k8dg6cl3s33s35d05kv0a2r-gi-docgen-2022.1.drv' failed to build
error: 1 dependencies of derivation '/tmp/nix/store/7kx2idv3j1bgv92czcb3llnx24c2db1h-pango-1.50.7.drv' failed to build
error: 1 dependencies of derivation '/tmp/nix/store/i7i86bfmbcadd1jfhk7b61qsmcqm4155-graphviz-2.50.0.drv' failed to build
```

it has no ipv6?

---

seems to pass now, whatever
