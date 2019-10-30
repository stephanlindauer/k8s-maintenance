#!/bin/bash

set -ex

gcloud compute instances list --filter 'tags.items=stephanlindauer-k8s' --filter 'status=RUNNING' --format='json' | jq .
gcloud compute addresses list --filter 'name=stephanlindauer-k8s-ingress' --format='json' | jq .

instance_name=$(gcloud compute instances list --filter 'tags.items=stephanlindauer-k8s' --filter 'status=RUNNING' --format='json' | jq -r .[0].name)
access_config_name=$(gcloud compute instances list --filter 'tags.items=stephanlindauer-k8s' --filter 'status=RUNNING' --format='json' | jq -r .[0].networkInterfaces[0].accessConfigs[0].name)
address=$(gcloud compute addresses list --filter 'name=stephanlindauer-k8s-ingress'  --format="json" | jq -r .[0].address)

echo $instance_name
echo $access_config_name
echo $address

gcloud compute instances delete-access-config $instance_name --access-config-name="$access_config_name" --zone='europe-west3-a' || true
gcloud compute instances add-access-config $instance_name --access-config-name="$access_config_name" --address="$address" --zone='europe-west3-a'

sleep infinity
