public class dummyClass {
    public static void addStudent() {
        List<Contact> conList = new List<Contact>();
        Contact con = new Contact();
        con.FirstName = 'One';
        con.LastName = 'Ram';
        conList.add(con);
        
        Contact conOne = new Contact();
        con.FirstName = 'One';
        con.LastName = 'Ramesh';
        conList.add(conOne);
        
        Contact conTwo = new Contact();
        con.LastName= 'Ramki';
        con.FirstName = 'One';
        conList.add(conTwo);
        insert conList;
    }
    
}