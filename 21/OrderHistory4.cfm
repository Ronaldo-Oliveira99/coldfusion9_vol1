<!--- 
 Filename: OrderHistory4.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Displays a user's order history
--->



<!--- <cfdump  var="#isUserInRole()#"> --->


<html>

<head>
<title>Order History</title>
 
    <!--- Apply some simple CSS style formatting --->
    <style type='text/css'>
    BODY {font-family:sans-serif;font-size:12px;color:navy}
    H2 {font-size:20px}
    TH {font-family:sans-serif;font-size:12px;color:white;
    background:MediumBlue;text-align:left}
    TD {font-family:sans-serif;font-size:12px}
    </style> 
</head>
<body>

<!--- GetAuthUser() returns whatever was supplied to the NAME --->
<!--- attribute of the <cflogin> tag when the user logged in. --->
<!--- We provided user's ID and first name, separated by --->
<!--- commas; we can use list functions to get them back. --->
<cfset contactID = listFirst(getAuthUser())>
<cfset contactName = listRest(getAuthUser())>

<!--- If current user is an administrator, allow user --->
<!--- to choose which contact to show order history for --->
<cfif isUserInRole('Admin')>
    <!--- This session variable tracks which contact to show history for --->
    <!--- By default, assume the user should be viewing their own records --->
    <cfparam name='session.orderHistorySelectedUser' default='#contactID#'>
    
    
    
    <cfdump  var="#contactID#">
    <cfdump  var="#isUserInRole("teste")#">
    <cfdump  var="#isUserInRole("admin")#">
    
    <!--- PARA TESTAR 2 PERMISSOES: --->
    <cfdump  var="#isUserInAnyRole("teste,admin")#">
    <cfdump  var="#getUserRoles()#">

    <cfdump  var="#session#">



    <!--- If user is currently choosing a different contact from list --->
    <cfif isDefined('form.selectedUser')>
        <cfset session.orderHistorySelectedUser = form.selectedUser> 
    </cfif>
    <!--- For rest of template, use selected contact's ID in queries --->
    <cfset showHistoryForContactID = session.orderHistorySelectedUser>
    

    <!--- Simple HTML form, to allow user to choose ---> 
    <!--- which contact to show order history for --->
    <cfform 
    action='#cgi.script_name#'
    method='POST'>

        <div>
            <h2>Order History</h2>
            Customer:
           <a><span style="float:right">logout</span></a>   
        </div>

        <!--- Get a list of all contacts, for display in drop-down list ---> 
        <cfquery name='getUsers'>
            SELECT ContactID, LastName || ', ' || FirstName AS FullName
            FROM Contacts
            ORDER BY LastName, FirstName
        </cfquery>
        
        <!--- Drop-down list of contacts --->
        <cfselect
        name='selectedUser'
        selected='#session.orderHistorySelectedUser#'
        <!--- selected='#showHistoryForContactID#' --->
        query='getUsers'
        display='FullName'
        value='ContactID'>
        </cfselect>
        
        <!--- Submit button, for user to choose a different contact ---> 
        <input type='Submit' value='Go'>
    
    </cfform>
    
    <!--- Normal users can view only their own order history ---> 
<cfelse>
    <cfset showHistoryForContactID = contactID>

    <!--- Personalized message at top of page--->
    <cfoutput>
    <h2>YourOrder History</h2>
    <p><strong>Welcome back, #contactName#!</strong><br>
    </cfoutput>
 
</cfif> 


<!--- Retrieve user's orders, based on ContactID --->
<cfquery name='getOrders'>
    SELECT OrderID, OrderDate, 
    (SELECT Count(*) 
    FROM MerchandiseOrdersItems oi
    WHERE oi.OrderID = o.OrderID) AS ItemCount
    FROM MerchandiseOrders o
    WHERE ContactID = 
    <cfqueryparam cfsqltype='cf_sql_varchar' value='#showHistoryForContactID#'>
    ORDER BY OrderDate DESC
</cfquery>


<!--- Determine if a numeric OrderID was passed in URL --->
<cfset showDetail = isDefined('url.orderID') and isNumeric(url.orderID)>

<!--- If an OrderID was passed, get details for the order --->
<!--- Query must check against ContactID for security --->
<cfif showDetail>
    <cfquery name='getDetail'>
        SELECT m.MerchName, oi.ItemPrice, oi.OrderQty
        FROM Merchandise m, MerchandiseOrdersItems oi 
        WHERE m.MerchID = oi.ItemID
        AND oi.OrderID = 
        <cfqueryparam cfsqltype='cf_sql_integer' value='#url.orderID#'>
        AND oi.OrderID IN 
        (SELECT o.OrderID FROM MerchandiseOrders o
        WHERE o.ContactID = 
        <cfqueryparam cfsqltype='cf_sql_integer' value='#showHistoryForContactID#'>)
    </cfquery>
 
    <!--- If no Detail records, don't show detail --->
    <!--- User may be trying to 'hack' URL parameters --->
    <cfif getDetail.recordCount eq 0>
        <cfset showDetail = False>
    </cfif>
</cfif>


<cfif getOrders.recordCount eq 0>
    <p>No orders placed to date.<br>
<cfelse>
    <cfoutput>
        <p>Orders placed to date: 
        <strong>#getOrders.recordCount#</strong><br>
    </cfoutput>
 
    <!--- Display orders in a simple HTML table --->
    <table border='1' width='300' cellpadding='5' cellspacing='2'>
        <!--- Column headers --->
        <tr>
            <th>Date Ordered</th>
            <th>Items</th>
        </tr>
        
        <!--- Display each order as a table row --->
        <cfoutput query='getOrders'>
            <!--- Determine whether to show details for this order --->
            <!--- Show Down arrow if expanded, otherwise Right --->

            <cfset ArrowDown = 'ArrowDown.gif' >
            <cfset ArrowRight = 'ArrowRight.gif' >

            <cfset isExpanded = showDetail and (getOrders.OrderID eq URL.orderID)>
            <cfset arrowIcon = iif(isExpanded, 'ArrowDown', 'ArrowRight')>
            
            <tr>
                <td>
                    <!--- Link to show order details, with arrow icon --->
                    <a href='OrderHistory4.cfm?orderID=#OrderID#'>
                        <img src='../images/#arrowIcon#' width='16' height='16' border='0'>
                        #dateFormat(OrderDate, 'mmmm d, yyyy')#
                    </a>
                </td>
                <td>
                    <strong>#ItemCount#</strong>
                </td>
            </tr>
            
            <!--- Show details for this order, if appropriate ---> 
            <cfif isExpanded>
                <cfset orderTotal = 0>
                <tr>
                    <td colspan='2'>
                    
                    <!--- Show details within nested table --->
                    <table width='100%' cellspacing='0' border='0'>
                        <!--- Nested table's column headers --->
                        <tr>
                            <th>Item</th><th>Qty</th><th>Price</th>
                        </tr>
                        
                        <!--- Show each ordered item as a table row --->
                        <cfloop query='getDetail'>
                            <cfset orderTotal = orderTotal + itemPrice>
                            <tr>
                                <td>#MerchName#</td>
                                <td>#OrderQty#</td>
                                <td>#dollarFormat(ItemPrice)#</td>
                            </tr>
                        </cfloop>
                        
                        <!--- Last row in nested table for total ---> 
                        <tr>
                            <td colspan='2'><strong>Total:</strong></td>
                            <td><strong>#dollarFormat(orderTotal)#</strong></td>
                        </tr>
                    </table>
                    </td>
                </tr>
            </cfif>
        </cfoutput>
    </table>
</cfif>

</body>
</html>
