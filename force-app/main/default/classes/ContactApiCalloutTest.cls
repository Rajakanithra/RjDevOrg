@isTest
private class ContactApiCalloutTest {
@isTest
    static void findAndSaveGenderForSingleContact_SuccessfulResponse(){
        //Given
        // 1.create a single contact
        Contact con = new Contact();
        con.FirstName = 'raja';
        con.LastName ='Manickam';
        insert con;
        
        String expectedGender = 'male';
        ContactApiCalloutMock mock = new ContactApiCalloutMock();
        mock.isError = false;
        test.setMock(HttpCalloutMock.class, mock);
        
        //when
        //1. Call the method
        test.startTest();
        ContactApiCallout.findAndSaveGenderForSingleContact(con.id);
        test.stopTest();
        //then
        //1.Query to retrive the gender for update
        Contact conResult=[SELECT id,gender__c FROM Contact WHERE Id =: con.Id LIMIT 1];
        system.assertEquals(expectedGender, conResult.gender__c, 'success');
    }
    @isTest
    static void findAndSaveGenderForMultipleContactTest_Success(){
        List<Contact>conList = new List<Contact>();
        List<Id>newIds = new List<Id>();
        Contact con = new Contact();
        con.FirstName = 'Raja';
        con.LastName = 'manickam';
        conList.add(con);
        Contact con1 = new Contact();
        con1.FirstName = 'sri';
        con1.LastName = 'yoga';
        conList.add(con1);
        Contact con2 = new Contact();
        con2.FirstName = 'Kanithra';
        con2.LastName = 'Raja';
        conList.add(con2);
        insert conList;
        for(Contact cc:conList){
            newIds.add(cc.id);
        }
        
        String expectedGender = 'male';
        ContactApiCalloutMock mock = new ContactApiCalloutMock();
        mock.isError = false;
        test.setMock(HttpCalloutMock.class, mock);
        
        test.startTest();
        ContactApiCallout.findAndSaveGenderForMultipleContacts(newIds);
        test.stopTest();
        
        Contact conResult=[SELECT id,gender__c FROM Contact WHERE Id =: newIds limit 1];
        system.assertEquals(expectedGender, conResult.gender__c, 'Gender response is same as Api');
        
    }
     @isTest
    static void findAndSaveGenderForMultipleContactTest_Failure(){
        List<Contact>conList = new List<Contact>();
        List<Id>newIds = new List<Id>();
        Contact con = new Contact();
        con.FirstName = 'Raja';
        con.LastName = 'manickam';
        conList.add(con);
        Contact con1 = new Contact();
        con1.FirstName = 'sri';
        con1.LastName = 'yoga';
        conList.add(con1);
        Contact con2 = new Contact();
        con2.FirstName = 'Kanithra';
        con2.LastName = 'Raja';
        conList.add(con2);
        insert conList;
        for(Contact cc:conList){
            newIds.add(cc.id);
        }
        
        //String expectedGender = 'male';
        ContactApiCalloutMock mock = new ContactApiCalloutMock();
        mock.isError = true;
        test.setMock(HttpCalloutMock.class, mock);
        
        test.startTest();
        ContactApiCallout.findAndSaveGenderForMultipleContacts(newIds);
        test.stopTest();
        
        Contact conResult=[SELECT id,gender__c FROM Contact WHERE Id =: newIds limit 1];
        system.assertEquals(null, conResult.gender__c, 'Gender Must be Null when Api fails');
        
    }
    @isTest
    static void findAndSaveGenderForMultipleContactTest_Duplicate(){
        Map<String, String> firstNameToGenderMap = new Map<String, String>();
        List<Contact>conList = new List<Contact>();
        List<Id>newIds = new List<Id>();
        Contact con = new Contact();
        con.FirstName = 'Yasmeen';
        con.LastName = 'manickam';
        conList.add(con);
        Contact con1 = new Contact();
        con1.FirstName = 'Raja';
        con1.LastName = 'yoga';
        conList.add(con1);
        Contact con2 = new Contact();
        con2.FirstName = 'Yasmeen';
        con2.LastName = 'Raja';
        conList.add(con2);
        insert conList;
        for(Contact cc:conList){
            newIds.add(cc.id);
        }
        
        
        ContactApiCalloutMock mock = new ContactApiCalloutMock();
        mock.isError = false;
        test.setMock(HttpCalloutMock.class, mock);
        
        
        test.startTest();
        ContactApiCallout.findAndSaveGenderForMultipleContacts(newIds);
        test.stopTest();
        
        List<Contact> conResult=[SELECT id,gender__c FROM Contact WHERE Id =: newIds];
        system.assertEquals(2,mock.noOfCallouts,  'duplicate names found');
        
    }
}