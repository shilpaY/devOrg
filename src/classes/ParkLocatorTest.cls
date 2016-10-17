@isTest
private class ParkLocatorTest {
	@isTest
    static void testLocator() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] result = ParkLocator.country('India');
        String[] expectedResult = new String[] {'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'};
        System.assertEquals(expectedResult, result);
    }
}