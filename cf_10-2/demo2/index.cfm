<!DOCTYPE html>
<html>

<head>
<title>Exemplo Dois</title>

    <script language="javascript">
        function messageHandler(msg) {
            console.log("messageHandler Run");
            console.dir(msg);

            if(msg.reqType == "getSubscriberCount") {
                document.querySelector("#subscriberCount").innerHTML = "Existem "+msg.subscriberCount + " subscriber(s)."; 

            } 
            if(msg.type == "data") {
            document.querySelector("#messageResponseArea").innerHTML += msg.data + "<br/>";
            } 
        }

        function init() {

            console.log('init');

            //Manipule a solicitação para obter a contagem de assinantes
            document.querySelector("#subscriberButton").addEventListener("click", function() {
                myWS.getSubscriberCount("news");
            },false);

            //Handle message send test
            document.querySelector("#messageButton").addEventListener("click", function() {
                var text = document.querySelector("#message").value;
                myWS.publish("news", text);
            },false); 

        }

    </script>
</head>

<body onload="init()">

    <h1>Exemplo Dois</h1>

    <p>
        <input type="text" id="message"> 
        <button id="messageButton">Send Message</button>
        <div id="messageResponseArea">
            
        </div>
    </p>

    <p>
        <button id="subscriberButton">Obter contagem de assinantes</button>
        <div id="subscriberCount">

        </div>
    </p>

</body>
</html>

<cfwebsocket name="myWS" onMessage="messageHandler" subscribeTo="news">