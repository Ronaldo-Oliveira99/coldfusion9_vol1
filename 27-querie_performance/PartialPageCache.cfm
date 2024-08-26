<!--- 
 Filename: PartialPageCache.cfm
 Author: Raymond Camden (RKC)
 Purpose: Demonstrates use of partial page caching
--->

<cfoutput> 
    <p>
        This number will always change: #randRange(1,10000)#
    </p> 
</cfoutput>
<cfcache>
    <cfoutput>
        <p>
            This number will be cached: #randRange(1,100000)#
        </p>
    </cfoutput>
</cfcache>
