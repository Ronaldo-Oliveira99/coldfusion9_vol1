 <!---
    Filename: HelloWorldMessage2.cfm
    Author: Nate Weiss (NMW)
    Purpose: Creates a custom tag that accepts attributes
 --->

  <!--- Tag Attributes ---> 

<cfparam name="attributes.topMessage" type="string" default="Hello, World, from Orange Whip Studios."> 
<cfparam name="attributes.bottomColor" type="string" default="orange">
<!--- Output message in HTML table format ---> 

<!--- substituindo cfparam por isdefinied --->
<!--- <cfparam name="attributes.message" type="string"> --->
<cfif not isDefined("attributes.message") >
    <cfabort showerror="You must provide a Message attribute">
</cfif>

<!--- substituindo cfparam por isdefinied --->
<!--- <cfparam name="attributes.topColor" type="string" default="yellow"> --->
<cfif not isDefined("attributes.topColor")>
    <cfset attributes.topColor="Yellow">
</cfif>
<!--- ou para ter o mesmo efeito --->
<cfif structKeyexists(attributes,  "topColor") >
</cfif>

<cfoutput> 
    <div id="heading" style="font-weight:bold;background-color: #attributes.topColor#">
        #attributes.topMessage#
    <div id="content" style="background-color: #attributes.bottomColor#">
        #attributes.message#
    </div>
</cfoutput>
 