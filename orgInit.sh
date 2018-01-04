sfdx force:user:create --definitionfile data/userdef.json LastName=Responsable FirstName=Julie Email=jres@ag2rlm.co Username=jres@ag2rlm.org CommunityNickname=Julie Alias=Julie
sfdx force:user:create --definitionfile data/userdef.json LastName=RH FirstName=Jean Email=jrh@ag2rlm.co Username=jrh@ag2rlm.org CommunityNickname=Jean Alias=Jean
sfdx force:data:tree:import --plan data/Job_Requisition__c-Applicant__c-plan.json
sfdx force:apex:execute -f scripts/setup.cls