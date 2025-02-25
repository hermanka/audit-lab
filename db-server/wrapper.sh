#!/bin/bash

# Start the first process
./entrypoint.sh &

# Start the second process
./scripts/run.sh &

# Start the third process
rsyslogd -n &

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?