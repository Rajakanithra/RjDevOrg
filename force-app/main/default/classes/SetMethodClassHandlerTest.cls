@IsTest
public with sharing class SetMethodClassHandlerTest {
    @IsTest 
    private static void testAddMethod(){
        Test.startTest();
        Integer res = SetMethodClassHandler.addMethod();
        System.assertEquals(4, res,'msg');
        Test.stopTest();
        
    }
 @IsTest
    private static void testAddAllMethod(){
        Set<Integer> res = new Set<Integer>();
        res.add(1);
        res.add(2);
        Test.startTest();
        SetMethodClassHandler.addAllMethod(res);
        system.assertEquals(7, res.size(),'msg');
        Test.stopTest();
        
        
    }
    @IsTest 
    private static void testContainsMethod(){
        Set<Integer> res = new Set<Integer>();
        res.add(20);
        res.add(30);
        res.add(90);
        res.add(60);
        Test.startTest();
        SetMethodClassHandler.containsMethod(res);
        system.assertEquals(4, res.size(),'msg');
        Test.stopTest();
        
    }
    
     @IsTest
    private static void testSizeMethod(){
        Set<Integer> res = new Set<Integer>();
        res.add(20);
        res.add(30);
        res.add(290);
        res.add(260);
        
        Test.startTest();
        SetMethodClassHandler.sizeMethod(res);
        System.assertEquals(4, res.size(),'msg');
        Test.stopTest();
        
    }
     @IsTest 
    private static void testRemoveMethod(){
        Set<Integer> res = new Set<Integer>();
        res.add(20);
        res.add(30);
        res.add(290);
        res.add(260);
        Test.startTest();
        SetMethodClassHandler.removeMethod(res);
        System.assertEquals(3, res.size(),'msg');
        Test.stopTest();
        
    }
    
    @IsTest
    private static void testEqualMethod(){
        Set<Integer> res = new Set<Integer>();
        res.add(1);
        res.add(2);
        Test.startTest();
        SetMethodClassHandler.equalMethod(res);
        system.assertEquals(2,res.size(),'msg');
        Test.stopTest();
    }
    @IsTest 
    private static void testClearMethod(){
        Set<Integer> res = new Set<Integer>();
        res.add(2);
        res.add(4);
        res.add(6);
        res.add(5);
      
        Test.startTest();
        SetMethodClassHandler.clearMethod(res);
        System.assertEquals(0,res.size(),'msg');
        Test.stopTest();
        }
    @IsTest 
    private static void testCloneMethod(){
        Set<Integer> res = new Set<Integer>();
        res.add(2);
        res.add(4);
        res.add(6);
        res.add(5);
      
        Test.startTest();
        SetMethodClassHandler.cloneMethod(res);
        system.assertEquals(4,res.size(),'msg');
        Test.stopTest();
        }
    @IsTest 
    private static void testAddAllListMethod(){
      List<Integer> res = new List<Integer>();
        res.add(20);
        res.add(40);
        res.add(60);
        res.add(50);
        Test.startTest();
        SetMethodClassHandler.addAllListMethod(res);
        system.assertEquals(4,res.size(),'msg');
        Test.stopTest();
        }

}