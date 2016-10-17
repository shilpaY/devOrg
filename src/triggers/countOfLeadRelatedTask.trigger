trigger countOfLeadRelatedTask on Task (after insert, after update, after delete, after undelete) {

    public Set<Id> leadid = new Set<Id>();
    public List<Lead> leadToBeUpdated = new List<Lead>();
    
    if(trigger.isInsert || trigger.isUpdate || trigger.isDelete || trigger.isunDelete) {
        
        for(Task t:trigger.new) {
            if(string.valueOf(t.whoid).startsWith('OOQ')) {
                leadid.add(t.whoid);
            }
        
        }
        
        if(leadid.size()>0) {
            for(lead l : [Select l.id, l.task_count__c, (select id from tasks where isclosed=false) from lead l where id in :leadid]) {
            
            
            }
        }
    
    }

}