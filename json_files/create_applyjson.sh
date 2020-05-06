#!/bin/bash

TOKEN=y1ItXR74yyq13Q.atlasv1.toI1NcCfRxe97HF96UZEex3acT4jKf9DrN7JR95BxcFmLcyfXLGdw3ZMgWRLK9uX8Js
ORG=jerome-playground
workspace_id=$(curl -s --header "Authorization: Bearer $TOKEN" --header "Content-Type: application/vnd.api+json" https://app.terraform.io/api/v2/organizations/$ORG/workspaces/terraform-azure-hashicat | jq -r .data.id)

echo workspace_id=$workspace_id

cat apply.json|jq --arg a $workspace_id '.data.relationships.workspace.data.id = $a' >./tmp.tic
mv ./tmp.tic ./apply.json
cat apply.json

