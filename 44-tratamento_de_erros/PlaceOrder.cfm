<!--- 
 Filename: PlaceOrder.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Processes a userÕs user, charging credit card, etc
 Please Note Relies upon <cf_ProcessPayment> custom tag
--->

<!--- Tag Parameters --->
<cfparam name="ATTRIBUTES.processor" type="string" default="PayflowPro">
<cfparam name="ATTRIBUTES.merchList" type="string">
<cfparam name="ATTRIBUTES.quantList" type="string">
<cfparam name="ATTRIBUTES.contactID" type="numeric">
<cfparam name="ATTRIBUTES.creditCard" type="string">
<cfparam name="ATTRIBUTES.creditExpM" type="string">
<cfparam name="ATTRIBUTES.creditExpY" type="string">
<cfparam name="ATTRIBUTES.creditName" type="string">
<cfparam name="ATTRIBUTES.shipAddress" type="string">
<cfparam name="ATTRIBUTES.shipCity" type="string">
<cfparam name="ATTRIBUTES.shipCity" type="string">
<cfparam name="ATTRIBUTES.shipState" type="string">
<cfparam name="ATTRIBUTES.shipZIP" type="string">
<cfparam name="ATTRIBUTES.shipCountry" type="string">
<cfparam name="ATTRIBUTES.htmlMail" type="boolean">
<cfparam name="ATTRIBUTES.returnVariable" type="variableName">
<cftry>
  <!--- Make sure the MerchList and QuantList Attributes make sense --->
  <cfif (listLen(ATTRIBUTES.merchList) EQ 0)
  OR listLen(ATTRIBUTES.merchList) neq listLen(ATTRIBUTES.quantList)>
    <!--- If not, throw an error --->
    <cfthrow message="Invalid MerchList or QuantList attribute"
    detail="Both must have same number of list elements, and canÕt be empty.">
  </cfif>
  
  <!--- Quick query to verify the ContactID is valid --->
  <cfquery name="getCount" datasource="#APPLICATION.dataSource#">
  SELECT Count(*) AS ContactCount 
  FROM Contacts
  WHERE ContactID = #ATTRIBUTES.contactID#
  </cfquery>
  
  <!--- If any of the MerchIDs are not valid, throw custom error --->
  <cfif getCount.contactCount neq 1>
    <cfthrow type="ows.MerchOrder.InvalidContactID"
    message="Invalid Contact ID"
    detail="The ContactID you provided (#ATTRIBUTES.contactID#) is not valid."
    errorcode="1">
  </cfif>
 
  <!--- Quick query to verify that all MerchIDs are valid --->
  <cfquery name="getCount" datasource="#APPLICATION.dataSource#">
  SELECT Count(*) AS ItemCount
  FROM Merchandise
  WHERE MerchID IN (#ATTRIBUTES.merchList#)
  </cfquery>

  <!--- If any of the MerchIDs are not valid, throw custom error --->
  <cfif getCount.ItemCount neq listLen(ATTRIBUTES.merchList)>
    <cfthrow type="ows.MerchOrder.InvalidMerchID"
    message="Invalid Merchandise ID"
    detail="At least one of the MerchID values you supplied is not valid."
    errorcode="2">
  </cfif>

  <!--- If any database problems came up during above validation steps --->
  <cfcatch type="Database">
    <cfthrow type="ows.MerchOrder.ValidationFailed"
    message="Order Validation Failed"
    detail="A database problem occured while attempting to validate the order.">
  </cfcatch>
</cftry>

<!--- Begin Òorder" database transaction here --->
<!--- Can be rolled back or committed later --->
<cftransaction action="begin">
  <cftry>
    <!--- Insert new record into Orders table --->
    <cfquery datasource="#APPLICATION.dataSource#">
    INSERT INTO MerchandiseOrders (
    ContactID, 
    OrderDate, 
    ShipAddress, ShipCity,
    ShipState, ShipZip, 
    ShipCountry)
    VALUES (
    #ATTRIBUTES.contactID#, 
    <cfqueryparam cfsqltype="CF_SQL_TIMESTAMP" 
    value="#dateFormat(Now())# #timeFormat(Now())#">, 
    Ô#ATTRIBUTES.shipAddress#Õ, Ô#ATTRIBUTES.shipCity#Õ,
    Ô#ATTRIBUTES.shipState#Õ, Ô#ATTRIBUTES.shipZip#Õ, 
    Ô#ATTRIBUTES.shipCountry#Õ
    )
    </cfquery> 
    
    <!--- Get just-inserted OrderID from database --->
    <cfquery datasource="#APPLICATION.dataSource#" name="getNew">
    SELECT MAX(OrderID) AS NewID
    FROM MerchandiseOrders
    </cfquery>
    
    <!--- For each item in userÕs shopping cart --->
    <cfloop from="1" to="#listLen(ATTRIBUTES.merchList)#" index="i">
      <cfset thisMerchID = listGetAt(ATTRIBUTES.merchList, i)>
      <cfset thisQuant = listGetAt(ATTRIBUTES.quantList, i)>
 
       <!--- Add the item to ÒOrdersItems" table --->
       <cfquery datasource="#APPLICATION.dataSource#">
       INSERT INTO MerchandiseOrdersItemsf
       (OrderID, ItemID, OrderQty, ItemPrice)
       SELECT
       #getNew.NewID#, MerchID, #thisQuant#, MerchPrice
       FROM Merchandise
       WHERE MerchID = #thisMerchID#
       </cfquery>
    </cfloop>
 
    <!--- Get the total of all items in userÕs cart --->
    <cfquery datasource="#APPLICATION.dataSource#" name="getTotal">
    SELECT SUM(ItemPrice * OrderQty) AS OrderTotal
    FROM MerchandiseOrdersItems
    WHERE OrderID = #getNew.NewID#
    </cfquery>
 
    <!--- Attempt to process the transaction --->
    <cf_ProcessPayment
    processor="#ATTRIBUTES.processor#"
    orderID="#getNew.NewID#"
    orderAmount="#getTotal.OrderTotal#"
    creditCard="#ATTRIBUTES.creditCard#"
    creditExpM="#ATTRIBUTES.creditExpM#"
    creditExpY="#ATTRIBUTES.creditExpY#"
    creditName="#ATTRIBUTES.creditName#"
    returnVariable="chargeInfo">
    
    <!--- If the order was processed successfully --->
    <cfif chargeInfo.IsSuccessful>
      <!--- Commit the transaction to database --->
      <cftransaction action="Commit"/>
    <cfelse> 
      <!--- Rollback the Order from the Database --->
      <cftransaction action="RollBack"/>
    </cfif> 

    <!--- If any errors occur while processing the order ---> 
    <cfcatch type="Any">
      <!--- Rollback the Order from the Database --->
      <cftransaction action="RollBack"/>
      <!--- Throw a custom exception --->
      <cfthrow type="ows.MerchOrder.OrderFailed"
      message="Order Could Not Be Completed"
      detail="The order (ID #getNew.NewID#) was rolled back from the database."
      errorcode="3">
    </cfcatch>
  </cftry>
</cftransaction>

<!--- If the order was processed successfully --->
<cfif chargeInfo.IsSuccessful>
  <!--- Send Confirmation E-Mail, via Custom Tag --->
  <cf_SendOrderConfirmation
  orderID="#getNew.NewID#"
  useHTML="#ATTRIBUTES.htmlMail#"> 
</cfif>

<!--- Return status values to callling template --->
<cfset "Caller.#ATTRIBUTES.returnVariable#" = chargeInfo>
