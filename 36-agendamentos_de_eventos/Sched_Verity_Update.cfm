 <!---
Name: Schedule_OWS_Solr_UPDATE.cfm 
Author:Matt Tatam 
Description:   Schedules the OWS_Solr_Update.cfm at 11:30 PM---> 

<cfschedule 
  action="UPDATE" 
  task="Update OWS Solr Collection"
  operation="HTTPRequest"
  url="http://localhost:8500/ows/36/OWS_Solr_Update.cfm"
  startdate="13/11/2009" 
  startTime="11:30 PM" 
  interval="Daily" 
  file="ows_Solr_update_output.htm"  />
