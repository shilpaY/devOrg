public with sharing class cliController{
    
    @AuraEnabled
    public static Camping_Item__c getCampingItems() {
        system.debug('entered getCampingItems method');
        List<Camping_Item__c> item = [select id, name, price__c, quantity__c, packed__c from Camping_Item__c];
        system.debug('listOfCampingItem' + item);
        return item[0];
    }
    

}