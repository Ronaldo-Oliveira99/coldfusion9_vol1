<!---
Name:        testcfc.cfm
Author:      Ben Forta (ben@forta.com)
Description: Quick CFC test
Created:     01/01/2010
--->

<!--- Title --->
<h1>Testing intro.cfc</h1>

<!--- Get today's date --->
<cfinvoke component='intro'
          method='today'
          returnvariable='todayRet'>
<!--- Get tomorrow's date --->
<cfinvoke 
	component='ows.11.intro' 
	method='tomorrow'  
	returnVariable='tomorrowRet' >
</cfinvoke>

<!--- Output --->
<cfoutput>
Today is #DateFormat(todayRet)#<br/>
Tomorrow is #DateFormat(tomorrowRet)#<br/>
</cfoutput>

<!--- Geometry test --->
<cfinvoke 
	component='ows.11.intro' 
	method='geometry'  
	returnVariable='geometryRet' >
	<cfinvokeargument name='radius' value='10' />
</cfinvoke>

<!--- Display it --->
<cfdump var='#geometryRet#'>


