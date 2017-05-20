#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Counts words in UTF8 encoded, '\n' delimited text received from the network.

# To run this on your local machine, you need to first run a Netcat server
# $ nc -lk 9999
# and then run the example
# ./bin/spark-submit /sparkR-streaming/socket_streaming.R 
# Load SparkR library into your R session
library(SparkR)
#spark context intialization
sc <- sparkR.init()
ssc <- sparkR.streaming.init(sc, 1L)
# Create DataFrame representing the stream of input lines from connection to localhost:9999
textStream <- socketTextStream(ssc, "localhost", 9999)
print(textStream)
startStreaming(ssc)
awaitTermination(ssc)
