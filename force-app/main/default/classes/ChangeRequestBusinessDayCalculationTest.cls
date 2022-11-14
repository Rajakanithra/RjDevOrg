@isTest
private class ChangeRequestBusinessDayCalculationTest 
{
    static testMethod void CaseInternal() {
        List<ChangeRequestBusinessDayCalculation.FlowInputs> Internal = new List<ChangeRequestBusinessDayCalculation.FlowInputs>();
        ChangeRequestBusinessDayCalculation.FlowInputs req = new ChangeRequestBusinessDayCalculation.FlowInputs();
        req.plannedStartTime = system.now();
        req.changeType = 'Internal';
        Internal.add(req);
        Test.startTest();
        List<Object> obInternal = ChangeRequestBusinessDayCalculation.setPlannedSLAStartTime(Internal);
        Test.stopTest();
        system.assert(obInternal.size()>0);  
     }
    
     
}