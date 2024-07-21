

<cfset jsonTeste = {"employés":[  
    {"name":"Shyam", "email":"shyamjaiswal@gmail.com"},  
    {"name":"Bob", "email":"bob32@gmail.com"},  
    {"name":"Jai", "email":"jai87@gmail.com"}  
]}  />

<cfset local.url = "http://127.0.0.1:8500/rest/rest_test_call/APIroutes">

<cfhttp url="#local.url#" <!--- charset="UTF-8" ---> method="GET" result="res">
    <!--- <cfhttpparam type="header" name="Content-Type" value="application/json" /> --->
    <cfhttpparam type="body" value="#serializeJSON(jsonTeste)#">
    <!--- <cfhttpparam type="body" value="#jsonTeste#"> --->
</cfhttp>

<cfdump  var="#res#">
