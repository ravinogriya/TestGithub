public with sharing class ImplSupervisorController {
    public list<user> id;
    public Map<Id,User> username;
    public Map<String,String> usernames{get;set;}
    public String JsonPhoto{get;set;}
    public list<LiveChatButtonSkill> buttons{get;set;}
    
    public PageReference onload() {
        usernames=new Map<String, String>();
        username=new Map<ID, User>([select smallphotourl from user where UserPermissionsLiveAgentUser=true]);
        
        for(Id s:username.keySet())
        {
            String ss=s+'';
            String user=username.get(s).smallphotourl+'';
            usernames.put(ss.subString(0,15),user);
        }
        
        JsonPhoto =JSON.serialize(usernames);

        return null;
    }
    
    
    
}