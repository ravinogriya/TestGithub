public with sharing class actionPollarController {
    public Integer value{get;set;}
    public actionPollarController()
    {
    value=1;
    }
    public PageReference timesTwo()
    {
    value*=2;
    addInfo('The value is'+value);
    return null;
    }
    public void addInfo(String msg)
    {
    ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.INFO,msg));
    }
}