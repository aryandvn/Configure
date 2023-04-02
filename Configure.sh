#Volume
Volume_Name=("db_vol" "Nexus" "Jenkins" "sonarqube_database_data" "sonarqube_bundled-plugins" "sonarqube_conf" "sonarqube_data" "sonarqube_database" "sonarqube_extensions")

# Iterate through the array and print each name
for name in ${Volume_Name[@]}
do
  #!/bin/bash

    if docker volume ls | grep -q "$name"; then
        echo "Volume $name already exists."
        docker volume rm "$name"
        docker volume create "$name"
    else
        echo "Volume $name does not exist. Creating..."
        docker volume create "$name"
    fi
done

#Volume
Image_Name=("aryandvn24/aryan-nexus" "aryandvn24/aryan-jenkins" "sonarqube" "aryandvn24/aryan-pdb" "mysql:5.7" "phpmyadmin/phpmyadmin" "tomcat")

# Iterate through the array and print each name
for name in ${Image_Name[@]}
do
  #!/bin/bash

    if docker images | grep -q "$name"; then
        echo "Docker Image $name already exists."
        docker rmi "$name"
        docker pull "$name"
    else
        echo "Docker Image $name does not exist. Creating..."
        docker pull "$name"
    fi
done

#Start docker compose up
docker compose up -d
#To show all the pulled images
docker images
#To show all the pulled containers
docker ps
