<cfset imapserver = 'foo.goo.com'>
<cfset username = 'cfjedimaster@boyzoid.com'>
<cfset password = 'zoidrules'>

<cfimap server='#imapserver#' username='#username#' password='#password#'
        action='open' connection='imapCon'>

<cfimap action='listAllFolders' connection='imapCon' name='folders' recurse='true'>

<table border='1'>
   <tr>
      <th>Name</th>
		<th>Messages (New)</th>
	</tr>
	<cfoutput query='folders'>
	  <cfset link = 'imapbrowser.cfm?folder='>
	  <cfset link &= urlEncodedFormat(fullname)>
	  <tr>
		  <td><a href='#link#'>#fullname#</a></td>
		  <td>#totalMessages# (#unread#)</td>
	  </tr>
	</cfoutput>
</table>

<cfif isDefined('url.folder')>
   
	<cfoutput><h2>Messages for #url.folder#</h2></cfoutput>
	
   <cfimap action='getHeaderOnly' connection='imapCon' 
	name='mail' folder='#url.folder#'>

   <table border='1'>
	  <tr>
	  <th>From</th>
	  <th>Subject</th>
	  <th>Sent</th>
	  <th>Read</th>
	  </tr>
	  
	  <cfoutput query='mail'>
	     <tr>
		    <td>#htmlEditFormat(from)#</td>
			 <td>#subject#</td>
			 <td>#dateFormat(sentdate)# #timeFormat(sentdate)#</td>
			 <td>#seen#</td>
		  </tr>
	  </cfoutput>

   </table>
	
</cfif>

<cfimap action='close' connection='imapCon'>