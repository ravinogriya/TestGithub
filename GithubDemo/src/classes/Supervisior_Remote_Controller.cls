global with sharing class Supervisior_Remote_Controller
{
    public static final String LIVEAGENT_API_VERSION
        = 'X-LIVEAGENT-API-VERSION';
    public static final String LIVEAGENT_AFFINITY
        = 'X-LIVEAGENT-AFFINITY';
    public static final String LIVEAGENT_SESSION_KEY
        = 'X-LIVEAGENT-SESSION-KEY';
    public static final String LIVEAGENT_SEQUENCE
        = 'X-LIVEAGENT-SEQUENCE';
    public static String lagent_session_id
    ;
    public static String lagent_agent_id;
    public static String lagent_affinityToken
    ;
    static HttpRequest lagent_http_req;
    static HTTPResponse lagent_http_res;
    static Http lagent_http;
    static  Agent__c agent;
    static SessionRes Seesresp;
    public static String result
    {
        get;
        set;
    }
    public static Map < String, String >
        str_list;
    public Supervisior_Remote_Controller()
    {
        System.debug(
            'Supervisior_Remote_Controller');
    }
    /*@RemoteAction
    global static void getSupervisior(String agentState){
  
      try{
          System.debug('agentState='+agentState);
         if(agentState!=null){
             
           if(agentState.equals('Online') && (!String.isEmpty(agentState))){
           
                 System.debug('agentState='+agentState);
                 
                lagent_http_req = new HttpRequest();
                
               lagent_http_req.setEndpoint('https://w4dq.la1t1.salesforceliveagent.com/chat/rest/System/SessionId');
               lagent_http_req.setMethod('GET');
               lagent_http_req.setHeader(LIVEAGENT_API_VERSION,'30');
               lagent_http_req.setHeader(LIVEAGENT_AFFINITY,'null');
               
               lagent_http   = new Http();
               lagent_http_res = lagent_http.send(lagent_http_req);
               String result= lagent_http_res.getBody();
               System.debug('Online result='+result);
               if(result!=null){
                  
                    if(!String.isEmpty(result)){
                    
                      Seesresp=(SessionRes)JSON.deserialize(result,SessionRes.class);
                       System.debug('Seesresp.key='+Seesresp.key);
                      lagent_session_id = Seesresp.key;
                      lagent_agent_id = Seesresp.id;
                      lagent_affinityToken = Seesresp.affinityToken;
                      
                      lagent_http_req = new HttpRequest();
                      lagent_http_req.setEndpoint('https://w72e.la1t1.salesforceliveagent.com/chat/rest/Agent/AgentLogin');
                      lagent_http_req.setMethod('POST');
                      lagent_http_req.setHeader(LIVEAGENT_API_VERSION,'30');
                      lagent_http_req.setHeader(LIVEAGENT_AFFINITY,Seesresp.affinityToken);
                      lagent_http_req.setHeader(LIVEAGENT_SESSION_KEY,Seesresp.key);
                      lagent_http_req.setHeader(LIVEAGENT_SEQUENCE,'1');
                      lagent_http_req.setBody('{"organizationId": "00D90000000xZQM" ,"sfdcSessionId":"{!$Api.Session_ID}"}');
                      lagent_http    = new Http();
                      lagent_http_res = lagent_http.send(lagent_http_req);
                       System.debug(lagent_http_res.getBody());
                       String res = lagent_http_res.getBody();
                       System.debug('res='+res);
                       if(res=='OK'){
                       
                          
                          agent = new  Agent__c();
                          agentSession_ID__c = Seesresp.key;
                          agent Agent_Status__c = agentState;
                          agent Agent_ID__c = Seesresp.id;
                          insert agent;
                          
                       }
                    }
                  
                  }
              
           }else if(agentState.equals('Offline') && (!String.isEmpty(agentState))){
           
               System.debug('agentState='+agentState);
               System.debug('lagent_affinityToken='+lagent_affinityToken);
                  lagent_http_req = new HttpRequest();
                  lagent_http_req.setEndpoint('https://w8ba.la1t1.salesforceliveagent.com/chat/rest/Supervisor/AgentLogout');
                  lagent_http_req.setMethod('POST');
                  lagent_http_req.setHeader(LIVEAGENT_API_VERSION,'30');
                  lagent_http_req.setHeader(LIVEAGENT_AFFINITY,lagent_affinityToken);
                  lagent_http_req.setHeader(LIVEAGENT_SESSION_KEY,lagent_session_id);
                  lagent_http_req.setHeader(LIVEAGENT_SEQUENCE,'1');
                  lagent_http_req.setBody('{"agentId": '+'"'+lagent_agent_id+'"'+'}');
                  lagent_http  = new Http();
                  lagent_http_res = lagent_http.send(lagent_http_req);
                  System.debug(lagent_http_res.getBody());
                  String res = lagent_http_res.getBody();
                  
                            if(res=='OK'){
                            
                              agent = new  Agent__c();
                              agentSession_ID__c = lagent_session_id;
                              agent Agent_Status__c = agentState;
                              agent Agent_ID__c = lagent_agent_id;
                              
                              update agent;
                            }
           
           }else if(agentState.equals('Away') && (!String.isEmpty(agentState))){
           
                  System.debug('agentState='+agentState);
                  System.debug('lagent_affinityToken='+lagent_affinityToken);
                  lagent_http_req  = new HttpRequest();
                  lagent_http_req.setEndpoint('https://w8ba.la1t1.salesforceliveagent.com/chat/rest/Supervisor/AgentStatus');
                  lagent_http_req.setMethod('POST');
                  lagent_http_req.setHeader(LIVEAGENT_API_VERSION,'30');
                  lagent_http_req.setHeader(LIVEAGENT_AFFINITY,lagent_affinityToken);
                  lagent_http_req.setHeader(LIVEAGENT_SESSION_KEY,lagent_session_id);
                  lagent_http_req.setHeader(LIVEAGENT_SEQUENCE,'1');
                  lagent_http_req.setBody('{"agentId":'+'"'+lagent_agent_id+'"'+' ,"Status":"Away"}');
                  lagent_http  = new Http();
                  lagent_http_res  = lagent_http.send(lagent_http_req);
                  System.debug(lagent_http_res.getBody());
                  String res = lagent_http_res.getBody();
                   
                    if(res=='OK'){
                    
                          agent = new  Agent__c();
                          agentSession_ID__c = lagent_session_id;
                          agent Agent_Status__c = agentState;
                          agent Agent_ID__c = lagent_agent_id;
                                  
                          update agent;
                    
                    } 
                  
           
           }
       }
       
      }catch(Exception e){
      
         System.debug('Exception='+e);
         System.debug(e.getStackTraceString());
         System.debug(e.getLineNumber());
      } 
  
    }
  
  
    @RemoteAction
    global static void get Agent(String agentState){
  
          System.debug('agentState='+agentState);
          
        if(agentState!=null){
             
           if(agentState.equals('Online') && (!String.isEmpty(agentState))){
           
                 System.debug('agentState='+agentState);
                 
               lagent_http_req = new HttpRequest();
                
               lagent_http_req.setEndpoint('https://w4dq.la1t1.salesforceliveagent.com/chat/rest/System/SessionId');
               lagent_http_req.setMethod('GET');
               lagent_http_req.setHeader(LIVEAGENT_API_VERSION,'30');
               lagent_http_req.setHeader(LIVEAGENT_AFFINITY,'null');
               
               lagent_http   = new Http();
               lagent_http_res = lagent_http.send(lagent_http_req);
               String result= lagent_http_res.getBody();
               System.debug('Online result='+result);
               if(result!=null){
                  
                    if(!String.isEmpty(result)){
                    
                      Seesresp=(SessionRes)JSON.deserialize(result,SessionRes.class);
                       System.debug('Seesresp.key='+Seesresp.key);
                      lagent_session_id = Seesresp.key;
                      lagent_agent_id = Seesresp.id;
                      lagent_affinityToken = Seesresp.affinityToken;
                      lagent_http_req = new HttpRequest();
                      lagent_http_req.setEndpoint('https://w72e.la1t1.salesforceliveagent.com/chat/rest/Agent/AgentLogin');
                      lagent_http_req.setMethod('POST');
                      lagent_http_req.setHeader(LIVEAGENT_API_VERSION,'30');
                      lagent_http_req.setHeader(LIVEAGENT_AFFINITY,Seesresp.affinityToken);
                      lagent_http_req.setHeader(LIVEAGENT_SESSION_KEY,Seesresp.key);
                      lagent_http_req.setHeader(LIVEAGENT_SEQUENCE,'1');
                      lagent_http_req.setBody('{"organizationId": "00D90000000xZQM" ,"sfdcSessionId":"{!$Api.Session_ID}"}');
                      lagent_http    = new Http();
                      lagent_http_res = lagent_http.send(lagent_http_req);
                       System.debug(lagent_http_res.getBody());
                       String res = lagent_http_res.getBody();
                       System.debug('res='+res);
                       if(res=='OK'){
                       
                          
                          agent = new  Agent__c();
                          agentSession_ID__c = Seesresp.key;
                          agent Agent_Status__c = agentState;
                          agent Agent_ID__c = Seesresp.id;
                          insert agent;
                          
                       }
                    }
                  
                  }
              
              
           }else if(agentState.equals('Offline') && (!String.isEmpty(agentState))){
           
               System.debug('agentState='+agentState);
                  lagent_http_req = new HttpRequest();
                  lagent_http_req.setEndpoint('https://w8ba.la1t1.salesforceliveagent.com/chat/rest/Supervisor/AgentLogout');
                  lagent_http_req.setMethod('POST');
                  lagent_http_req.setHeader(LIVEAGENT_API_VERSION,'30');
                  lagent_http_req.setHeader(LIVEAGENT_AFFINITY,lagent_affinityToken);
                  lagent_http_req.setHeader(LIVEAGENT_SESSION_KEY,lagent_session_id);
                  lagent_http_req.setHeader(LIVEAGENT_SEQUENCE,'1');
                  lagent_http_req.setBody('{"agentId": '+'"'+lagent_agent_id+'"'+'}');
                  lagent_http  = new Http();
                  lagent_http_res = lagent_http.send(lagent_http_req);
                  System.debug(lagent_http_res.getBody());
                  String res = lagent_http_res.getBody();
                  
                            if(res=='OK'){
                            
                              agent = new  Agent__c();
                              agentSession_ID__c = lagent_session_id;
                              agent Agent_Status__c = agentState;
                              agent Agent_ID__c = lagent_agent_id;
                              
                              update agent;
                            }
           
           }else if(agentState.equals('Away') && (!String.isEmpty(agentState))){
           
                  System.debug('agentState='+agentState);
                  
                  lagent_http_req  = new HttpRequest();
                  lagent_http_req.setEndpoint('https://w8ba.la1t1.salesforceliveagent.com/chat/rest/Supervisor/AgentStatus');
                  lagent_http_req.setMethod('POST');
                  lagent_http_req.setHeader(LIVEAGENT_API_VERSION,'30');
                  lagent_http_req.setHeader(LIVEAGENT_AFFINITY,lagent_affinityToken);
                  lagent_http_req.setHeader(LIVEAGENT_SESSION_KEY,lagent_session_id);
                  lagent_http_req.setHeader(LIVEAGENT_SEQUENCE,'1');
                  lagent_http_req.setBody('{"agentId":'+'"'+lagent_agent_id+'"'+' ,"Status":"Away"}');
                  lagent_http  = new Http();
                  lagent_http_res  = lagent_http.send(lagent_http_req);
                  System.debug(lagent_http_res.getBody());
                  String res = lagent_http_res.getBody();
                   
                    if(res=='OK'){
                    
                          agent = new  Agent__c();
                          agentSession_ID__c = lagent_session_id;
                          agent Agent_Status__c = agentState;
                          agent Agent_ID__c =lagent_agent_id;
                                  
                          update agent;
                    
                    } 
                  
           
           }
       }
      } */
    @
    RemoteAction
    global static Map < String, String >
        getAgentDetails(String agentState)
        {
            System.debug('agentState=' +
                agentState);
            try
            {
                if (agentState != null)
                {
                    if (agentState.equals('Online') &&
                        (!String.isEmpty(agentState)))
                    {
                        System.debug('agentState=' +
                            agentState);
                        lagent_http_req = new HttpRequest();
                        lagent_http_req.setEndpoint(
                            'https://w4dq.la1t1.salesforceliveagent.com/chat/rest/System/SessionId'
                        );
                        lagent_http_req.setMethod('GET');
                        lagent_http_req.setHeader(
                            LIVEAGENT_API_VERSION, '32');
                        lagent_http_req.setHeader(
                            LIVEAGENT_AFFINITY, 'null');
                        lagent_http = new Http();
                        lagent_http_res = lagent_http.send(
                            lagent_http_req);
                        result = lagent_http_res.getBody();
                        System.debug('Online result=' +
                            result);
                        if (result != null)
                        {
                            if (!String.isEmpty(result))
                            {
                                str_list = new Map < String,
                                    String > ();
                                Seesresp = (SessionRes) JSON.deserialize(
                                    result, SessionRes.class);
                                System.debug('Seesresp.key=' +
                                    Seesresp.key);
                                lagent_session_id = Seesresp.key;
                                lagent_agent_id = Seesresp.id;
                                lagent_affinityToken = Seesresp
                                    .affinityToken;
                                str_list.put('key',
                                    lagent_session_id);
                                str_list.put('id',
                                    lagent_agent_id);
                                str_list.put('affinityToken',
                                    lagent_affinityToken);
                                lagent_http_req = new HttpRequest();
                                lagent_http_req.setEndpoint(
                                    'https://w72e.la1t1.salesforceliveagent.com/chat/rest/Agent/AgentLogin'
                                );
                                lagent_http_req.setMethod(
                                    'POST');
                                lagent_http_req.setHeader(
                                    LIVEAGENT_API_VERSION, '32');
                                lagent_http_req.setHeader(
                                    LIVEAGENT_AFFINITY, Seesresp.affinityToken
                                );
                                lagent_http_req.setHeader(
                                    LIVEAGENT_SESSION_KEY,
                                    Seesresp.key);
                                lagent_http_req.setHeader(
                                    LIVEAGENT_SEQUENCE, '1');
                                lagent_http_req.setBody(
                                    '{"organizationId": "00D90000000xZQM" ,"sfdcSessionId":"{!$Api.Session_ID}"}'
                                );
                                lagent_http = new Http();
                                lagent_http_res = lagent_http.send(
                                    lagent_http_req);
                                System.debug(lagent_http_res.getBody());
                                String res = lagent_http_res.getBody();
                                System.debug('res=' + res);
                                agent = new  Agent__c();
                                agent.Session_ID__c =
                                    Seesresp.key;
                                agent.Agent_Status__c =
                                    agentState;
                                agent.Agent_ID__c =
                                    Seesresp.id;
                                agent.Agent_Name__c =
                                    UserInfo.getName();
                                agent.User_agent_id__c =UserInfo.getUserId();
                                agent.IsActive__c =true;
                                insert agent;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
                System.debug('Exception=' + e);
            }
            return str_list;
        }
    @
    RemoteAction
    global static void getSupervisiorAgentOffline
        (String agentState, String sess_details)
        {
            System.debug('agentState=' +
                agentState);
            System.debug('sess_details=' +
                sess_details);
            if (agentState == 'Offline' &&
                sess_details != null)
            {
                Seesresp = (SessionRes) JSON.deserialize(
                    sess_details, SessionRes.class);
                lagent_http_req = new HttpRequest();
                lagent_http_req.setEndpoint(
                    'https://xdk4.la1t1.salesforceliveagent.com/chat/rest/Supervisor/AgentLogout'
                );
                lagent_http_req.setMethod('POST');
                lagent_http_req.setHeader(
                    LIVEAGENT_API_VERSION, '32');
                lagent_http_req.setHeader(
                    LIVEAGENT_AFFINITY, Seesresp.affinityToken
                );
                lagent_http_req.setHeader(
                    LIVEAGENT_SESSION_KEY, Seesresp.key
                );
                lagent_http_req.setHeader(
                    LIVEAGENT_SEQUENCE, '2');
                lagent_http_req.setBody(
                    '{"agentId": ' + '"' + Seesresp.id +
                    '"' + '}');
                lagent_http = new Http();
                lagent_http_res = lagent_http.send(
                    lagent_http_req);
                System.debug(lagent_http_res.getBody());
                String res = lagent_http_res.getBody();
                if (res == 'OK')
                {
                    System.debug('res=' + res);
                    agent = new  Agent__c();
                    agent.Session_ID__c =
                        Seesresp.key;
                    agent.Agent_Status__c =
                        agentState;
                    agent.Agent_ID__c =
                        Seesresp.id;
                    agent.IsActive__c =
                        false;
                    //delete agent;
                }
            }
        }
    @
    RemoteAction
    global static void getSupervisiorAway(
        String agentState, String sess_details
    )
    {
        System.debug('agentState=' +
            agentState);
        System.debug('sess_details=' +
            sess_details);
        if (agentState == 'Away')
        {
            Seesresp = (SessionRes) JSON.deserialize(
                sess_details, SessionRes.class);
            lagent_http_req = new HttpRequest();
            lagent_http_req.setEndpoint(
                'https://w8ba.la1t1.salesforceliveagent.com/chat/rest/Supervisor/AgentStatus'
            );
            lagent_http_req.setMethod('POST');
            lagent_http_req.setHeader(
                LIVEAGENT_API_VERSION, '32');
            lagent_http_req.setHeader(
                LIVEAGENT_AFFINITY, Seesresp.affinityToken
            );
            lagent_http_req.setHeader(
                LIVEAGENT_SESSION_KEY, Seesresp.key
            );
            lagent_http_req.setHeader(
                LIVEAGENT_SEQUENCE, '1');
            lagent_http_req.setBody(
                '{"agentId":' + '"' + Seesresp.id +
                '"' + ' ,"Status":"Away"}');
            lagent_http = new Http();
            lagent_http_res = lagent_http.send(
                lagent_http_req);
            System.debug(lagent_http_res.getBody());
            String res = lagent_http_res.getBody();
            if (res == 'OK')
            {
                System.debug('res=' + res);
                agent = new Agent__c();
                agent.Session_ID__c =
                    Seesresp.key;
                agent.Agent_Status__c =
                    agentState;
                agent.Agent_ID__c =
                    Seesresp.id;
                agent.IsActive__c =
                    true;
                // update agent;
            }
        }
    }
    @
    RemoteAction
    global static void getAgentDelete(
        String agentState, String sess_details
    )
    {
        System.debug('agentState=' +
            agentState);
        System.debug('sess_details=' +
            sess_details);
        if (agentState == 'Offline')
        {
            Seesresp = (SessionRes) JSON.deserialize(
                sess_details, SessionRes.class);
            lagent_http_req = new HttpRequest();
            lagent_http_req.setEndpoint(
                'https://xbrg.la1t1.salesforceliveagent.com/chat/rest/System/SessionId/' +
                Seesresp.key);
            lagent_http_req.setMethod('DELETE');
            lagent_http_req.setHeader(
                LIVEAGENT_API_VERSION, '32');
            lagent_http_req.setHeader(
                LIVEAGENT_AFFINITY, Seesresp.affinityToken
            );
            lagent_http = new Http();
            lagent_http_res = lagent_http.send(
                lagent_http_req);
            System.debug(lagent_http_res.getBody());
            String res = lagent_http_res.getBody();
            if (res == 'OK')
            {
                System.debug('res=' + res);
                agent = new Agent__c();
                agent.Session_ID__c =
                    Seesresp.key;
                agent.Agent_Status__c =
                    agentState;
                agent.Agent_ID__c =
                    Seesresp.id;
                agent.IsActive__c =
                    true;
                // Delete agent;
            }
        }
    }
    @
    RemoteAction
    global static void getAgentAway(String agentState,
        String sess_details)
    {
        System.debug('agentState=' +
            agentState);
        System.debug('sess_details=' +
            sess_details);
        if (agentState == 'Away')
        {
            Seesresp = (SessionRes) JSON.deserialize(
                sess_details, SessionRes.class);
            lagent_http_req = new HttpRequest();
            lagent_http_req.setEndpoint(
                'https://xbrg.la1t1.salesforceliveagent.com/chat/rest/Agent/Status'
            );
            lagent_http_req.setMethod('POST');
            lagent_http_req.setHeader(
                LIVEAGENT_API_VERSION, '32');
            lagent_http_req.setHeader(
                LIVEAGENT_AFFINITY, Seesresp.affinityToken
            );
            lagent_http_req.setHeader(
                LIVEAGENT_SESSION_KEY, Seesresp.key
            );
            lagent_http_req.setHeader(
                LIVEAGENT_SEQUENCE, '1');
            lagent_http_req.setBody(
                '{"status":"Away"}');
            lagent_http = new Http();
            lagent_http_res = lagent_http.send(
                lagent_http_req);
            System.debug(lagent_http_res.getBody());
            String res = lagent_http_res.getBody();
            if (res == 'OK')
            {
                System.debug('res=' + res);
                agent = new  Agent__c();
                agent.Session_ID__c =
                    Seesresp.key;
                agent.Agent_Status__c =
                    agentState;
                agent.Agent_ID__c =
                    Seesresp.id;
                agent.IsActive__c =
                    true;
                // update agent;
            }
        }
    }
    Class SessionRes
    {
        String clientPollTimeout
        {
            get;
            set;
        }
        String key
        {
            get;
            set;
        }
        String affinityToken
        {
            get;
            set;
        }
        String id
        {
            get;
            set;
        }
    }
}