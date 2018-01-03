sfdx force:org:create -f config/project-scratch-def.json -s -d 1
sfdx force:source:push

sfdx msm:user:password:set -p AG2RLM18 -g User -l User --json