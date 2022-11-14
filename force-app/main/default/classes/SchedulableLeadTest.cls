@isTest
public class SchedulableLeadTest {
    @isTest
    public static void schedulableLeadTestMethod(){
        List<Lead>leadList = new List<Lead>();
        for(Integer i=0;i<100;i++){
            Lead ls = new Lead();
            ls.LastName='LeadTest'+i;
            ls.Company='cts';
            ls.Status='Open-Not Contacted';
            leadList.add(ls);
        }
        insert leadList;
        Test.startTest();
        SchedulableLead slead = new SchedulableLead();
        string str ='0 04 16 12 10 ? 2022';
        string strjob=system.schedule('leadschedule', str, slead);
        Test.stopTest();
        
        List<Lead>LeadResult = [select id,LeadSource from Lead where LeadSource='salesforce'];
        system.assertEquals(100, LeadResult.size(), 'success');
    }
}