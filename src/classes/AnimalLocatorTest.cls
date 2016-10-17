@isTest
public class AnimalLocatorTest {
    @isTest
    static void testAnimalLocator() {        
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String name = AnimalLocator.getAnimalNameById(0);
        System.assertEquals(name,'cat');

    }    
}