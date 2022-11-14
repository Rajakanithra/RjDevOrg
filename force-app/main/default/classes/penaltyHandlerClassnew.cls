public with sharing class penaltyHandlerClassnew {
  public static void penaltyHandlerMethod(List<Penalty__C>penalitylist){
    set<id>driverids = new set<id>();
    map<id,List<Penalty__c>> driverpenaltymap = new map<id,List<Penalty__c>>();
    for(Penalty__C penalty:penalitylist){
        if(penalty.Driver__c != Null){
            driverids.add(penalty.Driver__c);
            system.debug('------------->'+penalty);
        }
        if(driverpenaltymap.get(penalty.Driver__C)== Null){
            driverpenaltymap.put(penalty.Driver__C, new List<Penalty__c>());
            system.debug('------------->'+driverpenaltymap);
        }
        if(driverpenaltymap.get(penalty.Driver__C)!=null){
            driverpenaltymap.get(penalty.Driver__C).add(penalty);
            system.debug('------------->'+driverpenaltymap);
        }
        Map<id,Driver__C> driverDiscount = new Map<id,Driver__C>([select id,Name,Discount__c from Driver__C where id in:driverids]);
        for(List<Penalty__C> penaltyList:driverpenaltymap.values()){
            for(Penalty__c penal:penaltyList){
                if(driverPenaltyMap.containsKey(penal.driver__c) && !driverDiscount.isEmpty()){
                    penal.Amount_To_Pay__c = penal.Amount__c - driverDiscount.get(penal.Driver__c).Discount__c/100 * penal.Amount__c;
                    system.debug('---------------->'+penal); 
                }
            }
        }
    }
  }  
}