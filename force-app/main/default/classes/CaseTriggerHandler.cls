/* Write a trigger that sets a case status to 'closed' if there are more than 2 
 * cases created that day associated with the same contact.
 *
 * Also, close the case if there are more than 3 cases created on that account
 * that day.
 */

public class CaseTriggerHandler {
    
	public static void casesCreatedToday(List<Case> csList){
            
	Set<Id> contactIds = new Set<Id>();
    Set<Id> accountIds = new Set<Id>();
    
    for(Case cs : csList){
        contactIds.add(cs.ContactId);
    }

    for(Case cs : csList){
        accountIds.add(cs.AccountId);
    }
        
 if(!contactIds.isEmpty()){
     
    List<Case> caseList = [SELECT Id, ContactId 
                          FROM Case
                          WHERE CreatedDate = TODAY 
                          AND ContactId IN :contactIds];
     
    Map<Id, List<Case>> contactToCaseMap = new Map<Id, List<Case>>();
     
    for(Case cs : caseList){
        if(!contactToCaseMap.containsKey(cs.ContactId)){
           contactToCaseMap.put(cs.ContactId, new List<Case>());
        }
        contactToCaseMap.get(cs.ContactId).add(cs);
    }


    List<Account> accountAssociatedwithCases = [SELECT Id,
                                                (SELECT Id FROM Cases 
                                                 WHERE CreatedDate = TODAY) 
                                                 FROM Account];

    Map<Id, List<Case>> accountToCaseMap = new Map<Id, List<Case>>();

     for(Account acct : accountAssociatedwithCases)
    {
        for(Case cs : acct.cases)
        {
            accountToCaseMap.put(acct.id,acct.cases);
        }   
    }

   for(Case cs : csList){
       if(cs.ContactId != null && contactToCaseMap.containsKey(cs.ContactId)){
           if(contactToCaseMap.get(cs.ContactId).size() > 2){
               cs.Status = 'Closed';        
            }
       }
   }

    for(Case cs : csList){
       if(cs.AccountId != null && accountToCaseMap.containsKey(cs.AccountId)){
           if(accountToCaseMap.get(cs.AccountId).size() > 3){
               cs.Status = 'Closed';        
            }
    }
   }     
  }
 }
}