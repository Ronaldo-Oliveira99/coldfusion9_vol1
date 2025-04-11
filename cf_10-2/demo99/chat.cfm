<cfwebsocket 
    name="ws" 
    subscribeTo="chatChannel" 
    onmessage="receiveMessage">
    
<script>
    function sendMessage() {
        var message = document.getElementById("message").value;
        ws.publish("chatChannel", message);
    }

    function receiveMessage(message) {
        var chatBox = document.getElementById("chatBox");
        chatBox.innerHTML += "<p>" + message.data + "</p>";
    }
</script>

<h2>WebSocket Chat</h2>
<div id="chatBox" style="border: 1px solid #000; height: 200px; overflow-y: scroll;"></div>
<input type="text" id="message">
<button onclick="sendMessage()">Enviar</button>