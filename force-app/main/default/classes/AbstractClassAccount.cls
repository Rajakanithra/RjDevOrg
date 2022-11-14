public abstract class AbstractClassAccount 
{
    public static void run(String objectName, System.TriggerOperation operationType, List<sObject> newList,List<sObject> oldList,Map<id,sObject> newMap, Map<id,sObject> oldMap)
    {
      
            BaseClass newB = new BaseClass();
            
            if(operationType == System.TriggerOperation.BEFORE_INSERT)
            {
                newB.beforeInsert(newList, oldList, newMap, oldMap);
            }
            else if(operationType == System.TriggerOperation.BEFORE_UPDATE)
            {
                newB.beforeUpdate(newList, oldList, newMap, oldMap); 
            }
            else if(operationType == System.TriggerOperation.BEFORE_DELETE)
            {
                newB.beforeDelete(oldList, oldMap);
            }
            else if(operationType == System.TriggerOperation.AFTER_INSERT)
            {
                newB.afterInsert(newList, oldList, newMap, oldMap);
            }
            else if(operationType == System.TriggerOperation.AFTER_UPDATE)
            {
                newB.afterUpdate(newList, oldList, newMap, oldMap);
            }
            else if(operationType == System.TriggerOperation.AFTER_DELETE)
            {
                newB.afterDelete(oldList, oldMap);
            }
            else if(operationType == System.TriggerOperation.AFTER_UNDELETE)
            {
                newB.afterUndelete(newList, newMap);
            }
            
        }
    
    
    protected virtual void beforeInsert(List<sObject> newList, List<sObject> oldList, Map<id, sObject> newMap, Map<id, sObject> oldMap)
    {
        
    }
    protected virtual void afterInsert(List<sObject> newList, List<sObject> oldList, Map<id, sObject> newMap, Map<id, sObject> oldMap)
    {
        
    }
    protected virtual void beforeUpdate(List<sObject> newList, List<sObject> oldList, Map<id, sObject> newMap, Map<id,sObject> oldMap)
    {
        
    }
    protected virtual void afterUpdate(List<sObject> newList, List<sObject> oldList, Map<id, sObject> newMap, Map<id,sObject> oldMap)
    {
        
    }
    protected virtual void afterDelete(List<sObject> oldList,Map<id,sObject> oldMap)
    {
        
    }
    protected virtual void afterUndelete(List<sObject> newList,Map<id, sObject> newMap)
    {
        
    }
    protected virtual void beforeDelete(List<sObject> oldList,Map<id,sObject> oldMap)
    {
        
    }
    
}