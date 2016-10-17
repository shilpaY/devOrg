public class NewCaseListController {

    //public List<Case> newCases{get;set;}
    public List<Case> getNewCases() {
        List<Case> newCases = [select id, CaseNumber from Case c where c.Status ='New'];
        system.debug('cases' + newCases);
        return newCases;    
    }
}