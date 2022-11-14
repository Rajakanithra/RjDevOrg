@IsTest
public with sharing class MapMethodHandlerTest {
        @IsTest
        private static void testPutMethod()
        {
            Test.startTest();
            Integer checkSize = MapMethodHandler.putMethod();
            system.assertEquals(4, checkSize,'msg');
            Test.stopTest();
            
        }
        @IsTest
    private static void testPutAllMethod(){
        Map<Integer,String> res = new Map<Integer,String>();
        res.put(1,'rajamanickam');
        res.put(2,'raju');
        Test.startTest();
        MapMethodHandler.putAllMethod(res);
        Test.stopTest();
        
        
    }
    @IsTest
        private static void testGetMethod(){
            Map<Integer,String> res = new Map<Integer,String>();
            res.put(20,'raja');
            res.put(30,'saravan');
            res.put(90,'yoga');
            res.put(60,'kanithra');
          
            Test.startTest();
            MapMethodHandler.getMethod(res);
            System.assertEquals(4, res.size(),'msg');
            Test.stopTest();
            
        }
        @IsTest
        private static void testContainsKeyMethod(){
            Map<Integer,String> res = new Map<Integer,String>();
            res.put(20,'raja');
            res.put(30,'saravan');
            res.put(90,'yoga');
            res.put(60,'kanithra');
          
            Test.startTest();
            MapMethodHandler.containsKeyMethod(res);
            System.assertEquals(4, res.size(),'msg');

            Test.stopTest();
            
        }
        @IsTest
        private static void testEqualMethod(){
            Map<Integer,String> res = new Map<Integer,String>();
            res.put(1,'raju');
            res.put(2,'yogu');
            Map<Integer,String> res1 = new Map<Integer,String>();
            res1.put(1,'raju');
            res1.put(2,'yogu');
            Test.startTest();
            MapMethodHandler.equalMethod(res, res1);
            system.assertEquals(2, res.size(),'msg');
            Test.stopTest();
            
            
        }
        @IsTest
        private static void testKeySetMethod(){
            Map<Integer,String> res = new Map<Integer,String>();
            res.put(20,'raja');
            res.put(30,'saravan');
            res.put(90,'yoga');
            res.put(60,'kanithra');
          
            Test.startTest();
            MapMethodHandler.keySetMethod(res);
            System.assertEquals(4, res.size(),'msg');
            Test.stopTest();
            
        }
        @IsTest
        private static void testRemoveMethod(){
            Map<Integer,String> res = new Map<Integer,String>();
            res.put(20,'raja');
            res.put(30,'saravan');
            res.put(90,'yoga');
            res.put(60,'kanithra');
          
            Test.startTest();
            MapMethodHandler.removeMethod(res);
            //System.assertEquals(4, res.get(30),'msg');
            System.assertEquals(3, res.size(),'msg');

            Test.stopTest();
            
        }
       
        @IsTest
        private static void testClearMethod(){
            Map<Integer,String> res = new Map<Integer,String>();
            res.put(20,'raja');
            res.put(30,'saravan');
            res.put(90,'yoga');
            res.put(60,'kanithra');
          
            Test.startTest();
            MapMethodHandler.clearMethod(res);
            //System.assertEquals(4, res.get(30),'msg');
            System.assertEquals(0, res.size(),'msg');

            Test.stopTest();
            
        }
        @IsTest
        private static void testCloneMethod(){
            Map<Integer,String> res = new Map<Integer,String>();
            res.put(20,'raja');
            res.put(30,'saravan');
            res.put(90,'yoga');
            res.put(60,'kanithra');
          
            Test.startTest();
            MapMethodHandler.cloneMethod(res);
            //System.assertEquals(4, res.get(30),'msg');
            System.assertEquals(4, res.size(),'msg');

            Test.stopTest();
            
        }
}