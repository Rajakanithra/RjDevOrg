@IsTest
private class SetOperationsUtilityTest {
    @IsTest
    static void testUnion() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);

        Set<Integer> result = SetOperationsUtility.getUnion(firstSet, secondSet);
        System.assertEquals(true, result.contains(14),'msg');
        System.assertEquals(true, result.contains(20),'msg');
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testIntersection() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);
        
        Set<Integer> result = SetOperationsUtility.getIntersection(firstSet, secondSet);
        System.assertEquals(true, result.contains(1),'msg');
        System.assertEquals(true, result.contains(105),'msg');
        System.debug('@@@@@ Result @@@@ '+result);
}
    @IsTest
    static void testValuesInFirstButNotInSecond() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);
        
        Set<Integer> result = SetOperationsUtility.getValuesInFirstButNotInSecond(firstSet,secondSet);
        System.debug('@@@@@ Result @@@@ '+result);
        System.assertEquals(true, result.contains(10),'msg');
        // System.assertEquals(false, result.contains(147),'msg');
}
    @IsTest
    static void testValuesInSecondButNotInFirst() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);
        
        Set<Integer> result = SetOperationsUtility.getValuesInSecondButNotInFirst(firstSet,secondSet);
        System.assertEquals(true, result.contains(147),'msg');
        System.assertEquals(false, result.contains(12),'msg');
        System.debug('@@@@@ Result @@@@ '+result);
}
    @IsTest
    static void testgetAllOddValues() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);
        
        Set<Integer> result = SetOperationsUtility.getAllOddValues(firstSet,secondSet);
        System.assertEquals(true, result.contains(17),'msg');
        //System.assertEquals(true, result.contains(178),'msg');
        System.debug('@@@@@ Result @@@@ '+result);
}
    @IsTest
    static void testgetAllEvenValues() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);
        
        Set<Integer> result = SetOperationsUtility.getAllEvenValues(firstSet,secondSet);
        System.assertEquals(true, result.contains(12),'msg');
        System.assertEquals(true, result.contains(147),'msg');
        System.debug('@@@@@ Result @@@@ '+result);
}
      @IsTest
    static void testsumOfAllEven() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(12);
        secondSet.add(178);
        
        Integer sum = SetOperationsUtility.getSumOfEvenValues(firstSet,secondSet);
        System.assertEquals(sum,226,'msg');
        //System.assertEquals(sum,230,'msg');
        System.debug('@@@@@ Result @@@@ '+sum);
        }
    @IsTest
    static void testsumOfAllOdd() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(12);
        secondSet.add(178);
        
        Integer sum = SetOperationsUtility.getSumOfOddValues(firstSet,secondSet);
        System.assertEquals(sum,271,'msg');
        System.assertEquals(sum,280,'msg');
        System.debug('@@@@@ Result @@@@ '+sum);
        }
    @IsTest
    static void testsumOfMultipleOfThree() {
        Set<Integer> firstSet = new Set<Integer>();
        Set<Integer> secondSet = new Set<Integer>();
        firstSet.add(1);
        firstSet.add(10);
        firstSet.add(14);
        firstSet.add(12);
        firstSet.add(17);

        secondSet.add(1);
        secondSet.add(105);
        secondSet.add(147);
        secondSet.add(129);
        secondSet.add(178);
        
        Integer sum = SetOperationsUtility.getSumOfMultiplesOfValues(firstSet,secondSet);
        System.assertEquals(sum, 393,'msg');
        System.assertEquals(sum, 400,'msg');
        System.debug('@@@@@ Result @@@@ '+sum);
        }
}