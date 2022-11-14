public class PenaltyHandlerClass {
    
    //Some definition of the method for Developers
    public static void PenaltyHandlerMethod(List<Penalty__c> penalistList){
        
        Set<Id> driverIds = new Set<Id>();
        Map<Id, List<Penalty__c>> driverPenaltyMap = new Map<Id, List<Penalty__c>>();
        
        //Running a loop for all Penalties
        for(Penalty__c penalty:penalistList){
            if(penalty.Driver__c != NULL){
                driverIds.add(penalty.Driver__c);
                system.debug('driverIds------------->'+driverIds);
            }
            
             if(driverPenaltyMap.get(penalty.Driver__c) == NULL){
                driverPenaltyMap.put(penalty.Driver__c, new List<Penalty__c>());
                system.debug('driverPenaltyMap------------>'+driverPenaltyMap);
                
            }
             if(driverPenaltyMap.get(penalty.Driver__c) != NULL){
                driverPenaltyMap.get(penalty.Driver__c).add(penalty);
                system.debug('----->keySet'+driverPenaltyMap.keySet()+'Values'+driverPenaltyMap.values());
            }
            
        }
        
        /* fetching Discount percent from the Driver__c Object.
        Map<id,Driver__c> driverMap = new Map<id, Driver__c>([select id , name, Discount__c from Driver__c where id in:driverIds]);
        
        // Running a loop for calculating the Final Amount after the deduction.
        for(Penalty__c penaltys: penalistList)
           {
               if(penaltys.Amount__c != null && !driverMap.isEmpty())
               {
                   penaltys.Amount_To_Pay__c = penaltys.Amount__c - driverMap.get(penaltys.Driver__c).Discount__c/100 * penaltys.Amount__c;
					system.debug('--------------'+penaltys.Amount_To_Pay__c );              
               }
           }
       
    }
}*/
        //fetching Discount percent from the Driver__c Object.
        Map<id,Driver__c> driverMap = new Map<id, Driver__c>([select id , name, Discount__c from Driver__c where id in:driverIds]);
       system.debug('--------------'+driverMap);  
        // Running a loop for calculating the Final Amount after the deduction.
       for(List<Penalty__c> penaltyLst: driverPenaltyMap.values())
       { 
           //system.debug('--------------'+driverPenaltyMap); 
           for(Penalty__c penaltyRed: penaltyLst)    
           {
               if(driverPenaltyMap.containsKey(penaltyRed.driver__c) && !driverMap.isEmpty())
               {
                   penaltyRed.Amount_To_Pay__c = penaltyRed.Amount__c - driverMap.get(penaltyRed.Driver__c).Discount__c/100 * penaltyRed.Amount__c;
                   //penaltyRed.Amount_To_Pay__c = penaltyRed.Amount__c - driverPenaltyMap.get(penaltyRed.Driver__c).Discount__c/100 * penaltyRed.Amount__c;

               }
           }
       }
    }
}


/*Driver__C did=[select id,name,Discount__C from Driver__c where id In:ids];
for(Penalty__c pens:triggerNew)
{
if(pens.Amount__c != Null && did.Discount__c != Null)
{
pens.Amount_To_Pay__c = pens.Amount__c - did.Discount__c/100 * pens.Amount__c;

}
}*/