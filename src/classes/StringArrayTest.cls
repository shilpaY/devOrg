public class StringArrayTest {
    
    public static List<String> generateStringArray(Integer count) {
        List<String> testList = new List<String>();
        String str = 'Test';
        for(integer i=0;i<=count-1;i++){
            testList.add(str + ' '+(i));
        }
        System.debug(testList);
        return testlist;
    }

}