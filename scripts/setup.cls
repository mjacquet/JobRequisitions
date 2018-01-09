Profile p=[select id from profile where Name='Company Communities User'];

User jres = new user();
jres.firstName = 'Julie';
jres.LastName = 'Responsable';
jres.Email = 'jres@ag2rlm.co';
jres.Alias = 'Julie';
jres.Username = 'julie@'+UserInfo.getOrganizationId()+'.com';
jres.CommunityNickname = 'Julie';
jres.LocaleSidKey = 'fr_FR_EURO';
jres.TimeZoneSidKey = 'Europe/Paris';
jres.ProfileID = p.id;
jres.LanguageLocaleKey = 'fr';
jres.EmailEncodingKey = 'ISO-8859-1';
insert jres;
User jrh = new user();
jrh.firstName = 'Jean';
jrh.LastName = 'RH';
jrh.Email = 'jrh@ag2rlm.co';
jrh.Alias = 'Jean';
jrh.Username = 'jean@'+UserInfo.getOrganizationId()+'.com';
jrh.CommunityNickname = 'Jean';
jrh.LocaleSidKey = 'fr_FR_EURO';
jrh.TimeZoneSidKey = 'Europe/Paris';
jrh.ProfileID = p.id;
jrh.LanguageLocaleKey = 'fr';
jrh.EmailEncodingKey = 'ISO-8859-1';
insert jrh;

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