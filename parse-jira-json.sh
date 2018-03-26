#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "No arguments supplied!"
    exit
fi

SIZE_OF_ISSUES=`cat $1 | jq '.issues | length'`

# _index:now | todate | tostring | .[0:10] | ("jira-"+.),
# today: now | todate | tostring | .[0:10],

# echo "Parsing issues which size if $SIZE_OF_ISSUES started at $(date +%F_%R)."
for (( i = 0; i < $SIZE_OF_ISSUES; i++ )); do
	cat $1 | jq '.issues' | jq -c '.['$i'] | 
	{
		index:
		{
			_index:now | todate | tostring | .[0:10] | ("jira-"+.),
			_id:.key
		}
	}'
	cat $1 | jq '.issues' | jq -c '.['$i'] | 
	{
		today: now | todate | tostring | .[0:10],
		key: .key,
		assignee_name: .fields.assignee.name,
		assignee_key: .fields.assignee.key,
		status_name: .fields.status.name,
		aggregateprogress_progress: .fields.aggregateprogress.progress,
		aggregateprogress_total: .fields.aggregateprogress.total,
		issuetype_name: .fields.issuetype.name,
		project_key: .fields.project.key,
		project_name: .fields.project.name,
		summary: .fields.summary,
		aggregatetimeoriginalestimate: .fields.aggregatetimeoriginalestimate,
		aggregatetimeestimate: .fields.aggregatetimeestimate,
		aggregatetimespent: .fields.aggregatetimespent,
		labels: .fields.labels | tostring,
		resolutiondate: .fields.resolutiondate | tostring | .[0:10],
		epic_link: .fields.customfield_10006
	}'
done
# echo "Parsing issues finished at $(date +%F_%R)."

