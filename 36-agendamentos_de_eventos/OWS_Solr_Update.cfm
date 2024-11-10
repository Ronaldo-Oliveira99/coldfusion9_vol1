 <!---
Name: OWS_Solr_Update.cfm 
Author: Matt Tatam 
Description:   Indexes a Solr Collection ---> 

<cfindex collection="ows_Solr_collection" 
          action ="update" 
          type="Path"
          Key="C:\ColdFusion9\wwwroot\ows" > 
<!--- creates debugging display ---> 
<cfoutput>
OWS Solr Collection last Updated: #DateFormat(now())# #TimeFormat(now(), “h:mm:ss 
tt")# 
</cfoutput>
