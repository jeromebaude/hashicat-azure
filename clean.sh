#!/bin/bash

git checkout master
rm -f remote_backend.tf
cp ./ORG/deploy_app.sh ./files/deploy_app.sh
cp ./ORG/main.tf ./
cp ./ORG/outputs.tf ./
cp ./ORG/terraform.tfvars terraform.tfvars

git add *
git commit -m "initial restore"
git push origin master

