/* Upon opportunity creation, add the owner's manager as an opportunity 
 * team member with role "Sales Manager".
 *
 * Challenge
 * If the opportunity owner is a manager, add one of thier direct 
 * employees as a "Sales Rep" opportunity team memeber. 
*/

trigger OpportunityTrigger on Opportunity (after insert) {
 
List<OpportunityTeamMember> oppMembers = new List<OpportunityTeamMember>();

/*Can Only access base field with trigger.new. It must be put into a List with SOQL*/

List<Opportunity> opps = [SELECT Id, Name, OwnerId, Owner.ManagerId 
                                FROM Opportunity 
                                WHERE Id IN :trigger.New];

Set<Id> OwnerIds = new Set<>();

Map<Id, List<User>> userToTeamMembers = new Map<Id, List<User>>();

    for (Opportunity opp : opps){
        if(opp.Owner.ManagerId != null){
            OpportunityTeamMember oppMemberWithManager =  new OpportunityTeamMember();
             oppMemberWithManager.UserId         = opp.Owner.ManagerId;
             oppMemberWithManager.TeamMemberRole = 'Sales Manger';
             oppMemberWithManager.OpportunityId  = opp.Id;
             oppMembers.add(oppMemberWithManager);
        }

        //Get list of all direct reports associated to opp owner(User)
        
    }
        insert oppMembers;

 }