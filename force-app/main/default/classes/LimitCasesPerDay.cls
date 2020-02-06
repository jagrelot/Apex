public class LimitCasesPerDay {
	
	public static void limitCasesPerDayForContact(List<Case> csList) {

		Set<Id> contactIds = new Set<Id>();
			
		for(Case cs : csList) {
			contactIds.add(cs.ContactId);
		}
			
		if(contactIds.isEmpty()) { 
			return;
		}
		
		List<Case> caseList = [	
			SELECT Id, ContactId
			FROM Case
			WHERE CreatedDate = TODAY
			AND ContactId IN :contactIds
		];
		
		Map<Id, List<Case>> contactIdToCaseMap = new Map<Id, List<Case>>();
		
		for(Case cs : caseList) {

			if(!contactIdToCaseMap.containsKey(cs.ContactId)) {
				contactIdToCaseMap.put(cs.ContactId, new List<Case>());
			}

			contactIdToCaseMap.get(cs.ContactId).add(cs);
		}
			
		for(Case cs : csList) {

			if(contactIdToCaseMap.get(cs.ContactId) != null) {

				if(contactIdToCaseMap.get(cs.ContactId).size() >= 2) {
					cs.Status = 'Closed';
				}
			}
		}
	}
}