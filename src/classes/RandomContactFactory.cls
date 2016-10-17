public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer count, String str) {
        List<Contact> con = new List<Contact>();
        str = 'Test';
        for(integer i=0;i<=count-1;i++){ 
        	Contact cont = new Contact(firstName = i + ' '+ str); 
            con.add(cont);
        }
        
        return con;
    }
}