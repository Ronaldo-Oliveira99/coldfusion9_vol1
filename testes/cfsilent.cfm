<cfsilent> 
    <cfset a = 100> 
    <cfset b = 99> 
    <cfset c = b-a> 
    <cfoutput>
        Inside cfsilent block
        <br> 
        b-a = #c#
    </cfoutput>
    <br> 
</cfsilent> 

    <p>Even information within cfoutput tags does not display within a 
        cfsilent block.<br> 
        <cfoutput> 
        b-a = #c# 
        </cfoutput> 
    </p>