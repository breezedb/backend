#!/bin/bash
name=rowy-run
public_image_project=rowy-service
helpFunction()
{
   echo "Usage: ./deploy.sh --project [YOUR GCLOUD PROJECT ID]"
   exit 0
}

while test $# -gt 0; do
           case "$1" in
                --project)
                    shift
                    project_id=$1
                    shift
                    ;;
                *)
                   echo "$1 is not a recognized flag!"
                   return 1;
                   ;;
          esac
  done  

if [[ -z "$project_id" ]];
then
   helpFunction
fi
gcloud config set project $project_id
gcloud run deploy $name --image gcr.io/$public_image_project/$name --platform managed --memory 2Gi --allow-unauthenticated
