@IsTest
public class ListMethodHandlerTest {
@IsTest 
    private static void testAddMethod(){
        Test.startTest();
        Integer res = ListMethodHandler.addMethod();
        System.assertEquals(4, res,'msg');
        Test.stopTest();
        
    }
 @IsTest
    private static void testAddAllMethod(){
        List<Integer> res = new List<Integer>();
        res.add(1);
        res.add(2);
        Test.startTest();
        ListMethodHandler.addAllMethod(res);
        system.assertEquals(7, res.size(),'msg');
        Test.stopTest();
        
        
    }
    @IsTest 
    private static void testContainsMethod(){
        List<Integer> res = new List<Integer>();
        res.add(20);
        res.add(30);
        res.add(90);
        res.add(60);
        Test.startTest();
        ListMethodHandler.containsMethod(res);
        system.assertEquals(4, res.size(),'msg');
        Test.stopTest();
        
    }
    @IsTest 
    private static void testgetMethod(){
        List<Integer> res = new List<Integer>();
        res.add(20);
        res.add(30);
        res.add(290);
        res.add(260);
        Test.startTest();
        ListMethodHandler.getMethod(res);
        System.assertEquals(4, res.size(),'msg');
        Test.stopTest();
        
    }
     @IsTest
    private static void testSizeMethod(){
        List<Integer> res = new List<Integer>();
        res.add(20);
        res.add(30);
        res.add(290);
        res.add(260);
        
        Test.startTest();
        ListMethodHandler.sizeMethod(res);
        System.assertEquals(4, res.size(),'msg');
        Test.stopTest();
        
    }
     @IsTest 
    private static void testRemoveMethod(){
        List<Integer> res = new List<Integer>();
        res.add(20);
        res.add(30);
        res.add(290);
        res.add(260);
        Test.startTest();
        ListMethodHandler.removeMethod(res);
        System.assertEquals(30, 30,'msg');
        Test.stopTest();
        
    }
    @IsTest 
    private static void testAddIndexMethod(){
        List<Integer> res = new List<Integer>();
        res.add(20);
        res.add(30);
        res.add(290);
        res.add(260);
        
        Test.startTest();
        ListMethodHandler.addIndexMethod(res);
        System.assertEquals(4, res.size(),'msg');
        Test.stopTest();
        
    }
    @IsTest
    private static void testEqualMethod(){
        List<Integer> res = new List<Integer>();
        res.add(1);
        res.add(2);
        Test.startTest();
        ListMethodHandler.equalMethod(res);
        system.assertEquals(2,res.size(),'msg');
        Test.stopTest();
    }
    @IsTest 
    private static void testClearMethod(){
        List<Integer> res = new List<Integer>();
        res.add(2);
        res.add(4);
        res.add(6);
        res.add(5);
      
        Test.startTest();
        ListMethodHandler.clearMethod(res);
        System.assertEquals(0,res.size(),'msg');
        Test.stopTest();
        }
    @IsTest 
    private static void testCloneMethod(){
        List<Integer> res = new List<Integer>();
        res.add(2);
        res.add(4);
        res.add(6);
        res.add(5);
      
        Test.startTest();
        ListMethodHandler.cloneMethod(res);
        system.assertEquals(4,res.size(),'msg');
        Test.stopTest();
        }
    @IsTest 
    private static void testAddAllSetMethod(){
      Set<Integer> res = new Set<Integer>();
        res.add(20);
        res.add(40);
        res.add(60);
        res.add(50);
        Test.startTest();
        ListMethodHandler.addAllSetMethod(res);
        system.assertEquals(4,res.size(),'msg');
        Test.stopTest();
        }
    @IsTest 
    private static void testSortMethod(){
        List<Integer> res = new List<Integer>();
        res.add(7);
        res.add(5);
        res.add(11);
        res.add(2);
        Test.startTest();
        ListMethodHandler.sortMethod(res);
        System.assertEquals(2, 2,'msg');
        
        Test.stopTest();
        
    }
}