#!/bin/bash

./bin/stop-all.sh
rm -rf /tmp/hadoop-root/

for n in 1 2 3 4 5 6
do
	ssh hadoop-$n "rm -rf /tmp/hadoop-root"
done

./bin/hadoop namenode -format

./bin/start-all.sh
