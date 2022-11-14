public class VisitHandlerClass {
    /*public static void recentRecordIsLatestSetToTrue(List<Visit__c>triggernew){
        List<Visit__c> visitList = new List<Visit__c>();
        Set<Id>parentIds = new Set<Id>();
        for(Visit__c vs : triggernew){
            if(vs.Customer__c != Null){
                parentIds.add(vs.Customer__c);
            }
        }
        Map<id,Visit__c>visitMap = New Map<Id,Visit__c>([select id,Name,IsLatest__c,Customer__c from Visit__c where Customer__c In:parentIds AND IsLatest__c = true AND id NOT in:triggernew]);
        for(Visit__c vv : visitMap.values()){
            vv.IsLatest__c = false;
            visitList.add(vv);  
        }
        update visitList;
    }*/
    public static void oneVisitPerDay(List<Visit__c> triggerNew){
        Set<Id>parentIds = new Set<Id>();
        for(Visit__c vs : triggernew){
            if(vs.Customer__c != Null){
                parentIds.add(vs.Customer__c);
            }
        }
        Map<id,Visit__c>visitMap = New Map<Id,Visit__c>([select id,Name,IsLatest__c,Customer__c,CreatedDate from Visit__c where Customer__c In:parentIds order By createdDate DESC Limit 1]);
        for(Visit__c newRec : triggernew)
        {
            for(Visit__c oldRec: visitMap.values())
            {
                if(newRec.CreatedDate != oldRec.CreatedDate)
                {
                    newRec.addError('Cannot create New Vist because there\'s another one created on this date.'); 
                }
            }
        }
    }
    /*public static void oneVisitPerdayPerParant(List<Visit__c> triggerNew){
        List<Visit__c> visitList = new List<Visit__c>();
        Set<Id>parentIds = new Set<Id>();
        for(Visit__c vs : triggernew){
            if(vs.Customer__c != Null){
                parentIds.add(vs.Customer__c);
            }
        }
        //Map<id,Visit__c>visitMap = New Map<Id,Visit__c>([select id,Name,IsLatest__c,CreatedDate,CreatedById,Customer__c from Visit__c where CreatedDate=TODAY AND Customer__c In:parentIds]);
        List<Visit__c>vList = New List<Visit__c>([select id,Name,IsLatest__c,CreatedDate,CreatedById,Customer__c from Visit__c where CreatedDate=TODAY AND Customer__c In:parentIds]);
        for(Visit__c vsList:vList){
            system.debug('VsList:'+vsList);
            
            if(vList.size() > 0 ){
                trigger.new[0].addError('Cannot create New Vist because there is another one created on this date.');
                
            }
        }
    } */
}