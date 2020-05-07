@isTest
public class TestDataFactory {

    public static Account createAccountWithOpps(String acctName, Integer numOfOpps) {
        
        Account acct = new Account(Name=acctName);
        insert acct;

        List<Opportunity> opps = new List<Opportunity>();

        for(Integer i=0 ; i< numOfOpps; i++) {
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opportunity ' + i;
            opp.AccountId = acct.Id;
            opp.CloseDate = System.today().addMonths(1);
            opp.StageName = 'Needs Analysis';
            opps.add(opp);
        }
            insert opps;

        return acct;
    }
}
