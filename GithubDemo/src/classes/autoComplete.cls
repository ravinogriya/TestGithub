public with sharing class autoComplete {

    public map<String,String> finalMap{get;set;}
    public String store{get;set;}
    Integer inte{get;set;}
    public autoComplete()
    {
         finalMap=new Map<String,String>();
                
         Map<Id,KnowledgeArticleVersion> dup=new Map<ID,KnowledgeArticleVersion>([SELECT UrlName,ArticleType FROM KnowledgeArticleVersion WHERE PublishStatus='online' AND language ='en_US']); 
             
         for(String s:dup.keyset())
         {
              finalMap.put(dup.get(s).UrlName,dup.get(s).ArticleType);
         }
         store=JSON.serialize(finalMap);
    
    }
    
    public String myList { get{
        
        String mylist = '';
         
        for(string name : finalMap.keyset())
        {
            mylist = mylist+'"'+name+'"'+',';
           
        }
        return mylist;
         
    } set; }
    
}