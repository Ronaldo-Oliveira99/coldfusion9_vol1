 <!---
    Module:search_category.cfm         
    Author:Raymond Camden         
--->
  
<cfparam name="form.criteria" default="">
<cfparam name="form.category" default="">

<cfcollection action="categoryList" collection="merchandise"
              name="data">


<cfdump  var="#data#">

              
<form action="search_category.cfm" method="post">
    <cfoutput>
        Keywords: <input type="text" name="criteria"
        value="#form.criteria#"><br/>
    </cfoutput>
    Filter by Category:
    <select name="category">
    <option value=""<cfif form.category is"">selected</cfif>>-</option>
        <cfloop item="category" collection="#data.categories#">
            <cfoutput>
            <option value="#category#"
                <cfif form.category is category>selected</cfif>>#category#
            </option>
            </cfoutput>
        </cfloop>
    </select><br/>
    <input type="submit" value="Search">
</form>
<cfif len(trim(form.criteria))>
    <cfsearch collection="merchandise" criteria="#form.criteria#"
              category="#form.category#" name="getResults">
    <cfoutput>
        <h2>
            #getResults.RecordCount# Merchandise record(s) found for
            "#form.Criteria#"<cfif len(form.category)>
                                within the #form.category# category
                            </cfif>.
        </h2>
    </cfoutput>
    <dl>
        <cfoutput query="getResults">
            <strong>#Title#</strong>
            <dt><emp>Score: #numberFormat(Score)#</emp>
            <dd>
                <small>#Summary#</small><br/>
            </dd>
        </cfoutput>
    </dl>
</cfif>
    