#!/bin/bash

# clear all previously running sessions of everything
kill $(ps aux | grep 'artisan' | awk '{print $2}') 2>/dev/null
kill $(ps aux | grep 'docker-desktop' | awk '{print $2}') 2>/dev/null
kill $(ps aux | grep 'docker' | awk '{print $2}') 2>/dev/null

for i in "$@"
	do
		case $i in
			 -p=*|--project=* )
			 PROJECT_CMD="php /home/andy/devs/${i#*=}/artisan serve --quiet";
			 DOCKER_file="/home/andy/devs/${i#*=}/docker-compose.yml";;
			 
			 -a=*|--action=* )
			 ACTION=${i#*=};;
		 	
esac
done

if [ $ACTION == "start" ]
then
	echo Starting Docker and php Artisan...
	$PROJECT_CMD & 2>/dev/null
	systemctl --user restart docker-desktop & 2>/dev/null
	sleep 5
	docker compose -f $DOCKER_file up & 2>/dev/null
	echo All services started.
elif [ $ACTION == "stop" ]
then
	echo Stopping Docker and php Artisan...
	docker compose -f $DOCKER_file down 2>/dev/null
	systemctl --user stop docker-desktop 2>/dev/null
	sleep 2
	echo All services stopped.
fi


			











