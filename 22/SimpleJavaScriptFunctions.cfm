 <!---
 Filename: SimpleJavaScriptFunctions.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Creates a library of ColdFusion functions that
 encapsulate JavaScript ideas
--->

<!--- Function: JavaScriptPopupLink() ---> 
<!--- Returns an HTML link that opens a pop-up window via JavaScript --->
<cffunction name="javaScriptPopupLink" returnType="string" output="false">
    <!--- One argument: FilmID --->
    <cfargument name="linkURL" type="string" required="Yes">
    <cfargument name="linkText" type="string" required="Yes">
    <cfargument name="popupWidth" type="numeric" default="300">
    <cfargument name="popupHeight" type="numeric" default="200">
    <cfargument name="popupTop" type="numeric" default="200">
    <cfargument name="popupLeft" type="numeric" default="300">
    <!--- These variables are for this function?s use only --->
    <cfset var features = "">
    <cfset var linkCode = "">
    <!--- Window features get passed to JavaScript?s window.open() command --->
    <cfset features = "width=#arguments.PopupWidth#,"& "height=#arguments.PopupHeight#,top=#ARGUMENTS.PopupTop#,"& "left=#arguments.PopupLeft#,scrollbars=yes">
    <!--- Create variable called LinkCode, which contains HTML / JavaScript --->
    <!--- needed to display a link that creates a pop-up window when clicked --->
    <cfsavecontent variable="linkCode">
        <cfoutput> 
            <a href="#arguments.linkURL#" onclick="popupWin = window.open('#arguments.linkURL#','myPopup','#features#');  popupWin.focus(); return false;" >#arguments.LinkText#</a> 
        </cfoutput>
    </cfsavecontent>
    <!--- Return the completed link code --->
    <cfreturn linkCode>
</cffunction>