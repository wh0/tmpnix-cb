```
============================= test session starts ==============================
platform linux -- Python 3.10.9, pytest-7.1.3, pluggy-1.0.0
rootdir: /tmp
collected 44 items / 14 deselected / 30 selected                               

../../nix/store/1pr89wcgh79vpmw3s7h8jaay1d5bnys3-python3.10-psutil-5.9.3/lib/python3.10/site-packages/psutil/tests/test_system.py . [  3%]
...........F....F..s.........                                            [100%]

=================================== FAILURES ===================================
______________________ TestCpuAPIs.test_cpu_count_logical ______________________

self = <psutil.tests.test_system.TestCpuAPIs testMethod=test_cpu_count_logical>

    def test_cpu_count_logical(self):
        logical = psutil.cpu_count()
        self.assertIsNotNone(logical)
>       self.assertEqual(logical, len(psutil.cpu_times(percpu=True)))
E       AssertionError: 4 != 3

/tmp/nix/store/1pr89wcgh79vpmw3s7h8jaay1d5bnys3-python3.10-psutil-5.9.3/lib/python3.10/site-packages/psutil/tests/test_system.py:310: AssertionError
_______________________ TestCpuAPIs.test_per_cpu_percent _______________________

self = <psutil.tests.test_system.TestCpuAPIs testMethod=test_per_cpu_percent>

    def test_per_cpu_percent(self):
        last = psutil.cpu_percent(interval=0.001, percpu=True)
>       self.assertEqual(len(last), psutil.cpu_count())
E       AssertionError: 3 != 4

/tmp/nix/store/1pr89wcgh79vpmw3s7h8jaay1d5bnys3-python3.10-psutil-5.9.3/lib/python3.10/site-packages/psutil/tests/test_system.py:460: AssertionError
=========================== short test summary info ============================
FAILED ../../nix/store/1pr89wcgh79vpmw3s7h8jaay1d5bnys3-python3.10-psutil-5.9.3/lib/python3.10/site-packages/psutil/tests/test_system.py::TestCpuAPIs::test_cpu_count_logical
FAILED ../../nix/store/1pr89wcgh79vpmw3s7h8jaay1d5bnys3-python3.10-psutil-5.9.3/lib/python3.10/site-packages/psutil/tests/test_system.py::TestCpuAPIs::test_per_cpu_percent
============ 2 failed, 27 passed, 1 skipped, 14 deselected in 2.78s ============
```

weird, sysconf says cpus 0-3, /proc/stat only has info for 0-2
