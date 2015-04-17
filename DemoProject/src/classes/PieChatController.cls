public class PieChatController
{
 public List<PieWedgeData> getPieData(){
 List<PieWedgeData> data=new List<PieWedgeData>();
 List<Account> acc=new List<Account>();
 acc=[SELECT Name,NumberOfEmployees FROM Account]; 
     data.add(new PieWedgeData(acc.get(3).Name,acc.get(3).NumberOfEmployees));
     data.add(new PieWedgeData(acc.get(6).Name,acc.get(6).NumberOfEmployees));
     data.add(new PieWedgeData(acc.get(3).Name,acc.get(3).NumberOfEmployees));
 
     data.add(new PieWedgeData(acc.get(5).Name,acc.get(5).NumberOfEmployees));
      data.add(new PieWedgeData(acc.get(6).Name,acc.get(6).NumberOfEmployees));
     return data;
 
 }
 //Wrapper Class
 public class PieWedgeData
 {
   public String name{get;set;}
   public Integer data{get;set;}
   
   public PieWedgeData(String name,Integer data)
   {
       this.name = name;
       this.data = data;
   }
 
 }
}