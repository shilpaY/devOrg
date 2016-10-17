public class ParkLocator {
    public static String[] country(string countryName) {
        parkService.ParksImplPort parkServicecoun = new parkService.ParksImplPort();
        return parkServicecoun.byCountry(countryName);
    }
	
    
}