public with sharing class actionController {

    public string str1{get;set;}
    private String state='no';
    public PageReference methodOne() {
        return null;
    }
    public String getState()
    {
    	return state;
    }
    public void setState(String n)
    {
    	state=n;
    }
     public String username { get; set; }

    public PageReference sayHello() {
        username=userInfo.getName();
        return null;
    }
    //========Action Function Methods===============//
    //====Saved through IDE//
    Private Integer count=0;
    
    public Integer getCount(){
    	return count;
    }
    
    public void incrementCounter(){
    
    	count++;
    }
   
   

}