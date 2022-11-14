public class CaseStatusUpdation extends TriggerFramework {
    public static void caseStatusUpdateMethod(List<Case> triggernew){
        List<Case> caselist = new List<Case>();
        for(Case cs :triggernew){
            cs.Description = 'Hello';
        }
    }
    public static void caseStatusUpdateMethod2(Map<id,Case> oldCaseMap, List<Case>newCase){
        for(Case newCas : newCase){
            Id newCaseId = newCas.Id;
            case oldCase = oldCaseMap.get(newCaseId);
            system.debug('Stage name changed from'+ oldCase.Status + ' To ' +newCas.Status);
            if(oldCase.Status != newCas.Status){
                newCas.Description = oldCase.Description+'hello';
                system.debug('New Case Description is:'+newCas.Description);
            }
        }
    }
    public static void caseStatusUpdateMethod3(List<Case> oldcaseList, List<Case> newcaseList){
        for(Case newcase : newcaseList){
            string newStatusName = newcase.Status;
            Case matchingOldCase;
            for(Case oldcase : oldcaseList){
                if(newcase.Id == oldcase.Id){
                    matchingOldCase = oldcase;
                    break;
                }
            }
            if(newStatusName != matchingOldCase.Status){
                newcase.Description = matchingOldCase.Description+'hello';
            }
        }
    }
    protected override void afterUpdate(){
        Set<Id> amountChanged = new Set<Id>();
        for(Case newCase:(List<Case>) Trigger.new){
            Id newCaseId = newCase.Id;
           Case oldCase = (Case)Trigger.oldMap.get(newCaseId); 
            if(newCase.Account_Amount__c != oldCase.Account_Amount__c ){
                amountChanged.add(newCase.Id);
            }
        }
        List<Account> accList =[select id,Name,All_Cases_Updated__c from Account Where id In :amountChanged];
        
        for(Account Acc:accList){
            
              Acc.All_Cases_Updated__c = true;  
            }
            
        
        
       update accList; 
    }
    
}