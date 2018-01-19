Profile p=[select id from profile where Name='Company Communities User'];

User jres = new user();
jres.firstName = 'Lauren';
jres.LastName = 'Manager';
jres.Email = 'lm@platform.day';
jres.Alias = 'Lauren';
jres.Username = 'Lauren@'+UserInfo.getOrganizationId()+'.com';
jres.CommunityNickname = 'Lauren';
jres.LocaleSidKey = 'fr_FR_EURO';
jres.TimeZoneSidKey = 'Europe/Paris';
jres.ProfileID = p.id;
jres.LanguageLocaleKey = 'en_US';
jres.EmailEncodingKey = 'ISO-8859-1';
insert jres;
User jHR = new user();
jHR.firstName = 'John';
jHR.LastName = 'HR';
jHR.Email = 'jHR@platform.day';
jHR.Alias = 'John';
jHR.Username = 'John@'+UserInfo.getOrganizationId()+'.com';
jHR.CommunityNickname = 'John';
jHR.LocaleSidKey = 'fr_FR_EURO';
jHR.TimeZoneSidKey = 'Europe/Paris';
jHR.ProfileID = p.id;
jHR.LanguageLocaleKey = 'en_US';
jHR.EmailEncodingKey = 'ISO-8859-1';
insert jHR;

list<applicant__c> aps=[SELECT HR_Contact__c,id from applicant__c];
for (applicant__c a:aps){
	a.HR_Contact__c=jHR.id;
}
update aps;

list<Job_Requisition__c> jrs=[SELECT Hiring_Manager__c from Job_Requisition__c];
for (Job_Requisition__c jr:jrs){
	jr.Hiring_Manager__c=jres.id;
}
update jrs;