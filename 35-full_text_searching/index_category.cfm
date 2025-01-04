 <!---
Module:index_category.cfm      
Author:Raymond Camden  
 --->

 <!--- Feedback --->
 Getting data ...<br>

 <!--- Retrieve all merchandise to be searched --->
 <cfquery name="getresults" datasource="ows_oracle">
     select merchid, merchname, merchdescription, merchprice
     from merchandise
 </cfquery>
 <!--- Add a column for our category ---> 
<cfset queryAddColumn(getresults,"level","varchar",arrayNew(1))>
 <!--- set the value based on price --->
<cfloop query="getresults">
     <cfif merchprice gte 100> 
          <cfset querySetCell(getresults, "level", "pricey", currentrow)>
     <cfelse>
          <cfset querySetCell(getresults, "level", "cheap", currentrow)>
     </cfif>
</cfloop>
 <!--- Feedback --->
 Indexing data ...<br>
 <!--- Build ‘custom’ index on query result above --->
 <cfindex action="refresh"
          collection="merchandise"
          key="merchid"
          type="custom"
          title="merchname"
          query="getresults"
          body="merchname,merchdescription"
          category="level">
 <!--- Feedback --->
 Done!