<!--- 
 Filename: StoreCheckout.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Places an order for all items in user's shopping cart
 Please Note Relies upon <CF_PlaceOrder> custom tag
--->

<!--- Show header images, etc., for Online Store --->
<cfinclude template="StoreHeader.cfm">

<!--- Get current cart contents, via Custom Tag --->
<cf_ShoppingCart action="List" returnVariable="GetCart">
 
<!--- Stop here if user's cart is empty --->
<cfif getCart.recordCount eq 0>
 There is nothing in your cart.
 <cfabort>
</cfif>

<!--- If user is not logged in, force them to now ---> 
<cfif not isDefined("SESSION.auth.isLoggedIn")>
  <cfinclude template="LoginForm.cfm">
  <cfabort>
</cfif> 

<!--- If user is attempting to place order --->
<cfif isDefined("FORM.isPlacingOrder")>
 
  <cftry>
    <!--- Attempt to process the transaction --->
    <cf_PlaceOrder
    processor="JustTesting"
    contactID="#SESSION.auth.contactID#"
    merchList="#valueList(getCart.MerchID)#"
    quantList="#valueList(getCart.Quantity)#"
    creditCard="#FORM.creditCard#"
    creditExpM="#FORM.creditExpM#"
    creditExpY="#FORM.creditExpY#"
    creditName="#FORM.creditName#"
    shipAddress="#FORM.shipAddress#"
    shipState="#FORM.shipState#"
    shipCity="#FORM.shipCity#"
    shipZIP="#FORM.shipZIP#"
    shipCountry="#FORM.shipCountry#"
    htmlMail="#FORM.htmlMail#"
    returnVariable="orderInfo">
    
    <!--- If any exceptions in the "ows.MerchOrder" family are thrown... ---> 
    <cfcatch type="ows.MerchOrder">
    <p>Unfortunately, we are not able to process your order at the moment.
    Please try again later. We apologize for the inconvenience.</p>
    <cfabort>
    </cfcatch> 
  </cftry>  
 
  <!--- If the order was processed successfully --->
  <cfif orderInfo.isSuccessful>
  
    <!--- Empty user's shopping cart, via custom tag --->
    <cf_ShoppingCart
    ACTION="Empty">
 
    <!--- Display Success Message --->
    <cfoutput>
    <h2>Thanks For Your Order</h2>
    <p><b>Your Order Has Been Placed.</b><br>
    Your order number is: #OrderInfo.OrderID#<br>
    Your credit card has been charged:
    #lsCurrencyFormat(OrderInfo.OrderAmount)#</p>
    <p>A confirmation is being E-mailed to you.</p>
    </cfoutput>
    
    <!--- stop here. --->
    <cfabort>
  <cfelse>
    <!--- Display "Error" message --->
    <font color="red">
    <p><strong>Your credit card could not be processed.</strong><br>
    Please verify the credit card number, expiration date, and 
    name on the card.</p>
    </font>
 
    <!--- Show debug info if viewing page on server --->
    <cfif CGI.remote_addr eq "127.0.0.1">
      <cfoutput>
      Status: #orderInfo.Status#<br>
      Error: #orderInfo.ErrorCode#<br>
      Message: #orderInfo.ErrorMessage#<br>
      </cfoutput>
    </cfif>
  </cfif> 
</cfif>


<!--- Show Checkout Form (Ship Address/Credit Card) --->
<cfinclude template="StoreCheckoutForm.cfm">
