@isTest
private class SimpleLoop1_Test 
{
    @isTest
    static void testOneToNThree()
    {
        SimpleLoop1 simpleLoop1=new SimpleLoop1();
        List<Integer> result=simpleLoop1.getOneToN(3);
        System.assertEquals(new List<Integer>{1, 2, 3}, result);
    }

    @isTest
    static void testOneToNOne()
    {
        SimpleLoop1 simpleLoop1=new SimpleLoop1();
        List<Integer> result=simpleLoop1.getOneToN(1);
        System.assertEquals(new List<Integer>{1}, result);
    }

    @isTest
    static void testOneToNZero()
    {
        SimpleLoop1 simpleLoop1=new SimpleLoop1();
        List<Integer> result=simpleLoop1.getOneToN(0);
        System.assertEquals(new List<Integer>{}, result);
    }

    @isTest
    static void testOneToNFiveOddOnly()
    {
        SimpleLoop1 simpleLoop1=new SimpleLoop1();
        List<Integer> result=simpleLoop1.getOneToNOddOnly(5);
        System.assertEquals(new List<Integer>{1, 3, 5}, result);
    }

    @isTest
    static void testOneToNEightOddOnly()
    {
        SimpleLoop1 simpleLoop1=new SimpleLoop1();
        List<Integer> result=simpleLoop1.getOneToNOddOnly(8);
        System.assertEquals(new List<Integer>{1, 3, 5, 7}, result);
    }

    @isTest
    static void testTimesTableOne()
    {
        SimpleLoop1 simpleLoop1=new SimpleLoop1();
        List<Integer> result=simpleLoop1.getTimesTable(1);
        System.assertEquals(new List<Integer>{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, result);
    }

    @isTest
    static void testTimesTableNine()
    {
        SimpleLoop1 simpleLoop1=new SimpleLoop1();
        List<Integer> result=simpleLoop1.getTimesTable(9);
        System.assertEquals(new List<Integer>{9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99, 108}, result);
    }

    @isTest
    static void testTimesTableFifteen()
    {
        SimpleLoop1 simpleLoop1=new SimpleLoop1();
        List<Integer> result=simpleLoop1.getTimesTable(15);
        System.assertEquals(new List<Integer>{15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180}, result);
    }
    @isTest
    static void testTimesTableZero()
    {
        SimpleLoop1 simpleLoop1=new SimpleLoop1();
        List<Integer> result=simpleLoop1.getTimesTable(0);
        System.assertEquals(new List<Integer>{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, result);
    }

}
