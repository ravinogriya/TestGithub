public with sharing class ObjectRetreieve {

  public String SelectedObject{get;set;}

  public void getStore()
  {
    
  }
  
 Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
 
      public List<SelectOption> getObjectName()
      {
            List<Schema.SObjectType> gd = schemaMap.Values();
            List<SelectOption> options = new List<SelectOption>();
            Set<String> st = new Set<String>();
            for(String s:Schema.getGlobalDescribe().keySet())
            {
              if(s.startsWith('rc01'))
              st.add(s);
            }
           // System.debug('value in'+st);
            options.add(new SelectOption('--None','--None--'));
            for(Schema.SObjectType f : gd)
            {
                if(!f.getDescribe().getName().contains('__c'))
                    options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getLabel()));
                    
                   options.sort();
     
            }
           
           //System.debug(options);
        return options;
       }

       public List<SelectOption> getFieldName()
       {
       List<SelectOption> fieldNames = new List<SelectOption>();
       if(selectedObject != null)
       {
           
           Schema.SObjectType ObjectSchema = schemaMap.get(selectedObject);
           if(ObjectSchema != null)
           {
               Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
               List<Schema.SObjectField> fieldList = fieldMap.Values();
               
               for(Schema.SObjectField feildname : fieldList)
               {
               fieldNames.add(new SelectOption(feildname.getDescribe().getName(),feildname.getDescribe().getName()));
                  
               }
           }
         else 
          fieldNames.add(new SelectOption('--None--','--None--')); 
        }
        else 
          fieldNames.add(new SelectOption('--None--','--None--')); 
          fieldNames.sort();
        return fieldNames;
       }
       
       
}