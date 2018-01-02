sfdx force:org:create -f config/project-scratch-def.json -s -d 1
sfdx force:source:push

sfdx msm:user:password:set -p AG2RLM -g User -l User --json
sfdx force:org:open -p /one/one.app#/setup