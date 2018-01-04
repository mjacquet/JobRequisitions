User jres=[Select id from user where alias='Julie'];
User jrh=[Select id from user where alias='Jean'];

list<applicant__c> aps=[SELECT HR_Contact__c,id from applicant__c];
for (applicant__c a:aps){
	a.HR_Contact__c=jrh.id;
}
update aps;

list<Job_Requisition__c> jrs=[SELECT Hiring_Manager__c from Job_Requisition__c];
for (Job_Requisition__c jr:jrs){
	jr.Hiring_Manager__c=jres.id;
}
update jrs;