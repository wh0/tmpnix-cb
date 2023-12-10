some test script written in tcl checks for /usr/bin/pgrep (exists as we can't
sandbox) but then tries to run pgrep from $PATH (fails because not included as
dependency)