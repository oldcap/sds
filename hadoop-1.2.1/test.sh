#!/bin/bash

bin/hadoop dfs -mkdir input
bin/hadoop dfs -composeFromLocal deep-config input/foo
ssh hadoop-5  'echo "hhh" >> 64M'
#bin/hadoop dfs -cat input/zzzzz.xml
#bin/hadoop dfs -copyFromLocal conf/hdfs-site.xml input
#bin/hadoop dfs -cat input/hdfs-site.xml
