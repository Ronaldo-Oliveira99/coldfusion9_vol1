<!--- 
 Filename: RegExTester.cfm
 Author: Nate Weiss (NMW)
 Purpose: A page for crafting, testing, and debugging regular expressions
--->


<!--- Form parameters --->
<cfparam name="FORM.regEx" type="string" default="">
<cfparam name="FORM.searchText" type="string" default="">
<cfparam name="FORM.searchTextFile" type="string" default="">
<cfparam name="FORM.searchTextURL" type="string" default="">
<cfparam name="FORM.ShowSubExpr" type="boolean" default="no">
<cfparam name="FORM.CaseSensitive" type="boolean" default="No">

<!--- Location of the RexEx pages within the ColdFusion documentation --->
<cfset regExDocURL = 
 "http://livedocs.macromedia.com/coldfusion/6/" & 
 "Developing_ColdFusion_MX_Applications_with_CFML/regexp.htm">

<!--- If the user is uploading a file --->
<cfif FORM.searchTextFile neq "">

 <!--- Obtain a temporary file to store the uploaded text in --->
 <cfset tempFileName = getTempFile(getTempDirectory(), "rgx")>

 <!--- Accept the file upload --->
 <cffile action="upload" filefield="FORM.searchTextFile"
 destination="#tempFileName#" nameconflict="Overwrite">
 
 <!--- Read the contents of the file into the FORM.SearchText variable --->
 <cffile action="read" file="#tempFileName#" variable="FORM.SearchText">

 <!--- Delete the temporary file ---> 
 <cffile action="delete" file="#tempFileName#"> 

<!--- If the user is providing a URL to get the search text from ---> 
<cfelseif left(FORM.searchTextURL, 4) eq "http">
 <!--- Fetch the text over HTTP --->
 <cfhttp method="get" url="#FORM.searchTextURL#">
 
 <!--- If we appear to have connected succesfully to the URL ---> 
 <cfif cfhttp.fileContent neq "Connection Failure">
   <!--- Use the fetched text from here on ---> 
   <cfset FORM.searchText = cfhttp.fileContent>
 </cfif> 
</cfif>

<html>
<head><title>Regular Expression Test Page</title></head>
<body>

