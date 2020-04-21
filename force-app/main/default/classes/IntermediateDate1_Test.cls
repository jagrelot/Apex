@isTest
private class IntermediateDate1_Test 
{
    @isTest
    static void TestDate1Null()
    {
        System.assertEquals(0, IntermediateDate1.HoursBetweenDateTimes(null, '01/01/22 14:00:00'));
    }

    @isTest
    static void TestDateNull()
    {
        System.assertEquals(0, IntermediateDate1.HoursBetweenDateTimes('01/01/22 14:00:00', null));
    }

    @isTest
    static void TestBothNull()
    {
        System.assertEquals(0, IntermediateDate1.HoursBetweenDateTimes(null, null));
    }

    @isTest 
    static void TestNoDifference()
    {
        System.assertEquals(0, IntermediateDate1.HoursBetweenDateTimes('01/01/22 14:00:00', '01/01/22 14:00:00'));
    }

    @isTest 
    static void TestOneHour()
    {
        System.assertEquals(1, IntermediateDate1.HoursBetweenDateTimes('01/01/22 14:00:00', '01/01/22 15:00:00'));
    }

    @isTest 
    static void TestLessThanOneHourIsZero()
    {
        System.assertEquals(0, IntermediateDate1.HoursBetweenDateTimes('01/01/22 14:20:00', '01/01/22 15:00:00'));
    }

    @isTest 
    static void TestOneSecondLessThanOneHourIsZero()
    {
        System.assertEquals(0, IntermediateDate1.HoursBetweenDateTimes('01/01/22 14:20:00', '01/01/22 14:20:01'));
    }

    @isTest 
    static void TestOneSecondMoreThanOneHourIsZero()
    {
        System.assertEquals(0, IntermediateDate1.HoursBetweenDateTimes('01/01/22 14:20:00', '01/01/22 14:19:59'));
    }

    @isTest 
    static void TestOneHourButNearlyTwo()
    {
        System.assertEquals(1, IntermediateDate1.HoursBetweenDateTimes('01/01/22 14:00:00', '01/01/22 15:50:00'));
    }

    @isTest 
    static void TestJustOverOneHour()
    {
        System.assertEquals(1, IntermediateDate1.HoursBetweenDateTimes('01/01/22 14:00:00', '01/01/22 15:00:01'));
    }

    @isTest 
    static void TestSecondEarlierThanFirst()
    {
        System.assertEquals(3, IntermediateDate1.HoursBetweenDateTimes('01/01/22 14:00:00', '01/01/22 10:50:00'));
    }

    @isTest 
    static void TestDifferentDays()
    {
        System.assertEquals(50, IntermediateDate1.HoursBetweenDateTimes('03/01/22 14:00:00', '01/01/22 11:20:00'));
    }

    @isTest 
    static void TestDifferentYears()
    {
        System.assertEquals(8715, IntermediateDate1.HoursBetweenDateTimes('03/01/22 14:00:00', '01/01/23 17:00:00'));
    }
}