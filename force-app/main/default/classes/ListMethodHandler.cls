public class ListMethodHandler {
    public static integer addMethod(){
        List<Integer> res = new List<Integer>();
        res.add(20);
        res.add(30);
        res.add(90);
        res.add(60);
        integer listSize = res.size();
        return listSize;

        
    }
    public static void addAllMethod(List<integer> listParam1){
       List<integer> listParam2 = new List<integer>();
       listParam2.add(11);
       listParam2.add(21);
       listParam2.add(31);
       listParam2.add(41);
       listParam2.add(51);
        system.debug('List before listparam variable'+listParam2);
        if(listParam1 != null){
            listParam1.addAll(listParam2);
        }
        system.debug('List After the addall method'+listParam1);
    }

    public static void containsMethod(List<Integer> addpar){
        if(!addpar.isEmpty())
        {
          Boolean result =  addpar.contains(20);
          system.debug('containsMethod---->'+result);
        }
    }
    public static void getMethod(List<Integer> addpar){
         if(!addpar.isEmpty())
        {
          integer result =  addpar.get(0);
          system.debug('getMethod---->'+result);
        }
    }
    public static void sizeMethod(List<Integer> addpar){
         if(!addpar.isEmpty() && addpar.size() > 0)
        {
            system.debug('sizeMethod----->'+addpar.size());
        }
    }
    public static void removeMethod(List<Integer> addpar){
        if(!addpar.isEmpty())
        {
           system.debug('before removeMethod----->'+addpar);
           addpar.remove(1);
           system.debug('after removeMethod----->'+addpar);
        }
    }
    public static void addIndexMethod(List<Integer> addpar){
       if(!addpar.isEmpty())
        {
           system.debug('before addIndexMethod----->'+addpar);
           addpar.indexOf(20);
           system.debug('after addIndexMethod----->'+addpar);
        }
    }
   
    public static void equalMethod(List<integer> param1){
        List<Integer> param2 = new List<Integer>();
        param2.add(5);
        param2.add(69);
        if(!param1.isEmpty() && !param2.isEmpty())
        {
           Boolean result =  param1.equals(param2);
           system.debug('equalMethod------->'+result);
        }
    }
    public static void clearMethod(List<Integer> addpar){
       if(!addpar.isEmpty())
       {
           system.debug('before clear method------->'+addpar);
           addpar.clear();
           system.debug('after clear method------->'+addpar);
       }
    }
    public static void cloneMethod(List<Integer> addpar){
       List<integer> cloneFuns = new List<integer>();
      if(!addpar.isEmpty())
       {
           system.debug('before clone method------->'+cloneFuns);
           cloneFuns =  addpar.clone();
           system.debug('after clone method------->'+cloneFuns);
       }
    }
    public static void addAllSetMethod(Set<integer> param1){
        List<Integer> addAllMeth = new List<Integer>();
        if(!param1.isEmpty())
        {
            system.debug('before addAllSet method------->'+addAllMeth);
            addAllMeth.addAll(param1);
            system.debug('after addAllSet method------->'+addAllMeth);
        }
      
    }
    public static void sortMethod(List<Integer> addpar){
        if(!addpar.isEmpty())
        {
           system.debug('before removeMethod----->'+addpar);
           addpar.sort();
           system.debug('after removeMethod----->'+addpar);
        }
    }
}