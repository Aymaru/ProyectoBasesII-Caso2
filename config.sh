docker exec -it rome bash -c 
"echo rs.initiate( { _id : "rs-italy",
                     configsvr: true,
                     members: [
                          { _id : 0, host : "172.16.0.2\"rome"\:27017" }
                        ]
                      }
                    ) | mongo"
                        
     
docker exec -it berlin bash -c 
"echo rs.initiate( { _id : "rs-germany",
                     members: [
                          { _id : 0, host : "172.16.0.3\"berlin"\:27018" }
                        ]
                      }
                    ) | mongo"    
                        

docker exec -it madrid bash -c 
"echo rs.initiate( { _id : "rs-spain",
                     members: [
                          { _id : 0, host : "172.16.0.4\"madrid"\:27019" }
                        ]
                      }
                    ) | mongo"  

docker exec -it tokio bash -c 
"echo rs.initiate( { _id : "rs-japan",
                     members: [
                          { _id : 0, host : "172.16.0.5\"tokio"\:27020" }
                        ]
                      }
                    ) | mongo"  
                    
docker exec -it washington bash -c 
"echo rs.initiate( { _id : "rs-usa",
                     members: [
                          { _id : 0, host : "172.16.0.6\"washington"\:27021" }
                        ]
                      }
                    ) | mongo"  
