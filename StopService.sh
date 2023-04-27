#This is a bash file that stops all the services

cd /home/weblogic/BackUp/

echo ""
echo "##########################################"
echo "        Stopping Docker Services          "
echo "##########################################"
echo ""

#To stop all the services
docker compose down

#Removing Diectory
rm -rf /home/weblogic/BackUp/

echo ""
echo "##########################################"
echo "      Stopping Kubernetes Services        "
echo "##########################################"
echo ""

minikube stop
