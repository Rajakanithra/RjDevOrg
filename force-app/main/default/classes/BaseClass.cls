global class BaseClass extends AbstractClassAccount 
{
    global override void beforeInsert(List<sObject> newList, List<sObject> oldList, Map<id, sObject> newMap, Map<id, sObject> oldMap)
    {
        
        system.debug('Get Instance of Account');
        
    }
    global override void beforeUpdate(List<sObject> newList, List<sObject> oldList, Map<id, sObject> newMap, Map<id, sObject> oldMap)
    {
        
        system.debug('Get Instance of Account');
        
    }
    global override void beforeDelete(List<sObject> oldList,Map<id, sObject> oldMap)
    {
        
        system.debug('Get Instance of Account');
        
    }
    global override void afterInsert(List<sObject> newList, List<sObject> oldList, Map<id, sObject> newMap, Map<id, sObject> oldMap)
    {
        
        system.debug('Get Instance of Account');
        
    }
    global override void afterUpdate(List<sObject> newList, List<sObject> oldList, Map<id, sObject> newMap, Map<id, sObject> oldMap)
    {
        
        system.debug('Get Instance of Account');
        
    }
    global override void afterDelete(List<sObject> oldList, Map<id, sObject> oldMap)
    {
        
        system.debug('Get Instance of Account');
        
    }
    global override void afterUndelete(List<sObject> newList,Map<id, sObject> newMap)
    {
        
        system.debug('Get Instance of Account');
        
    }
    
}