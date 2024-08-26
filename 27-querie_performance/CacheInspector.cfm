<!---
Nome  do  arquivo:  CacheInspector.cfm
 Autor:  Raymond  Camden  (RKC)
 Objetivo:  Demonstra  cacheGetMetadata
--->


<cfset  ids  =  cacheGetAllIds()>
<cfdump  var="#ids#">


 <cfloop  index="id"  array="#ids#">
    <cfoutput>
        <p>
        id:  #id#</br>
        <cfset  meta=cacheGetMetadata(id)>
        <cfdump  var="#meta#">
        </p>
    </cfoutput>
</cfloop>