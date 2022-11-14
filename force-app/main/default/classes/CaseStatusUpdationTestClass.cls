@isTest
public class CaseStatusUpdationTestClass {
@isTest
    public static void caseUpdateStatus(){
        List<Case>caseList = new List<Case>();
        Case c1 = new Case();
        c1.Status='New';
        c1.Description = 'Hello';
        caseList.add(c1);
        Case c2 = new Case();
        c1.Status='Working';
        c1.Description = 'Hello Hello';
        caseList.add(c2);
        Case c3 = new Case();
        c1.Status='Escalated';
        c1.Description = 'Hello Hello Hello';
        caseList.add(c3);
        insert caseList;
        test.startTest();
        //insert caseList;
        system.assertEquals(3, caseList.size());
        system.debug('The Result is:'+caseList);
        test.stopTest();
    }
}