# Socket writing algorithm          ---------------------------------------


# Run this part on terminal (R) -------------------------------------------

j<-1

# this is for checking locally... by changing host can send data to different IP adresses

con <- socketConnection(host="localhost", port = 9999, blocking=FALSE,
                          server=TRUE, open="r+") 
while(TRUE)
{
# reading file from system

f <- file("./sparkR-streaming/data.csv")
  open(f) 
  sendme <- readLines(f, n=j)
  write_resp <- writeLines(sendme[j], con)
  j<-j+1
  if (j == 4999){
   j<-1
  }

  print(j)
  #Sys.sleep(.0025)
  Sys.sleep(.1)
  
  close(f)
 
}
close(con)
