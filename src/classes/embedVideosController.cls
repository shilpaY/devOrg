public class embedVideosController {

    public List<VideosInfo__c> info {get;set;}
    public List<String> category{get;set;}
    public String ctgryValue{get;set;}
    
    public embedVideosController() {
        info = [select id, Title__c ,URL__c, category__c from Videosinfo__c];
        system.debug('videosinformation' + info); 
    }
    public PageReference getVideos() {
        system.debug('selctedcategoryValue' + ctgryValue);
        if(ctgryValue!='All') {                  
            info = [select id,Title__c, URL__c from Videosinfo__c where category__c = :ctgryValue];
            system.debug('infoCategory' + info);
        } else {
            info = [select id, Title__c ,URL__c, category__c from Videosinfo__c];
        }
        return null;
    }
}