<!DOCTYPE html>
<html>

<head>
<title>Exemplo Quatro</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" ></script>

</head>
    <body >
        <cfdump var="#wsGetSubscribers('news')#" label="Assinantes">

        <cfdump var="#wsGetAllChannels()#" label="All Channels">
        
        <cfif structKeyExists(form, "newmsg") and len(trim(form.newmsg))>
            <cfset wsPublish("news", form.newmsg)>
        </cfif>
        
        <form method="post">
            <input type="text" name="newmsg"> 
            <input type="submit" value="Send">
        </form>

    </body>
</html>