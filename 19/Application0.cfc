<!---
 Filename: Application0.cfc
 Created by: Raymond Camden (ray@camdenfamily.com)
 Handles application events.
--->

<cfcomponent output='false'>

  <cfset this.name='OrangeWhipSite'>
  <!--- sessionManagement : habilita variaveis de sess�o --->
  <cfset this.sessionManagement=true>

  <!--- setDomainCookies :  Isso  faz  com  que  o  ColdFusion  configure  o  cookie  CFID  de  forma  que  ele  seja  
        compartilhado  entre  todos  os  servidores  no  mesmo  dom�nio  da  Internet --->
    <cfset this.setDomainCookies=true>


  <cfset this.datasource='ows_oracle'>
  
  <cfparam  name='cookie.VisitStart'  type='date'  default='#now()#'>

</cfcomponent>
