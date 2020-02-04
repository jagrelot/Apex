trigger CaseTrigger on Case (before insert, after insert, before update, after update, after undelete, after delete) {
	
    CaseTriggerHandler handler = new CaseTriggerHandler();
    
    if(trigger.isBefore && trigger.isInsert){
        handler.limitCasesPerDayfoContact(Trigger.new);
    }
}