public class ContactSearch {
    
    public static List<Contact> searchForContacts(string name, string postalCode) {
        List<Contact> conList = new List<Contact>();
        conList = [select id, name from Contact where LastName = :name and MailingPostalCode = :postalCode];
        system.debug(conList);
        return conList;
    }

}