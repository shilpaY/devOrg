@RestResource(urlMapping='/Cases/*')

global with sharing class CaseManager {
    
    @HttpGet
    global static Case getCaseById() {
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case result = [select caseNumber, subject, status, origin, priority from case where id =:caseId];
        return result;        
    }
    @HttpPost
    global static ID createCase (String subject, String status, String origin, String priority) {
        Case thisCase = new Case(subject=subject, status=status, origin=origin, priority=priority);
        insert thisCase;
        return thisCase.id;        
    }
    @HttpDelete
    global static void deleteCase() {
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case thisCase = [select Id from case where Id = :caseId];
        delete thisCase;             
    }    
    @HttpPut
    global static ID upsertCase(String subject, String status, String origin, String priority, String id) {
 		Case thisCase = new Case(Id=id,subject=subject, status=status, origin=origin, priority=priority);
        upsert thisCase;
        return thisCase.id;
    }
    @HttpPatch
    global static ID updateCaseFields() {
        RestRequest request = RestContext.request;
        String caseId = request.params.get('id');
        Case thisCase = [select id from Case where id=:caseId];
        Map<String, String> params = request.params;
        for(String fieldName : params.keySet()) {
            thisCase.put(fieldName,params.get(fieldName));
        }
		update thisCase;
        return thisCase.id;
        
    }
}