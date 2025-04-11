component extends="CFIDE.websocket.ChannelListener" {

    public boolean function allowSubscribe(struct subscriberInfo) {
        if(!structKeyExists(arguments.subscriberInfo,"username")) return false;
        
        //Pobre bob
        if(arguments.subscriberInfo.username == "bob") return false; 
        return true; 
    
    } 
    public any function beforePublish(any message, struct subscriberInfo) {
        arguments.message = reReplace(arguments.message, "<.*?>","","all");
        return arguments.message;
    } 
    
    public any function canSendMessage(any message, struct subscriberInfo, struct publisherInfo) {
        if(findNoCase("darn", arguments.message) && subscriberInfo.username == "mary") 
            return false;
        return true;
    } 
    
    public any function beforeSendMessage(any message, struct subscriberInfo, struct publisherInfo) {
        message = "For #arguments.subscriberInfo.username#: " & arguments.message;
        return message; 
    
    } 
    public any function afterUnsubscribe(struct subscriberInfo) {
        wsPublish("news", "#arguments.subscriberInfo.username# deixou o aplicativo."); 
        return true;
        }
    }