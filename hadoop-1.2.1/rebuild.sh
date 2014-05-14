#!/bin/bash

ant > ant.log

build_status=`cat ant.log | grep "BUILD SUCCESSFUL" | wc -l | awk '{print $1}'`

if [[ ${build_status} == 1 ]]
then
    ./bin/stop-dfs.sh
    rm -rf /tmp/hadoop*

    for n in {2..6}
    do
        ssh hadoop-$n "rm -rf /tmp/hadoop*"
    done

    ./bin/hadoop namenode -format

    ./bin/start-dfs.sh

    # ssh hadoop-5 "/bin/cp real-64M 64M"

    echo "BUILD SUCCESSFUL"
else
    cat ant.log
    rm -f ant.log
fi
