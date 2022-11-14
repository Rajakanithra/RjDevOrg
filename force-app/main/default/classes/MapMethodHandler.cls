public with sharing class MapMethodHandler {
    public static integer putMethod(){
        Map<Integer,String> res = new Map<Integer,String>();
        res.put(20,'raja');
        res.put(30,'saravan');
        res.put(90,'yoga');
        res.put(60,'kanithra');
        Integer resSize = res.size();
        System.debug('Put Method Function--'+res);
        return resSize;
        
    }
    public static void putAllMethod(Map<Integer,String> putparam1){
        Map<Integer,String> putparam2 = new Map<Integer,String>();
        putparam2.put(1,'Maths');
        putparam2.put(2,'Science');
        putparam2.put(3,'Social');
        system.debug('putparam1 Before Using Putall Function'+putparam1);
        if(putparam1 != null)
        {
            putparam1.putAll(putparam2);   
        }
        
        system.debug('After using PutAll Function'+putparam1);
    }
    public static void getMethod(Map<Integer,String> addpar){
        
        if(!addpar.KeySet().isEmpty())
        {
            system.debug(addPar.get(20)); 
        }
    }
    public static void containsKeyMethod(Map<Integer,String> addpar){
        if(!addpar.KeySet().isEmpty())
        {
            Boolean result =  addpar.containsKey(20);
            system.debug('ContainsKey method-------->'+result);
        }
       
    }
    public static void equalMethod(Map<Integer,String> param1, Map<Integer,String> param2)
    {
    if(!param1.isEmpty() && !param2.isEmpty())   
    {
     Boolean result =  param1.equals(param2);
     system.debug('equalMethod--->'+result);
    }

    }
    public static void keySetMethod(Map<Integer,String> param1){
        
       if(!param1.KeySet().isEmpty())
       {
           system.debug('KeySetMethod--->'+param1.keySet());
       }
    }
    public static void removeMethod(Map<Integer,String> param1){
        
        if (!param1.isEmpty())
        {
            system.debug('before  remove -->'+param1); 
        }
        param1.remove(20);
        system.debug('after remove'+param1);
    }
    public static void clearMethod(Map<Integer,String> param1){
        
        if (!param1.isEmpty())
        {
            system.debug('before  clear -->'+param1); 
        }
        param1.clear();
        System.debug('after clear'+param1);
    }
    public static void cloneMethod(Map<Integer,String> param1){
        Map<Integer,String> paramclone = new Map<Integer,String>();
        if (!param1.isEmpty())
        {
            system.debug('before  clone original variable param1 -->'+param1); 
            system.debug('before  implement clone funciton in paramClone variable -->'+paramclone); 
        }
        paramclone =   param1.clone();
        System.debug('after  implement clone funciton in paramClone variable'+paramclone);
    }
}