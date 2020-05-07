trigger lead_bi on Lead (before insert) 
{
    LeadUtils.SetMentzKey(Trigger.new);
}