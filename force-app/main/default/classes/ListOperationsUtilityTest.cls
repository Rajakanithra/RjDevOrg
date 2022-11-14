@IsTest
private class ListOperationsUtilityTest {
    @IsTest
    static void testUnion() {
        List<Integer> firstSet = new List<Integer>();
        List<Integer> secondSet = new List<Integer>();
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

        List<Integer> result = ListOperationsUtility.getUnion(firstSet, secondSet);
        System.assertEquals(true, result.contains(14),'msg');
        System.assertEquals(true, result.contains(20),'msg');
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testIntersection() {
        List<Integer> firstSet = new List<Integer>();
        List<Integer> secondSet = new List<Integer>();
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

        List<Integer> result = ListOperationsUtility.getIntersection(firstSet, secondSet);
        System.assertEquals(true, result.contains(1),'msg');
        //System.assertEquals(true, result.contains(20),'msg');
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testValuesInFirstNotInSecond() {
        List<Integer> firstSet = new List<Integer>();
        List<Integer> secondSet = new List<Integer>();
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

        List<Integer> result = ListOperationsUtility.getValuesInFirstButNotInSecond(firstSet, secondSet);
        System.assertEquals(true, result.contains(10),'msg');
        //System.assertEquals(true, result.contains(20),'msg');
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testValuesInSecondNotInFirst() {
        List<Integer> firstSet = new List<Integer>();
        List<Integer> secondSet = new List<Integer>();
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

        List<Integer> result = ListOperationsUtility.getValuesInSecondButNotInFirst(firstSet, secondSet);
        System.assertEquals(true, result.contains(147),'msg');
        //System.assertEquals(true, result.contains(20),'msg');
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testAllOddValues() {
        List<Integer> firstSet = new List<Integer>();
        List<Integer> secondSet = new List<Integer>();
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

        List<Integer> result = ListOperationsUtility.getAllOddValues(firstSet, secondSet);
        System.assertEquals(true, result.contains(17),'msg');
        //System.assertEquals(true, result.contains(20),'msg');
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testAllEvenValues() {
        List<Integer> firstSet = new List<Integer>();
        List<Integer> secondSet = new List<Integer>();
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

        List<Integer> result = ListOperationsUtility.getAllEvenValues(firstSet, secondSet);
         System.assertEquals(true, result.contains(12),'msg');
        System.assertEquals(true, result.contains(147),'msg');
        System.debug('@@@@@ Result @@@@ '+result);
    }
    @IsTest
    static void testSumOfEvenValues() {
        List<Integer> firstSet = new List<Integer>();
        List<Integer> secondSet = new List<Integer>();
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

        Integer sum = ListOperationsUtility.getSumOfEvenValues(firstSet, secondSet);
        System.assertEquals(sum,226,'msg');
        System.assertEquals(sum,230,'msg');
        System.debug('@@@@@ Result @@@@ '+sum);
    }
    @IsTest
    static void testSumOfOddValues() {
        List<Integer> firstSet = new List<Integer>();
        List<Integer> secondSet = new List<Integer>();
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

        Integer sum = ListOperationsUtility.getSumOfOddValues(firstSet, secondSet);
        System.assertEquals(sum,271,'msg');
        System.assertEquals(sum,280,'msg');
        System.debug('@@@@@ Result @@@@ '+sum);
    }
    @IsTest
    static void testSumOfMultipleValues() {
        List<Integer> firstSet = new List<Integer>();
        List<Integer> secondSet = new List<Integer>();
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

        Integer sum = ListOperationsUtility.getSumOfMultiplesOfValues(firstSet, secondSet);
        System.assertEquals(sum, 393,'msg');
        System.assertEquals(sum, 400,'msg');
        System.debug('@@@@@ Result @@@@ '+sum);
    }
}