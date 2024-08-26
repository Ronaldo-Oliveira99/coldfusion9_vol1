<!--- 
 Filename: CacheFunctions2.cfm
 Author: Raymond Camden (RKC)
 Purpose: Demonstrates use of cache functions
--->

<cfif isDefined("url.clear")>
    <cfset cacheRemove("feed")>
</cfif>
<cfset articles = cacheGet("feed")>
<cfif isNull(articles)>
    <cfset feedUrl = "http://feeds.feedburner.com/RaymondCamdensColdfusionBlog">
    <cffeed source="#feedUrl#" query="articles">
    <cfset cachePut("feed", articles, createTimeSpan(0,0,30,0))>
</cfif>
<cfoutput query="articles">
    <a href="#rsslink#">#title#</a><br/>
</cfoutput>


<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0">

<channel>
  <title>W3Schools Home Page</title>
  <link>https://www.w3schools.com</link>
  <description>Free web building tutorials</description>
  <item>
    <title>RSS Tutorial</title>
    <link>https://www.w3schools.com/xml/xml_rss.asp</link>
    <description>New RSS tutorial on W3Schools</description>
  </item>
  <item>
    <title>XML Tutorial</title>
    <link>https://www.w3schools.com/xml</link>
    <description>New XML tutorial on W3Schools</description>
  </item>
</channel>

</rss>