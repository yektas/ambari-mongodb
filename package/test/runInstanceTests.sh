#!/usr/bin/env bash

rm -rf /var/lib/mongodb/node*
rm -rf /var/log/mongodb/node*
rm -f /app/package/test/coverage.xml

cd /app/package/test

#coverage run -m --branch unittest discover . "*_test.py"
coverage run -m --branch unittest discover . "*_standalone_mongod_test.py"
result=$?

coverage report -m
coverage report xml

ps -aux | grep mongo | sed '/grep/D' | cut -f3 -d " " | xargs --no-run-if-empty kill -9

exit $result