<!--- Some styles to make the page look nice --->
<style>
 body {font-family:arial;font-size:12px}
 input {font-size:11px}
 textarea {font-size:11px}
 th {background:#8888FF;color:white;text-align:left}
 td {background:#CCCC99;color:black;font-size:12px}
 td.RowA {background:#CCCC99}
 td.RowB {background:#EEEEBB}
</style>


<cfoutput>
 <!--- Create a self-submitting form --->
 <FORM ACTION="#CGI.script_name#" METHOD="post" ENCTYPE="multipart/form-data">
 
 <table border="1" cellPadding="4" cellSpacing="0" width="550">
 <tr> 
 <th class="Dialog">Regular Expression Tester</th>
 </tr>
 <tr> 
 <td class="Dialog"> 
 
 <!--- Text input for the regular expression itself --->
 <b>Enter a regular expression:</b><br>
 <input name="regEx" type="text" size="65" style="font-size:13px"
 value="#htmlEditFormat(FORM.regEx)#">

 <!--- Submit button to start the search ---> 
 <input type="submit" value="Match Now" style="font-weight:bold"><br>
 
 <!--- Checkbox to control case-sensitivity --->
 <input type="checkbox" name="casesensitive" id="casesensitive"
 <cfif FORM.caseSensitive>checked</cfif>
 value="yes">
 <label for="casesensitive">Case sensitive</label>

 &nbsp;&nbsp;
 
 <!--- Radio buttons to display matches vs. subexpressions --->
 <input type="radio" name="showSubExpr" id="showSubExprno"
 <cfif not FORM.showSubExpr>checked</cfif>
 value="no"><label for="showSubExprNo">Show matched text</label>

 <input type="radio" name="showSubExpr"id="showSubExpryes"
 <cfif FORM.showSubExpr>checked</cfif>
 value="yes"><label for="showSubExprYes">Show subexpressions</label>
 
 &nbsp;&nbsp;
 <a href="#regExDocURL#" target="RegExDocs">Help</a>
  
 <!--- Textarea where user can type the text to search ---> 
 <p><b>And the text you wish to search:</b><br>
 <textarea name="searchText" wrap="off" cols="70" rows="6">
 #htmlEditFormat(FORM.searchText)#
 </textarea><br>
 
 <!--- Text input for providing a URL ---> 
 Or, provide a file or URL to get the text from:<br>
 URL: 
 <input name="searchTextURL" type="text" size="35">

 <!--- File input for uploading a text file to search --->
 &nbsp;&nbsp;&nbsp;
 File: 
 <input name="searchTextFile" type="file" size="30">
 
 </td>
 </tr>
 </table>
 
 </form>
</cfoutput> 
 
<!--- When the form is submitted... ---> 
<cfif FORM.regEx neq "">

 <!--- Include UDF library of regular expression functions --->
 <!--- This allows us to use the REFindMatches() function --->
 <cfinclude template="RegExFunctions.cfm">

 <!--- If the RegEx is using "multiline mode", adjust the text --->
 <!--- so that only linefeed characters are used to separate lines --->
 <cfif left(FORM.regEx, 4) eq "(?m)">
   <cfset FORM.searchText = adjustNewlinesToLinefeeds(FORM.searchText)>
 </cfif>
 
 <cftry>
 <!--- Perform the regular expression search --->
 <!--- Results are returned as a query object with three columns: --->
 <!--- "Pos" - the position of the match --->
 <!--- "Len" - the length of the match --->
 <!--- "Found" - the actual text of the match --->
 <cfset matchQuery = 
reFindMatches(FORM.regEx, FORM.searchText, FORM.caseSensitive)>
 
 <!--- If any errors occur ---> 
 <cfcatch type="Expression">
 <!--- If it has to do with regular expression, show friendly message --->
 <cfif CFCATCH.message contains "malformed regular expression">
 <p><b>Sorry, there is a problem with your regular expression.</b><br>
 <cfoutput>#CFCATCH.Detail#<br></cfoutput>
 <cfabort>
 
 <cfelse>
   <cfrethrow> 
 </cfif>
 </cfcatch>
 </cftry> 

 <cfoutput>
 <!--- Display the number of matches found --->
 Matches Found: #matchQuery.RecordCount#<br>

 <!--- If there is at least one match... --->
 <cfif matchQuery.recordCount gt 0>
 
   <!--- Display the matches in a simple HTML table ---> 
   <div style="height:200px;overflow-y:auto;width:550"> 
   <table border="0" cellPadding="2" cellSpacing="0" width="550">
   
   <tr>
   <cfif FORM.showSubExpr>
     <cfloop from="1" to="#matchQuery.SubExprCount#" index="i">
       <th>Sub-Expr&nbsp;#i#</th>
     </cfloop>
   <cfelse>
     <th width="*">Match</th> 
     <th width="50">Position</th>
     <th width="50">Length</th></tr>
   </cfif>
   </tr>
   
   <cfloop query="matchQuery">
     <!--- Alternating row colors --->
     <cfset class = iif(currentRow mod 2 eq 0, "'RowA'", "'RowB'")>
     <tr>
     <cfif FORM.showSubExpr>
       <cfloop from="1" to="#matchQuery.SubExprCount#" index="i">
       <td class="#class#" 
       width="#round(100/matchQuery.SubExprCount)#%">
       #htmlEditFormat(matchQuery["SubExpr#i#"][currentRow])#
       </td>
       </cfloop>
     <cfelse>
       <td class="#class#" width="450">
       #htmlEditFormat(matchQuery.Found)#
       </td>
       <td class="#class#" width="50">#matchQuery.pos#</td>
       <td class="#class#" width="50">#matchQuery.len#</td>
     </cfif>
     </tr>
   </cfloop>
   </table>
   </div>

 </cfif>
 </cfoutput>
</cfif> 
 
</body>
</html>
