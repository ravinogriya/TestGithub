public class AwesomeController
{
 @AuraEnabled
 public static List<product__C> getProducts()
 {
  return [select id,name,rc01__photo__c,rc01__description__c,rc01__points__c from rc01__Product__c];
 
 }
 @AuraEnabled
 public static Product__c getProductByName(String name){
  System.debug(name);
 return [select id,name,photo__c,color__c,description__c,points__c,(select name from rc01__product_sizes__r order by name) from rc01__product__c where name =: name];
 
 }


}