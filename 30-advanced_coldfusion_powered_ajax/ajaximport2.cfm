<!---
Name:        ajaximport2.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: AjaxImport Test
--->


<cfajaximport tags="cftooltip">

<cfpod source="tooltip2.cfm" title="cfajax import demo" />



<script>
     function setups() {
        alert('result');
    } 
    /* 
    function setup() { 
    ColdFusion.Window.show('loginwindow'); 

} */

</script>


<cfset ajaxOnLoad("setups")>
