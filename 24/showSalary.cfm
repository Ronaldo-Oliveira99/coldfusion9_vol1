<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--- 
  showSalary.cfm
  Demonstrate CFC roles
  Modified by Ken Fricklas (kenf@fricklas.com)
  Modified: 8/17/2007
--->
<HTML>
<HEAD>
<TITLE>What were they paid?</TITLE>
</HEAD>

<BODY>
<!--- Make sure they are logged in. Change roles to "User" to see what happens if they don’t have sufficient access. --->
<cfloginuser name="Test" password="dummy" roles="Producers">





<!--- Invoke actors component.  getActorSalary method will fail unless 
  they have sufficient access. --->
<!--- <cfinvoke 
 component="actor"
 method="getActorSalary"
 returnVariable="salaryHistory2">
  <cfinvokeargument name="actorID" value="17"/>
</cfinvoke> --->


<cfset cfcActor = new actor(datasource="ows")> 
<cfset salaryHistory = cfcActor.getActorSalary(17)>


<cfdump  var="#salaryHistory#">
<!--- <cfdump  var="#salaryHistory2#"> --->

<h1>Salaries of our stars...</h1>
<cfoutput>
<H2>
#salaryHistory.NameFirst# #salaryHistory.NameLast#</H2>
<cfloop query="salaryHistory">
  #MovieTitle# - #dollarFormat(Salary)#<BR></cfloop>
</cfoutput>
</BODY>
</HTML>
