@IsTest
private class VisitHandlerTestClass {
/*@IsTest
    public static void isLatestCheckboxTrue(){
        Account acc = new Account();
        acc.Name='Test One';
        insert acc;
       
        Visit__c vv = new Visit__c();
        vv.Name='Testnew';
        vv.IsLatest__c=true;
        vv.Customer__c = acc.Id;
        insert vv;
        
        Visit__c vv1 = new Visit__c();
        vv1.Name='Testnew1';
        vv1.IsLatest__c=true;
        vv1.Customer__c =acc.Id;
        insert vv1;
        
        
        
        Visit__c result = [select id,IsLatest__c from Visit__c where Name ='Testnew'];
        system.assertEquals(false, result.IsLatest__c);
        
        
    }*/
    @IsTest
    public static void oneVisitPerDayTest(){
        List<Account>acclist = new List<Account>();
        Account acc = new Account();
        acc.Name='Test One';
        acclist.add(acc);
        insert acclist;
        List<Visit__c> vList = new List<Visit__c>();
       
        Visit__c vv = new Visit__c();
        vv.Name='Testnew';
        vv.IsLatest__c=true;
        vv.Customer__c = acc.Id;
       
        vList.add(vv);
        
        Visit__c vv1 = new Visit__c();
        vv1.Name='Testnew1';
        vv1.IsLatest__c=true;
        vv1.Customer__c =acc.Id;
        vList.add(vv1);
        insert vList;
        
        
        
        List<Visit__c> result = [select id,Name,CreatedDate from Visit__c where Customer__c In : acclist];
        system.assertEquals(2, result.size());
        
        
    }
}