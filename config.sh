docker exec -it rome bash -c 'echo "mongo 
rs.initiate( { _id : "rs-italy",configsvr: true,members: [{ _id : 0, host :     "rome:27017" }]})"'
                        
     
docker exec -it berlin bash -c 'echo mongo --host berlin --port 27018 --eval "rs.initiate( { _id : "rs-germany", members: [{ _id : 0, host : "berlin:27018" }]})"'
                        

docker exec -it madrid bash -c 
'echo rs.initiate( { _id : "rs-spain",
                     members: [
                          { _id : 0, host : "172.16.0.4\"madrid"\:27019" }
                        ]
                      }
                    ) | mongo"'

docker exec -it tokio bash -c 
'echo rs.initiate( { _id : "rs-japan",
                     members: [
                          { _id : 0, host : "172.16.0.5\"tokio"\:27020" }
                        ]
                      }
                    ) | mongo'  
                    
docker exec -it washington bash -c 
'echo rs.initiate( { _id : "rs-usa",
                     members: [
                          { _id : 0, host : "172.16.0.6\"washington"\:27021" }
                        ]
                      }
                    ) | mongo' 
