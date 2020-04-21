@isTest
private class IntermediateStrings_Test 
{
    @isTest
    static void testFindLongestWord()
    {
        System.assertEquals('components', 
                IntermediateStrings.FindLongestWord('lightning components are awesome'));
    }

    @isTest
    static void testFindLongestWord2()
    {
        System.assertEquals('three', 
                IntermediateStrings.FindLongestWord('A by zzz four three two I'));
    }

    @isTest
    static void testFindLongestWordWithPunctuation()
    {
        System.assertEquals('Never', 
                IntermediateStrings.FindLongestWord('What??! No way! Never!'));
    }

    @isTest
    static void testFindLongestWordWhitespace()
    {
        System.assertEquals('scenario', 
                IntermediateStrings.FindLongestWord('There   are some   big  gaps, between the    words. In     this scenario  which    helps!'));
    }

    @isTest
    static void testFindLongestWordMultiples()
    {
        System.assertEquals('Four', 
                IntermediateStrings.FindLongestWord('One. Two six ten Four fore faux No'));
    }

    @isTest
    static void testBreakWords()
    {
        System.assertEquals('Hello My Name Is Keir', 
                IntermediateStrings.BreakWords('HelloMyNameIsKeir'));

    }

    @isTest
    static void testBreakWordsOnlyOne()
    {
        System.assertEquals('Thisshouldonlyhave Onebreakinthesentence', 
                IntermediateStrings.BreakWords('ThisshouldonlyhaveOnebreakinthesentence'));

    }

    @isTest
    static void testBreakWordsMultipleCapitals()
    {
        System.assertEquals('NOSLEEPTil Hammersmith', 
                IntermediateStrings.BreakWords('NOSLEEPTilHammersmith'));

    }

    @isTest
    static void testAreBracketsBalanced()
    {
        System.assertEquals(true, 
                IntermediateStrings.AreBracketsBalanced('((){()})'));
    }

    @isTest
    static void testAreBracketsBalancedFail()
    {
        System.assertEquals(false, 
                IntermediateStrings.AreBracketsBalanced('{{(}(){})'));
    }

    @isTest
    static void testAreBracketsBalancedFail2()
    {
        System.assertEquals(false, 
                IntermediateStrings.AreBracketsBalanced('{{(}(){})'));
    }

    @isTest
    static void testAreBracketsBalancedFail3()
    {
        System.assertEquals(false, 
                IntermediateStrings.AreBracketsBalanced('{(()})'));
    }

    @isTest
    static void testAreBracketsBalancedWithSquare()
    {
        System.assertEquals(true, 
                IntermediateStrings.AreBracketsBalanced('{{[((()))}}'));
    }


    @isTest
    static void testAreBracketsBalancedWithWords()
    {
        System.assertEquals(true, 
                IntermediateStrings.AreBracketsBalanced('(hello)(y(e(s){no}))(good{by(e)}eee)'));
    }

    @isTest
    static void testAreBracketsBalancedFailFirst()
    {
        System.assertEquals(false, 
                IntermediateStrings.AreBracketsBalanced('){{}})'));
    }

    @isTest
    static void testFindAverageWordLength()
    {
        System.assertEquals(5, 
                IntermediateStrings.FindAverageWordLength('Sales Cloud'));
    }

    @isTest
    static void testFindAverageWordLength2()
    {
        System.assertEquals(6.5, 
                IntermediateStrings.FindAverageWordLength('Lightning Web Components Rule'));
    }

    @isTest
    static void testFindAverageWordLength3()
    {
        System.assertEquals(4.4, 
                IntermediateStrings.FindAverageWordLength('Shine on you crazy diamond'));
    }

    @isTest
    static void testFindAverageWordLength4()
    {
        System.assertEquals(3.6, 
                IntermediateStrings.FindAverageWordLength('When a blind man cries'));
    }

    @isTest
    static void testFindAverageWordLengthPunctuation()
    {
        System.assertEquals(4, 
                IntermediateStrings.FindAverageWordLength('No. Way. Dude. Awesome!!!'));
    }
}
