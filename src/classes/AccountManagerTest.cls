@isTest
public class AccountManagerTest {
    static testMethod void testGet() {
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        Account acc = AccountManager.getAccount();
        
    }
}