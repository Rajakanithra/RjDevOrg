@IsTest
public class ContactCountTriggerTest {
    @IsTest
    public static void countTheContactWhenContactsInserted(){
        Account acc = new Account();
        acc.Name ='RajaTestFirstAccount';
        insert acc;
        
        List<Contact> conList = new List<Contact>();
        Contact Con = new Contact();
        Con.LastName = 'FirstContact';
        Con.Phone = '9629231629';
        con.AccountId = acc.Id;
        
        Contact Con1 = new Contact();
        Con1.LastName = 'second contact';
        Con1.Phone = '9629231629';
        con1.AccountId = acc.Id;
        
        conList.add(con);
        conList.add(Con1);
        insert conList;
        
        contact Con2 = new Contact();
        Con2.LastName ='Third Contact';
        conList.add(Con2);
        insert conList;
        Con2.AccountId = acc.Id;
        Update conList;
        
        //Account result = [select id,Name, Number_of_contacts__c from Account where Id IN :acc.Id];
        system.assertEquals(2,conList.size());
        system.debug('Con list'+conList);
    }
    
}