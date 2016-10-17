@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String accId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);     
        Account result = [select name,Id, (select id,name,phone from Contacts) from Account where Id = :accId];      
        return result;      
    }

}