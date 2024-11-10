 <!---
Name:          
Schedule_OWS_Update_Solr_UPDATE.cfm 
Author:        
Matt Tatam 
Description:   Schedules the OWS_Solr_Update.cfm at 01:00 am---> 
<cfschedule 
    action="UPDATE" 
    task="Update OWS Solr Collection"
    operation="HTTPRequest"
    url="http://localhost:8500/ows/36/OWS_Solr_Update.cfm"
    startdate="13/11/2009" 
    startTime="01:00 am" 
    interval="Daily" />
