trigger ApplicantArt on Applicant__c (after insert, after update) {
    for(Applicant__c a:Trigger.New){
        applicant__c oa=Trigger.oldMap.get(a.Id);
        if(a.Name__c!=oa.Name__c)asciiArt.setAsciiArt(a.id);
    }
}