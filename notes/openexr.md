why are we building openexr even
but the threading test rebuilds a thread pool rapidly, which is somehow making the container run out of threads
(some kind of limit, `cat /sys/fs/cgroup/pids/pids.max` 512)

simulation: see meta-jointhreads.py
