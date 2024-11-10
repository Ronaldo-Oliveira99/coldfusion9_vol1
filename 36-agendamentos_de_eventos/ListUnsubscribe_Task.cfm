<!---
Name:         ListUnsubscribe_Task.cfm
Author:       Leon Chalnick
Description:  Creates a scheduled task to
              Run ListUnsubscriber.cfm
              once per hour starting at
              2:00:00 AM on 3/18/2002.
--->
<cfschedule
  task="Mailing list unsubscriber"
  action="UPDATE"
  operation="HTTPRequest"
  url="http://localhost/ows/21/ListUnsubscriber.cfm"
  port="8500"
  interval="3600"
  startdate="7/18/2007"
  starttime="02:00:00 AM"
>
