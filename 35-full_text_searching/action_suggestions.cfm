 <!---
Name:          
action_suggestions.cfm
 Author:        --->
Raymond Camden 
<cfsearch collection="owshr"
     name="GetResults"
     criteria="#form.criteria#"
     suggestions="always"
     status="result">
<!--- Display the query results --->
<cfoutput> 
     <h2> 
          #GetResults.RecordCount# record(s) found for:
          #htmlEditFormat(form.criteria)# 
     </h2> 
</cfoutput>
<cfif len(trim(result.suggestedquery))>
     <cfoutput> 
          <p>
               <b>Maybe next time try</b> #trim(result.suggestedquery)#?
          </p> 
     </cfoutput> 
</cfif>
<dl> 
<cfoutput query="GetResults">
     <strong>#Title#</strong>
     <dt><emp>Score: #numberFormat(Score)#</emp>
     <dd><small>#Summary#</small></dd>
</cfoutput> 
</dl>