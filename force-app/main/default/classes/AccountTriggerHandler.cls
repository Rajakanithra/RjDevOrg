public without sharing class AccountTriggerHandler implements TriggerHandler {
private boolean triggerIsExecuting;
    private integer triggerSize;
    public AccountTriggerHelper helper;
    public AccountTriggerHandler(boolean triggerIsExecuting, integer triggerSize) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
        this.helper = new AccountTriggerHelper();
    }
    public void beforeInsert(List<Account> newAccounts) {
        helper.doTask1();
        //helper.doTask2();
    }
}