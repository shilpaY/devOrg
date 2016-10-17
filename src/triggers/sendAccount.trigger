trigger sendAccount on Account (after insert) {
    for(Account a: Trigger.new) {
        SendAccountFromSource.createAccount(a.name,a.Id);
    }

}