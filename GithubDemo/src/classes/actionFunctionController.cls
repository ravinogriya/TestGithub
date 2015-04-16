public with sharing class actionFunctionController {
Public Integer value{get;set;}
public boolean flag1;
    public actionFunctionController()
    {
    value=1;
    
    }
    
    public PageReference twoTimes()
    {
    value+=2;
    addInfo('The result is value '+value);
    return null;  
    }
    
    public void addInfo(String msg)
    {
    ApexPages.addMessage(new ApexPages.Message(apexpages.severity.Info,msg));
    }
}