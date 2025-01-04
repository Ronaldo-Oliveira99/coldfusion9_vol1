<!--- 
 Filename: POPDateFunctions.cfm
 Author: Nate Weiss (NMW)
 Purpose: A small library of functions related to POP dates
--->

<!--- 
 TryToParsePOPDateTime(date_string)
 Function that tries to parse a date string from an incoming email message. 
 It attempts to parse the string using ParseDateTime() with ÒPOPÓ option, 
 then LSParseDateTime(), then ParseDateTime() without ÒPOPÓ option. If all 
 attempts fail, this function returns the original date string, unmodified. 
--->
<cffunction name="tryToParsePOPDateTime" output="false" returnType="date">
 <!--- Required argument: DateString --->
 <cfargument name="dateString" type="string" required="Yes">

  <!--- Local variable to hold this functionÕs result --->
  <!--- Start off by just setting it to original date string --->
  <cfset var result = ARGUMENTS.dateString>
 
  <!--- Attempt 1 --->
  <cftry>
  <cfset result = parseDateTime(ARGUMENTS.dateString, "POP")>
 
  <!--- If attempt 1 fails... --->
  <cfcatch type="Expression">

    <!--- Attempt 2 --->
    <cftry>
    <cfset result = lsParseDateTime(ARGUMENTS.dateString)>
 
    <!--- If attempts 2 fails... --->
    <cfcatch type="Expression">
      <!--- Attempt 3 --->
      <cftry>
      <cfset result = parseDateTime(ARGUMENTS.dateString)>
      
      <!--- If attempt 3 fails, give up. --->
      <!--- Result will just be the original date string, --->
      <!--- from the initial <CFSET> at top of this function. --->
      <cfcatch type="Expression" />
      </cftry>

    </cfcatch>
    </cftry>

  </cfcatch>
  </cftry>

  <!--- Return the result ---> 
  <cfreturn result>
</cffunction>


<!--- 
 TryToFormatPOPDateTime(date_string)
 Attempts to parse a date, then formats it if possible
--->
<cffunction name="tryToFormatPOPDateTime" output="false" returnType="string">
  <!--- Required argument: DateString --->
  <cfargument name="dateString" type="string" required="Yes">
 
  <!--- Attempt to parse the date --->
  <cfset var result = tryToParsePOPDateTime(ARGUMENTS.dateString)>

  <!--- If it was parsed successfully, format it with DateFormat() --->
  <cfif isDate(result)>
    <cfset result = "<b>#dateFormat(result)#</b><br>#timeFormat(result)#">
  </cfif>

  <!--- Return the result --->
  <cfreturn result> 
</cffunction>
