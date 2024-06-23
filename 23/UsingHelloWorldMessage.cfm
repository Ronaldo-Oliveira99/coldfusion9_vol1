 <!---
 Filename: UsingHelloWorldMessage.cfm
 Author: Nate Weiss (NMW)
 Purpose: Shows how to use the <CF_HelloWorldMessage> custom tag

--->


 <!--- Display Hello World Message, via Custom Tag --->
 <cf_HelloWorldMessage
 message="We're getting the band back together!">
 <br>
 <br>

 <cf_HelloWorldMessage2
 topMessage="Message of the Day"
 message="We're getting the band back together!"
 >

 <br>
 <br>

 <cf_HelloWorldMessage2
 message="We're getting the band back together!"
 topColor="beige"
 bottomColor="##FFFFAA"
 >