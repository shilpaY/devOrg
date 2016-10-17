public class accConOppContr {
    public List<Contact> conts{get;set;}
    public List<Opportunity> opps{get;set;}
    public Id accountId {get;set;}
    //Variables used for Pagination
    private integer totalRecs = 0;
    private integer OffsetSize = 0;
    private integer LimitSize= 5;
    //Variables used for contact Pagination
    private integer totalRecsCon = 0;
    private integer OffsetSizeCon = 0;
    private integer LimitSizeCon = 5;
    //Varialbes used for Opportunity Pagination
    private integer totalRecsOpp = 0;
    private integer OffsetSizeOpp = 0;
    private integer LimitSizeOpp = 5;
    
    public accConOppContr() {
        totalRecs = [select count() from account];
    }

    public List<account> getacclist() {
        List<account> acc = Database.Query('SELECT id, Name FROM account LIMIT :LimitSize OFFSET :OffsetSize');
        return acc;
    }
    // Methods for Pagination of accounts
    public void firstPage() {
        OffsetSize = 0;
    }
    public void previous(){
        OffsetSize = OffsetSize - LimitSize;
    }
    public void next() {
        OffsetSize = OffsetSize + LimitSize;
    }
    public void lastPage() {
        OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
    }
    public boolean getprev() {
        if(OffsetSize == 0)
        return true;
        else
        return false;
    }
    public boolean getnxt() {
        if((OffsetSize + LimitSize) > totalRecs)
        return true;
        else
        return false;
    }
    //Methods for pagination of contacts
    public PageReference getContOpp() {
        conts = Database.Query('select id, accountid, name from contact where accountid = : accountId LIMIT :LimitSizeCon OFFSET :OffsetSizeCon');
        opps = Database.Query('select id, accountid, name from opportunity where accountid = :accountId LIMIT :LimitSizeOpp OFFSET :OffsetSizeOpp');
        //conts = getconlist();
        //opps = getopplist();
        totalRecsCon = [select count() from contact where accountid = : accountId];
        totalRecsOpp = [select count() from opportunity where accountid = : accountId];
        
        return null;    
    } 
    /*public List<contact> getconlist() {
        List<contact> con = Database.Query('select id, accountid, name from contact where accountid = : accountId LIMIT :LimitSize OFFSET :OffsetSize');
        return con;
    }*/
    public void firstPageCon() {
        OffsetSizeCon = 0;
        getContOpp();
    }
    public void previousCon(){
        OffsetSizeCon = OffsetSizeCon - LimitSizeCon;
        getContOpp();
    }
    public void nextCon() {
        OffsetSizeCon = OffsetSizeCon + LimitSizeCon;
        getContOpp();
    }
    public void lastPageCon() {
        OffsetSizeCon = totalrecsCon - math.mod(totalRecsCon,LimitSizeCon);
        getContOpp();
    }
    public boolean getprevCon() {
        if(OffsetSizeCon == 0)
        return true;
        else
        return false;
    }
    public boolean getnxtCon() {
        if((OffsetSizeCon + LimitSizeCon) > totalRecsCon)
        return true;
        else
        return false;
    }
    
    //Methods for pagination of opportunity
    /*public List<opportunity> getopplist() {
        List<opportunity> op = Database.Query('select id, accountid, name from opportunity where accountid = :accountId LIMIT :LimitSize OFFSET :OffsetSize');
        return op;
    }*/
    public void firstPageOpp() {
        OffsetSizeOpp = 0;
        getContOpp();
    }
    public void previousOpp(){
        OffsetSizeOpp = OffsetSizeOpp - LimitSizeOpp;
        getContOpp();
    }
    public void nextOpp() {
        OffsetSizeOpp = OffsetSizeOpp + LimitSizeOpp;
        getContOpp();
    }
    public void lastPageOpp() {
        OffsetSizeOpp = totalrecsOpp - math.mod(totalRecsOpp,LimitSizeOpp);
        getContOpp();
    }
    public boolean getprevOpp() {
        if(OffsetSizeOpp == 0)
        return true;
        else
        return false;
    }
    public boolean getnxtOpp() {
        if((OffsetSizeOpp + LimitSizeOpp) > totalRecsOpp)
        return true;
        else
        return false;
    }
     
 
    public PageReference cancel () {
        PageReference pageRef = new PageReference(ApexPages.currentPage().getUrl());
        pageRef.setRedirect(true);
        return pageRef;
    }
}