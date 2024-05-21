<cfcomponent>

   <cffunction name='onServerStart'>
	  <cflog file='myserver' text='Server starting up!'>
	  <cfmail to='ronaldoluiz747@gmail.com' from='you@yourdomain.com' 
	  subject='Server Started'>
The ColdFusion Server just started up.
     </cfmail>
   </cffunction>
	
</cfcomponent>