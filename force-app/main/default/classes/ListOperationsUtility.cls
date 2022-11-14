public with sharing class ListOperationsUtility {
    public static List<Integer> getUnion(List<Integer> firstSet, List<Integer> secondSet) {
        List<Integer> result = new List<Integer>();
        for(Integer val : firstSet) {
            result.add(val);
        }
        for(Integer val : secondSet) {
            result.add(val);
        }
        return result;
    }
    public static List<Integer> getIntersection(List<Integer> firstSet, List<Integer> secondSet) {
        List<Integer> result = new List<Integer>();
        for(integer val : firstSet){
            if(secondSet.contains(val)){
                result.add(val);
                
            }
        }
        return result;
    }
    public static List<Integer> getValuesInFirstButNotInSecond(List<Integer> firstSet, List<Integer> secondSet) {
        List<Integer> result = new List<Integer>();
        for(Integer val : firstSet) {
            if(!secondSet.contains(val))
            result.add(val);
        }
        
        return result;
    }
    public static List<Integer> getValuesInSecondButNotInFirst(List<Integer> firstSet, List<Integer> secondSet) {
        List<Integer> result = new List<Integer>();
        for(Integer val : secondSet) {
            if(!firstSet.contains(val))
            result.add(val);
        }
        return result;
    }
    public static List<Integer> getAllOddValues(List<Integer> firstSet, List<Integer> secondSet) {
        List<Integer> result = new List<Integer>();
        for(integer val:firstSet){
            if(math.mod(val,2)!=0){
                result.add(val);
            }
        }
        for(integer val:secondSet){
            if(math.mod(val,2)!=0){
                result.add(val);
            }
        }
        return result;
    }
    public static List<Integer> getAllEvenValues(List<Integer> firstSet, List<Integer> secondSet) {
        List<Integer> result = new List<Integer>();
        for(integer val:firstSet){
            if(math.mod(val,2)==0){
                result.add(val);
            }
        }
        for(integer val:secondSet){
            if(math.mod(val,2)==0){
                result.add(val);
            }
        }
        return result;
    }
    
    public static integer getSumOfEvenValues(List<Integer> firstSet, List<Integer> secondSet) 
    { 
        integer sum=0;
        for(Integer first : firstSet) {
           if(math.mod(first,2)==0){
             sum=sum+first;
           }
        }
       
        for(Integer second : secondSet) {
            if(math.mod(second,2)==0){
            sum=sum+second;
        }
        }
        
       
        return sum;
    }
    public static Integer getSumOfOddValues(List<Integer> firstSet, List<Integer> secondSet) 
    {
        
        integer sum=0;
        for(Integer first : firstSet) {
           if(math.mod(first,2)!=0){
             sum=sum+first;
           }
        }
       
        for(Integer second : secondSet) {
            if(math.mod(second,2)!=0){
            sum=sum+second;
        }
        }
        return sum;
    }
    public static Integer getSumOfMultiplesOfValues(List<Integer> firstSet, List<Integer> secondSet) 
    {
      integer sum=0;
        for(Integer first : firstSet) {
           if(math.mod(first,2)==0){
             sum=sum+first;
           }
        }
       
        for(Integer second : secondSet) {
            if(math.mod(second,2)==0){
            sum=sum+second;
        }
        }
        return sum;          
        
}
}