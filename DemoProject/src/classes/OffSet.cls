public class OffSet
{

  public Integer listSize = 10;
  public Integer totalsize;
  public Integer counter = 0;
  public boolean next{get;set;}
  public boolean previous{get;set;}
  public boolean first{get;set;}
  public boolean last{get;set;}
  
  public Offset()
  {
     previous = true;
     first = true; 
  }
  
  public List<case> getAccount()
  {
     
     return [select casenumber,id from case limit:listSize offset:counter];
  }
  
  public Integer getTotalSize()
  {
  
   return [select count() from case];
  }
 
  
  public PageReference next()
  {
  previous = false;
  first = false;
  last = false;
     if(counter == this.gettotalsize() - listsize)
     {
 
          next = true;
          last = true;
      }
  else
      counter = counter + listsize;
  return null;
  }
  
  public PageReference first()
  {
  
       counter = 0;
       first = true;
       last = false;
       previous = true;
       last = false;
       return null;
  }
  
  public PageReference previous()
  {
  first = false;
  last = false;
  next = false;
  if(counter == 0)
  {
      counter = listSize;
      previous = true;
      first = true;
      }
  else
      counter = counter - listsize;
  return null;
  
  }
  
  public PageReference last()
  {
  
       counter = this.getTotalSize() - listSize;
       last = true;
       first = false;
       previous = false;
       next = true;
       return null;
       
  }

}