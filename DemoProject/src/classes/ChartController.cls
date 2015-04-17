public class ChartController
{
    public list<data> getData()
    {
        return ChartController.getCharacterData();
    }
    @RemoteAction
    public static list<data> getRemoteData()
    {
        return ChartController.getCharacterData();
    }
    public Static list<data> getCharacterData()
    {
        list<data> da=new list<data>();
        da.add(new Data('jan',20,30,40));
        da.add(new Data('feb',30,40,50));
        da.add(new Data('march',50,30,40));
        da.add(new Data('june',20,30,40));
        return da;
    }
    
    
    //Wrapper Class
    public class Data{
      public String name{get;set;}
      public Integer data1{get;set;}
      public Integer data2{get;set;}
      public Integer data3{get;set;}
      
      public Data(String name,Integer data1,Integer data2,Integer data3)
      {
          this.name=name;
          this.data1=data1;
          this.data2=data2;
          this.data3=data3;
      }
    
    
    }
}