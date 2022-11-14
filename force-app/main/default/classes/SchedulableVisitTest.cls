@isTest
public class SchedulableVisitTest {
    @isTest
    public static void scheduleVisitTestmethod(){
        
        
        Account acc= new Account();
        acc.Name='raja Account';
        insert acc;
        
        List<Visit__c>vList = new List<Visit__c>();
        for(integer i=0;i<200;i++){
            Visit__c vs = new Visit__c();
            vs.Name='RajaTest'+i;
            vs.Amount__c =200;
            vs.Customer__c=acc.id;
            vList.add(vs);
        }
        insert vList;
        
        Test.startTest();
        SchedulableVisit schedule = new SchedulableVisit();
        string sch='0 24 15 12 10 ? 2022';
        string jobId = system.schedule('schjob', sch, schedule);
        Test.stopTest();
        List<Visit__c> visitResult = [select id,Visit_Type__c from Visit__c where Visit_Type__c ='New'];
        system.debug('visit Result is:'+visitResult.size());
        system.assertEquals(200, visitResult.size(), 'success');
        
    }
}