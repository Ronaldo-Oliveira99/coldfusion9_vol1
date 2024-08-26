<!--- 
  Filename:     NextNIncludeBackNext.cfm
  Created by:   Nate Weiss (NMW)
  Purpose:      Displays Back and Next links for record navigation
  Please Note:  Included by the NextN.cfm templates in this folder
--->

<!--- Provide Next/Back links --->
<cfoutput>
  <!--- Show link for Back, if appropriate --->
  <cfif startRowBack gt 0>
    <a href="#CGI.script_name#?startRow=#startRowBack#">
      <img src="../images/BrowseBack.gif" width="40" height="16" 
        alt="Back #RowsPerPage# Records" border="0"></a>
  </cfif>
  <!--- Show link for Next, if appropriate --->
  <cfif startRowNext lte totalRows>
    <a href="#CGI.script_name#?startRow=#startRowNext#">
      <img src="../images/BrowseNext.gif" width="40" height="16" 
        alt="Next #RowsPerPage# Records" border="0"></a>
  </cfif>
</cfoutput>