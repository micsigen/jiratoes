#!/bin/sh

ENCODED_JIRA_URL="https://jira.t-mobile.intra/rest/api/latest/search?jql=issuetype%20in%20%28story,%20%22Technical%20Story%22%29%20AND%20%22Epic%20Link%22%20in%20%28PANII-4760,%20ATG_18R2-354,%20ATG_18R2-300%29"
echo $ENCODED_JIRA_URL

DATA_FOLDER="data"

JIRA_FILE_NAME=$DATA_FOLDER/jira_$(date +%F).json
ES_FILE_NAME=$DATA_FOLDER/es_$(date +%F).json

if [ -f $JIRA_FILE_NAME ]; then
	echo "File $JIRA_FILE_NAME already exists, you may import the data for today!"
	exit
fi

curl -X GET \
   -H "Authorization: Basic bWFqb3JiOlNlb2F0ZzI3" \
   -H "Content-Type: application/json" \
   $ENCODED_JIRA_URL \
   -o $JIRA_FILE_NAME

./parse-jira-json.sh $JIRA_FILE_NAME > $ES_FILE_NAME

curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/jira/doc/_bulk?pretty' --data-binary @ES_FILE_NAME