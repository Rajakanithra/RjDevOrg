@IsTest
private class SetMethodHandlerTest {
    @isTest
    static void testAdd(){
        Set<Integer> firstset = new Set<Integer>();
        firstset.add(10);
        firstset.add(20);
        firstset.add(30);
        firstset.add(40);
        firstset.add(50);

        /*Set<Integer> secondset = new Set<Integer>();
        secondset.add(60);
        secondset.add(70);
        secondset.add(80);
        secondset.add(90);
        secondset.add(100);*/
        Set<Integer> result = SetMethodHandler.addMethod(firstset);
        system.assertEquals(true, result.contains(20),'msg');
        system.debug('@@@@@@@ 13 @@@@@@@'+result);
    }
    @isTest
    static void testAddAll(){
        Set<Integer> firstset = new Set<Integer>();
        Set<Integer> secondset = new Set<Integer>();
        firstset.add(10);
        firstset.add(20);
        firstset.add(30);
        firstset.add(40);
        firstset.add(50);

        
        secondset.add(60);
        secondset.add(70);
        secondset.add(80);
        secondset.add(90);
        secondset.add(100);
        Set<Integer> result = SetMethodHandler.addAllMethod(firstset, secondset);
        system.assertEquals(true, result.contains(20),'msg');
        system.debug('@@@@@@@ 13 @@@@@@@'+result);
    }
}