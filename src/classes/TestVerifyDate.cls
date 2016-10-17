@isTest
public class TestVerifyDate {
    @isTest static void verifyDateTest() {
        VerifyDate.CheckDates(date.today(),date.today().addDays(20));
        VerifyDate.CheckDates(date.today(),date.today().addDays(40));
    }
    
}