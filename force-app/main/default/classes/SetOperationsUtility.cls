public with sharing class SetOperationsUtility {
    public static Set<Integer> getUnion(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        for(Integer val : firstSet) {
            result.add(val);
        }
        for(Integer val : secondSet) {
            result.add(val);
        }
        return result;
    }
    public static Set<Integer> getIntersection(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        for(integer val : firstSet){
            if(secondSet.contains(val)){
                result.add(val);
                
            }
        }
        return result;
    }
    public static Set<Integer> getValuesInFirstButNotInSecond(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        for(Integer val : firstSet) {
            if(!secondSet.contains(val))
            result.add(val);
        }
        
        return result;
    }
    public static Set<Integer> getValuesInSecondButNotInFirst(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
        for(Integer val : secondSet) {
            if(!firstSet.contains(val))
            result.add(val);
        }
        return result;
    }
    public static Set<Integer> getAllOddValues(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
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
    public static Set<Integer> getAllEvenValues(Set<Integer> firstSet, Set<Integer> secondSet) {
        Set<Integer> result = new Set<Integer>();
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
    
    public static integer getSumOfEvenValues(set<Integer> firstSet, set<Integer> secondSet) 
    {
        
        //Set<Integer> result = new Set<Integer>();
        
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
        
       system.debug('---------'+sum);
       return sum;
        
    }
    public static Integer getSumOfOddValues(Set<Integer> firstSet, Set<Integer> secondSet) 
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
        
       system.debug('---------'+sum);
       return sum;
        
    }
    public static Integer getSumOfMultiplesOfValues(Set<Integer> firstSet, Set<Integer> secondSet) 
    {
        //Set<Integer> result = new Set<Integer>();
        integer sum=0;
        for(Integer first : firstSet) {
           if(math.mod(first,3)==0){
               sum=sum+first;
           }
        }
       
        for(Integer second : secondSet) {
            if(math.mod(second,3)==0){
            sum=sum+second;
        }
        }
        system.debug('----------'+sum);
        return sum;
    }
}