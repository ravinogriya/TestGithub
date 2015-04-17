public class opportunityList2Con {

    public List<Case> getCases() {
        return (List<Case>) setCase.getRecords();
    }

    // ApexPages.StandardSetController must be instantiated
    // for standard list controllers
    public ApexPages.StandardSetController setCase {
        get {
            if(setCase == null) {
                setCase = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT subject, casenumber FROM Case]));
                 setCase.setPageSize(5);
            }
            return setCase;
        }
        set;
    }
   public void Next(){
       setCase.next();
      
   }
   public void Previous(){
         setCase.previous();
   }
   public void First(){
        setCase.First();
   }
   public void Last(){
       setCase.Last();
   }
 
}