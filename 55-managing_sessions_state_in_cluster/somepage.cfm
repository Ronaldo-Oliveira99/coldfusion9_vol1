<cfif structKeyExists(COOKIE, "fullname") >
    <b>WELCOME BACK - <cfoutput>#COOKIE.fullname#  </cfoutput></b><br>
    Your security level is -  <cfoutput>#COOKIE.userSecurity#</cfoutput>
<cfelse>
    <cfparam name="#originURL#" default="">
    <cflocation url="/login.cfm?originURL=#urlEncodedFormat(originURL)#">
    <cfparam name="URL.originURL" default="#CGI.script_name#?#CGI.query_string#">
    <cfabort>
</cfif>