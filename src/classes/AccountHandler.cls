public class AccountHandler {
    
    public static Account insertNewAccount(String accName) {
        Account abc = new Account();
        try {
			abc.name= accName;
            insert abc;
            system.debug(abc);
        }
        catch (DmlException e) {
			System.debug('A DML exception has occurred: ' +
			e.getMessage());
			return null;
		} 
        return abc; 
    }
}