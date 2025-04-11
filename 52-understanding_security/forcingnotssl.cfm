<cfdump var="#cgi#">

<cfif findNoCase("off", cgi.HTTPS) or not cgi.server_port_secure>
    <cflocation url="https://#cgi.server_name##cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#" 
    statuscode="301" addtoken="false">
    <cfabort>
</cfif>
