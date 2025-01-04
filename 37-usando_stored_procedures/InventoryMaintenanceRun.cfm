<!--- 
 Filename: InventoryMaintenanceRun.cfm
 Author:  Nate Weiss (NMW)
 Purpose: Demonstrates use of the <cfstoredproc> tag
--->

<html>
<head><title>Inventory Maintenance</title></head>
<body>
<h2>Inventory Maintenance</h2>

<!--- If the submit button was not just pressed, display form --->
<cfif not isDefined("FORM.executeNow")>

  <!--- Provide button to start stored procedure --->
  <cfform action="#CGI.script_name#" method="post">
  <cfinput type="submit" name="executeNow" 
           value="Perform Inventory Maintenance">
  </cfform>

<!--- If the user just clicked the submit button --->
<cfelse>

  <p>Executing stored procedure...</p>
  <!--- Go ahead and execute the stored procedure --->

  <cfset filmeid = 2>
  <!--- <cfstoredproc procedure="PerformInventoryMaintenance" 
                datasource="ows_oracle"> --->

  <cfstoredproc procedure="PerformInventoryMaintenance" datasource="ows_oracle"> 
  <cfprocparam type="in" cfsqltype="cf_sql_numeric" value="#filmeid#"> 
  <cfprocparam type="out" cfsqltype="cf_sql_varchar" variable="nome"> 
  </cfstoredproc>              
                

  <p>Done executing stored procedure!</p>

  <cfoutput> FILME: #nome# </cfoutput>

</cfif>
</body>
</html>
