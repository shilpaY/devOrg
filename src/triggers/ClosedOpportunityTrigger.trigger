trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
    List<Task> taskLst = new List<Task>();
    for(Opportunity opp : Trigger.New) {
        if(opp.StageName =='Closed Won') {
            Task t = new Task(Subject='Follow Up Test Task');
            t.WhatId = opp.id;
            taskLst.add(t);
        }
    }
    insert taskLst;
}