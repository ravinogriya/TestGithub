public with sharing class UserInformationController {
 
 public void getUserInformation()
 {
     String name=UserInfo.getLastName();
     String SessionId=UserInfo.getSessionId();
     boolean flag=true;
     for (Custom__c custom : [SELECT Session__c from Custom__c])
     {
         if(custom.Session__c==SessionId)
         {
             flag=false;
             break;
         }
     }
     if(flag)
     {
         Custom__c customObject=new Custom__c();
         customObject.Session__c=SessionId;
         customObject.UserName__c=name;
         insert customObject;
     }
}
}