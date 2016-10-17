public class AnimalLocator {
    
    public static String  getAnimalNameById(Integer id) {
        system.debug('integer value' + id);
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String name;
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
		request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    		Map<String,Object> animals = (Map<String,Object>)results.get('animal');            
    		name = String.valueOf(animals.get('name'));
        }
        return name;
    }
}