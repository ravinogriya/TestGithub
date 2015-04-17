public class StringArrayTest{

    public static string[] generateStringArray(integer no_of_elements)
    {
    String[] str = new List<String>();
    for(integer i=0;i<no_of_elements;i++)
        str.add('Test ' + i);
    return str;
    }


}