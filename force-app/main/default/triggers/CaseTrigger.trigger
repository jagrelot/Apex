trigger CaseTrigger on Case (before insert) {
 CaseTriggerHandler.casesCreatedToday(trigger.new);
}