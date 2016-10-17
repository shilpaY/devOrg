@isTest
public class TestRestrictContactByName {
	@isTest 
    static void restrictContactNameTest() {
        Account acct = new Account(Name='Test Account');
        insert acct;

        Contact c =  new Contact(lastName='INVALIDNAME',AccountId=acct.Id);
        insert c;
    }
}