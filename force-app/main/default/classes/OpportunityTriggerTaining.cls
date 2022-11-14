public class OpportunityTriggerTaining {
    /*public static void opportunityAmountIncrement(Map<id,Opportunity>TriggerNew)
{
List<OpportunityChildren__c> oppChildLst = new  List<OpportunityChildren__c>();
set<id> ids = new set<id>();
for(Opportunity opp: TriggerNew.values())
{
if(opp.Amount != null)
{
ids.add(opp.id);
}
}
List<OpportunityChildren__c> oppChild = new List<OpportunityChildren__c>([select id, name, Amount__c,Opportunity__c from OpportunityChildren__c where Opportunity__c in:ids]);
system.debug('oppChild Size------->'+oppChild.size());
if(oppChild.size() > 0)
{
for(OpportunityChildren__c oppChi: oppChild)
{
Opportunity opRec = TriggerNew.get(oppChi.Opportunity__c);
system.debug('Oppty Record------------->'+opRec.Amount);
if(oppChi.Amount__c != null)
{
oppChi.Amount__c = oppChi.Amount__c + opRec.Amount + 200;
}
oppChildLst.add(oppChi);   
}
}
update oppChildLst;
}*/
    public static void opportunityAmountIncrement(List<Opportunity>oldList, Map<id,Opportunity>newMap){
        system.debug('TriggerOld'+oldList);
        system.debug('TriggerNewMap'+newMap);
        List<Opportunity> optyAmountChanged = new List<Opportunity>();
        for(Opportunity oldOpty : oldList){
            Opportunity newOpty = newMap.get(oldOpty.id);
            if(oldOpty.Amount != newOpty.Amount){
                optyAmountChanged.add(newOpty);
            }
        }
        List<OpportunityChildren__c> newchild = new List<OpportunityChildren__c>();
        //List<Opportunity>oppchild = new List<Opportunity>();
        for(Opportunity oppchild :[select id,(select id,Name,Amount__c from OpportunityChildrens__r)from Opportunity where id In :optyAmountChanged]){
            //system.debug('The query result is'+newchild.size());
            system.debug('the query result is:'+oppchild);
            
            
            List<OpportunityChildren__c> child = oppchild.OpportunityChildrens__r;
            system.debug('The child is'+child);
            if(child.size() > 0){
                newchild.addAll(child);  
                system.debug('The newchilf is'+newchild); 
            }
        }
        for(OpportunityChildren__c opp : newchild){
            system.debug('the newchild is:'+newchild);
            system.debug('The result is'+opp);
            if(opp.Amount__c == Null){
                opp.Amount__c = 200;
            }
            else{
                opp.Amount__c = opp.Amount__c +200;
            }
            
        }
        
        update newchild;   
           
        
    }
     
}