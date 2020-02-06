@isTest
private class LimitCasesPerDayTest {
	
    @testSetup static void setup(){
        
	Account acct = new Account(Name='Test Account');
	insert acct;
        
	Contact con  = new Contact(LastName='Test Contact', AccountID=acct.Id);
	insert con;
        
	List<Case> caseList = new List<Case>();
	
    for(Integer i = 0 ; i < 2; i++){
        Case cs = new Case(Status='New', 
                           Origin='Email', 
                           Subject='Test Subject' + i, 
                           ContactId = con.Id, 
                           AccountId = acct.id);            			 
            caseList.add(cs);
        }
        
        insert caseList;       
  }
    
    @isTest static void isCaseStatusClosed(){
        
        Account acct = [SELECT Id FROM Account WHERE Name = 'Test Account' LIMIT 1];
        Contact con  = [SELECT Id FROM Contact WHERE LastName = 'Test Contact' LIMIT 1];
        
        Case cs = new Case(Status='New', 
                           Origin='Email', 
                           Subject='Case Closed', 
                           ContactId = con.Id);
        Test.startTest();
       	insert cs;
        Test.stopTest();
             
        Case conUpdate  = [SELECT Id, Status FROM Case WHERE Subject = 'Case Closed' LIMIT 1];
        System.assertEquals('Closed', conUpdate.Status);
    }
}