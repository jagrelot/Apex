/* Write a trigger that sets a case status to 'closed' if there are more than 2 
 * cases created that day associated with the same contact.
 *
 * TO BE ADDED : Also, close the case if there are more than 3 cases created on that account
 * that day.
 */

public class CaseTriggerHandler {
    
public void limitCasesPerDayfoContact(List<Case> csList){  
        
Set<Id> contactIds = new Set<Id>();
        
for(Case cs : csList){
  	contactIds.add(cs.ContactId);
}
        
if(contactIds.isEmpty()){return;}
	
List<Case> caseList = [SELECT Id, ContactId 
                       FROM Case
                       WHERE CreatedDate = TODAY 
                       AND ContactId IN :contactIds];
     
Map<Id, List<Case>> contactIdToCaseMap = new Map<Id, List<Case>>();
    
for(Case cs : caseList){
  if(!contactIdToCaseMap.containsKey(cs.ContactId)){
       contactIdToCaseMap.put(cs.ContactId, new List<Case>());
    }
      contactIdToCaseMap.get(cs.ContactId).add(cs);
}
        
for(Case cs : csList){
  if(contactIdToCaseMap.get(cs.ContactId) != null){
    if(contactIdToCaseMap.get(cs.ContactId).size() >= 2){
               cs.Status = 'Closed';        
      }
   }
  }
 }
}
