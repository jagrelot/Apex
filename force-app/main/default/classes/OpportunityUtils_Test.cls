@isTest
private class OpportunityUtils_Test 
{
    // update this class to unit thest the OpportunityUtils class. 
    // Ensure that you create positive and negative test cases
    // as appropriate, and take into account any boundaries.

    // 100% coverage can be achieved without testing all scenarios,
    // so don't stop just because you have full coverage.

    @TestSetup
    static void createAccountwithOpps() {
        
        Account acct = new Account(Name='Test');
        insert acct;

        List<Opportunity> opps = new List<Opportunity>();

        Opportunity largeOpp = new Opportunity(); 
        largeOpp.Name = 'Test Opportunity';
        largeOpp.AccountId = acct.Id;
        largeOpp.CloseDate = System.today().addDays(5);
        largeOpp.StageName = 'Needs Analysis';
        largeOpp.amount    = 100001;

        Opportunity mediumOpp = new Opportunity(); 
        mediumOpp.Name = 'Test Opportunity';
        mediumOpp.AccountId = acct.Id;
        mediumOpp.CloseDate = System.today().addMonths(1);
        mediumOpp.StageName = 'Needs Analysis';
        mediumOpp.amount    = 100000;

        Opportunity smallOpp = new Opportunity(); 
        smallOpp.Name = 'Test Opportunity';
        smallOpp.AccountId = acct.Id;
        smallOpp.CloseDate = System.today().addMonths(1);
        smallOpp.StageName = 'Needs Analysis';
        smallOpp.amount    = 50000;

        opps.add(largeOpp);
        opps.add(mediumOpp);
        opps.add(smallOpp);

        insert opps;

        CollaborationGroup myGroup = new CollaborationGroup();
        myGroup.Name='Test Group'; 
        myGroup.CollaborationType='Public';

        insert myGroup; 
                                                
    }

    @isTest 
     static void testLarge_addOpportunitySizeToNameAndSave(){

        List<Opportunity> opp = [SELECT Id,amount,name FROM Opportunity];
        OpportunityUtils opputil = new OpportunityUtils();

            Test.startTest();
                opputil.addOpportunitySizeToNameAndSave(opp);
            Test.stopTest();

       System.assertEquals('Test Opportunity Large', opp[0].name);
    }

    @isTest
    static void testMedium_addOpportunitySizeToNameAndSave(){

        List<Opportunity> opp = [SELECT Id,amount,name FROM Opportunity];
        OpportunityUtils opputil = new OpportunityUtils();
            Test.startTest();
                opputil.addOpportunitySizeToNameAndSave(opp);
            Test.stopTest();

       System.assertEquals('Test Opportunity Medium', opp[1].name);
    }

    @isTest
    static void testSmall_addOpportunitySizeToNameAndSave(){
        List<Opportunity> opp = [SELECT Id,amount,name FROM Opportunity];
        OpportunityUtils opputil = new OpportunityUtils();
            Test.startTest();
                opputil.addOpportunitySizeToNameAndSave(opp);
            Test.stopTest();

       System.assertEquals('Test Opportunity Small', opp[2].name);
    }

    @isTest
    static void test_postNearTermOpportunityToChatter() {

        List<Opportunity> opp = [SELECT Id,amount,name FROM Opportunity];
        List<CollaborationGroup> testgroup = [SELECT id FROM CollaborationGroup];
        OpportunityUtils opputil = new OpportunityUtils();

        Test.startTest();
            opputil.postNearTermOpportunityToChatter(opp[0].id, testgroup[0], 10);
        Test.stopTest();

        List<FeedItem> post = [SELECT Id, Body FROM FeedItem WHERE ParentId = :testgroup[0].id];

        System.assertEquals(post[0].body, 'Opportunity Test Opportunity closes in less than 10 days');
    }
}
