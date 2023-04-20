#Volume
Volume_Name=("db_vol" "Nexus" "Jenkins")

# Iterate through the array and print each name
for name in ${Volume_Name[@]}
do
  #!/bin/bash

    if docker volume ls | grep -q "$name"; then
        echo "Volume $name already exists."
	echo "Removing old Volumes"
 	docker volume rm $name
	echo "Creating new Volumes"
        docker volume create "$name"
    else
        echo "Volume $name does not exist. Creating..."
        docker volume create "$name"
    fi
done

#Volume
Image_Name=("aryandvn24/aryan-nexus" "aryandvn24/aryan-jenkins" "sonarqube" "postgres" "aryandvn24/aryan-mysql" "phpmyadmin/phpmyadmin" "tomcat")

# Iterate through the array and print each name
for name in ${Image_Name[@]}
do
  #!/bin/bash

    if docker images | grep -q "$name"; then
        echo "Docker Image $name already exists."
	echo "Pulling the latest Images: $name"
        #docker rmi "$name"
        #docker pull "$name"
    else
        echo "Docker Image $name does not exist. Creating..."
        docker pull "$name"
    fi
done

#Cleaning the Docker System
docker system prune -f

#Moving to root directory
cd /home/weblogic/

#Cloning Git Repository
git clone https://github.com/aryandvn/BackUp.git

#Moving to the backup Directory
cd BackUp/

#Running all the services.
docker compose up -d

#Showing all the images
docker images

#Showing all the Services up and running
docker ps




