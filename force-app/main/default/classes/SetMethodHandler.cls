public with sharing class SetMethodHandler {
    public static Set<Integer> addMethod(Set<Integer> firstset){
        Set<Integer> result = new Set<Integer>();
        for(Integer v1:firstset){
            result.add(v1);
        }
        return result;
    }
    public static Set<Integer> addAllMethod(Set<Integer> firstset, Set<Integer> secondset){
        Set<Integer> result = new Set<Integer>();
        for(Integer val : firstset){
            
                result.addAll(secondset);
                
            }
            return result;
        }
        
    }