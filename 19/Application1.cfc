<!---
 Filename: Application1.cfc
 Created by: Raymond Camden (ray@camdenfamily.com)
 Handles application events.
--->

<cfcomponent output='false'>

  <cffunction name='onRequestStart' output='false' returnType='boolean'>
    <cfparam name='cookie.VisitStart' type='date' default='#now()#'>
	<cfreturn true>
  </cffunction>

</cfcomponent>
