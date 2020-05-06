#!/bin/bash

TOKEN=y1ItXR74yyq13Q.atlasv1.toI1NcCfRxe97HF96UZEex3acT4jKf9DrN7JR95BxcFmLcyfXLGdw3ZMgWRLK9uX8Js
ORG=jerome-playground
echo TOKEN=$TOKEN

workspace_id=$(curl -s --header "Authorization: Bearer $TOKEN" --header "Content-Type: application/vnd.api+json" https://app.terraform.io/api/v2/organizations/$ORG/workspaces/terraform-azure-hashicat | jq -r .data.id)
echo workspace_id=$workspace_id


for variable in width height placeholder
 do
  echo
  echo
  echo "création de la variable ${variable}"
  echo "nous allons exécuter la commande:"
  echo "curl --header \"Authorization: Bearer ######\" --header \"Content-Type: application/vnd.api+json\" --request POST --data @var-${variable}2.json https://app.terraform.io/api/v2/${workspace_id}/vars"
  echo "ok? (o/n)"
  read answer
  if [[ $answer == "o" ]]
   then 
    curl \
    --header "Authorization: Bearer $TOKEN" \
    --header "Content-Type: application/vnd.api+json" \
    --request POST \
    --data @var-${variable}2.json \
    https://app.terraform.io/api/v2/workspaces/${workspace_id}/vars
   else
   echo "mauvaise saisie: juste 'o' pour oui et 'n' pour non"
  fi
done

echo
echo
echo "exécution du apply via api..."
curl \
--header "Authorization: Bearer $TOKEN" \
--header "Content-Type: application/vnd.api+json" \
--request POST \
--data @apply.json \
https://app.terraform.io/api/v2/runs


