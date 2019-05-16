#!/bin/bash

set -x
MONGO_LOG = "/var/log/mongodb/mongod.log"
MONGO = "/usr/bin/mongo"
MONGOD = "/usr/bin/mongod"

#$MONGOD --configsvr --replSet "rs_italy" --dbpath /data/configdb --port 27017
echo "waiting buffer"
sleep 30

$MONGO --host mongo_config_1 --port 27017 
$MONGO --eval '"rs.initiate( { _id : rs-italy , configsvr: true,members: [{ _id : 0, host : 
"172.16.0.2:27017" }]}) | mongo"'
