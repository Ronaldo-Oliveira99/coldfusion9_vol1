<!DOCTYPE html>
<html>

    <head>
        <title>Exemple Five</title>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script language="javascript">

            var subscribedChannel; 
            
            function messageHandler(msg) {
                console.log("messageHandler Run");
                console.dir(msg);
            
                if(msg.type == "response" && msg.reqType == "subscribe") {
                    $("#stepone").hide();
                    $("#chattest").show();
                    $("#messageButton").on("click", function () {
                        var msg = $("#message").val();

                        if(msg == '') return;
                            myWS.publish(subscribedChannel, msg); 
                    })
                }
                
                if(msg.type == "data") {
                    $("#messageResponseArea").append(msg.data + "<br/>");
                } 
            }
            
            $(document).ready(function() {
            
                //Handle message send test
                $("#signinButton").on("click", function() {
                    var name =$("#name").val();
                    
                    subscribedChannel = $("#newstype option:selected").val();

                    if(name.length) {
                        myWS.subscribe(subscribedChannel,{username:name})
                    }
                });
            
            }); 
        
        </script>
    </head>
        
    <body>
        
        <h1>Exemplo Five</h1>
        
        <div id="stepone">
            <input type="text" id="name" placeholder="Your Name:">
            <select id="newstype">
                <option value="news">All News</option>
                <option value="news.tech">Tech News</option> 
                <option value="news.sports">Sports News</option>
                <option value="news.sports.football">Sports(Football) News</option>
            </select>
            <button id="signinButton">Sign In</button>
        
        </div>
        
        <div id="chattest" style="display:none">
        <p>
        <input type="text" id="message"> 
        <button id="messageButton">Send Message</button>
        <div id="messageResponseArea"></div>
        </p>
        </div>
        
    </body>
</html>
<cfwebsocket name="myWS" onMessage="messageHandler">