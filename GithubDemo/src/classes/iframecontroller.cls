public with sharing class iframecontroller {
  public string bodyString{get;set;}
    public PageReference pageload() {
    HttpRequest req = new HttpRequest();
     req.setEndpoint('https://ap1.salesforce.com/liveagent/supervisor.apexp?isdtp=vw');
     req.setMethod('GET');
    
     Http http = new Http();
     HTTPResponse res = http.send(req);
     bodyString=res.getBodyAsBlob().toString();
        return null;
    }


}