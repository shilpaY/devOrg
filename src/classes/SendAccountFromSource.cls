public class SendAccountFromSource {

    private final String clientId = '3MVG9fMtCkV6eLhf87ltZOshoaxpBQCcrzmlOQEeWPxMRT2g2uceG9xSJOJTOX8oAfLcfNfkaTfdbtS1A5QwC';                                      
    private final String clientSecret = '4549585020263605743';
    private final String username = 'pradeep.aramalla@gmail.com';
    private final String password = 'drag0nGla$$66oAJOiTpne8atcaUlXy14Ui';
    public class deserializeResponse {
        public String id;
        public String access_token;
    }
    public String ReturnAccessToken (SendAccountFromSource acount) {

        String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setBody(reqbody);
        req.setMethod('POST');
        req.setEndpoint('https://ap2.salesforce.com/services/oauth2/token');
        HttpResponse res = h.send(req);
        deserializeResponse resp1 = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.class);
        return resp1.access_token;
    }   
    @future(callout=true)    
    public static void createAccount(String accName, String accId) {
        SendAccountFromSource acount = new SendAccountFromSource();
        String accessToken = acount.ReturnAccessToken (acount);
 
        if(accessToken != null)    {
            String endPoint = 'https://ap2.salesforce.com/services/data/v32.0/sobjects/Account/';
            String jsonstr = '{"Name" : "' + accName + '"}';
            Http h2 = new Http();
            HttpRequest req1 = new HttpRequest();
            req1.setHeader('Authorization','Bearer ' + accessToken);
            req1.setHeader('Content-Type','application/json');
            req1.setHeader('accept','application/json');
            req1.setBody(jsonstr);
            req1.setMethod('POST');
            req1.setEndpoint(endPoint);
            HttpResponse res1 = h2.send(req1);
 
            deserializeResponse resp2 = (deserializeResponse)JSON.deserialize(res1.getbody(),deserializeResponse.class);
           // Account a = [SELECT Id FROM Account WHERE Id = :accId];
           // a.externalId__c = resp2.id;
           // update a;
        }
    }
}