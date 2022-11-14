public with sharing class SetMethodClassHandler {
    public static integer addMethod(){
        Set<Integer> res = new Set<Integer>();
        res.add(20);
        res.add(30);
        res.add(90);
        res.add(60);
        integer listSize = res.size();
        return listSize;

        
    }
    public static void addAllMethod(Set<integer> listParam1){
       Set<integer> listParam2 = new Set<integer>();
       listParam2.add(11);
       listParam2.add(21);
       listParam2.add(31);
       listParam2.add(41);
       listParam2.add(51);
        system.debug('Set before listparam variable'+listParam2);
        if(listParam1 != null){
            listParam1.addAll(listParam2);
        }
        system.debug('Set After the addall method'+listParam1);
    }

    public static void containsMethod(Set<Integer> addpar){
        if(!addpar.isEmpty())
        {
          Boolean result =  addpar.contains(20);
          system.debug('containsMethod---->'+result);
        }
    }
    
    public static void sizeMethod(Set<Integer> addpar){
         if(!addpar.isEmpty() && addpar.size() > 0)
        {
            system.debug('sizeMethod----->'+addpar.size());
        }
    }
    public static void removeMethod(Set<Integer> addpar){
        if(!addpar.isEmpty())
        {
           system.debug('before removeMethod----->'+addpar);
           addpar.remove(20);
           system.debug('after removeMethod----->'+addpar);
        }
    }
    
   
    public static void equalMethod(Set<integer> param1){
        Set<Integer> param2 = new Set<Integer>();
        param2.add(5);
        param2.add(69);
        if(!param1.isEmpty() && !param2.isEmpty())
        {
           Boolean result =  param1.equals(param2);
           system.debug('equalMethod------->'+result);
        }
    }
    public static void clearMethod(Set<Integer> addpar){
       if(!addpar.isEmpty())
       {
           system.debug('before clear method------->'+addpar);
           addpar.clear();
           system.debug('after clear method------->'+addpar);
       }
    }
    public static void cloneMethod(Set<Integer> addpar){
       Set<integer> cloneFuns = new Set<integer>();
      if(!addpar.isEmpty())
       {
           system.debug('before clone method------->'+cloneFuns);
           cloneFuns =  addpar.clone();
           system.debug('after clone method------->'+cloneFuns);
       }
    }
    public static void addAllListMethod(List<integer> param1){
        Set<Integer> addAllMeth = new Set<Integer>();
        if(!param1.isEmpty())
        {
            system.debug('before addAllList method------->'+addAllMeth);
            addAllMeth.addAll(param1);
            system.debug('after addAllList method------->'+addAllMeth);
        }
      
    }
}