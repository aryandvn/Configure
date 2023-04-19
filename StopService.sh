#This is a bash file that stops all the services

cd /home/weblogic/BackUp/

#To stop all the services
docker compose down

#Removing Diectory
rm -rf /home/weblogic/BackUp/
