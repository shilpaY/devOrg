@isTest
global class ParkServiceMock implements WebServiceMock {
	global void doInvoke(Object stub,Object request,Map<String,Object> response, String endpoint,String soapAction, String requestName,String responseNS,String responseName,String responseType) {
        parkService.byCountryResponse response_x = new parkService.byCountryResponse();
        String[] parksList = new String[]{'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'};
        response_x.return_x = parkslist;
        response.put('response_x', response_x);
    }
}