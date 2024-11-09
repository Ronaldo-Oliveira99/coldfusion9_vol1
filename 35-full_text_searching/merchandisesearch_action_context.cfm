<!---
Name:          
merchandisesearch_action_context.cfm
 Author:        --->
Raymond Camden 
<!--- Perform a Solr search --->
<cfsearch 
    collection = "merchandise" 
    name = "GetResults" 
    criteria = "#form.Criteria#" 
    contextPassages = "1"
    contextHighlightBegin = "<em>" 
    contextHighlightEnd = "</em>">


    <cfdump  var="#GetResults#">

<cfoutput>
    <h2> #GetResults.RecordCount# Merchandise record(s) found for
    "#form.Criteria#"
    </h2>
</cfoutput>
<!---Use definition list to display Solr output
score, title, summary, and context from each item found. --->
<dl> 
<cfoutput query = "GetResults">
    <strong>#Title#</strong>
    <dt><emp>Score: #numberFormat(Score)#</emp>
    <dd>
    <small>#Summary#</small><br/>
    <small>#context#</small>
    </dd>
</cfoutput>
</dl>
    </body>
    </html>