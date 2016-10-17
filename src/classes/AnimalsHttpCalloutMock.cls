@isTest
global class AnimalsHttpCalloutMock implements HttpCalloutMock {
	
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animals" : ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty mouse"]}');
        response.setStatusCode(200);
        return response;
    }
}