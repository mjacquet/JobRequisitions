public class asciiArt {
    
   @future (callout=true)
    public static void setAsciiArt(String applicantId){
        Applicant__c applicant=[SELECT id,Name__c,ASCII_name__c from applicant__c where id=:applicantId];
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://createasciiart.herokuapp.com/asciiart');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Accept', 'application/json');
        
		request.setBody('{"message":"'+applicant.name__c+'"}');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            String art='<pre><code>'+(String) results.get('art')+'</code></pre>';
            system.debug(art);
            applicant.ASCII_name__c=art;
            update applicant;
        }
    }
}