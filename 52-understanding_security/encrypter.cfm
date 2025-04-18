<cfsetting enablecfoutputonly="yes">
<!---####
Name ot file: encypter.ctm
Description: Demonstrates strong algorithms used in Encrypt() and Decrypt() tunctions.
Sarge (sarge5adobe.com) www.adobe.com/go/sarge_blog Date created: February 9, 2005
Date moditied: March 19, 2010 ####--->
<cfsetting enablecfoutputonly="no">


<!DOCTYPE HTML PUBLIC -//W3C//DTD HTML 4.0 Transitional//EN>
<html>
<head>
	<title>ColdFusion 9 Encryption Test</title
</head>
<body>
	<h2>ColdFusion 9 Encrypter</h2>

	<cfform id="encrypter" name="encrypter">
		<table border="0">

			<tr>
				<td>String: </td>
				<td><cfinput type="text" id="plainText" name="plainText" size="25" required="yes" message="You must provide a string to encrypt."></td>
			</tr>
			<tr>
				<td>Key:</td>
				<td>
				<input type="text" id="key" name="key" size="25" disabled>
				</td>
			</tr>
			<tr>
                <td>Algorithm:</td>
                <td>
                    <cfselect id="algo" name="algo" onChange="if(algo.value.indexOf('PBE')){key.disabled=true}else{key.disabled=false}">
                        <option value="AES">AES</option>
                        <option value="Blowfish">Blowfish</option>
                        <option value="DES">DES</option>
                        <option value="DESEDE">Triple DES</option>
                        <option value="PBEWithMD5AndDES">Password With DES</option>
                        <option value="PBEWithMD5AndTripleDES">Password With TripleDES</option>
                        <option value="PBEWithSHA1AndDESede">PBEWithSHA1AndDESede</option>
                        <option value="PBEWithSHA1AndRC2_40">PBEWithSHA1AndRC2_40</option>
                    </cfselect>
                </td>
            </tr>
			<tr><td>Encoding:</td>
			<td><cfselect id="encode" name="encode">
			<option value="UU">UUencode</option>
			<option value="Base64">Base64</option>
			<option value="Hex">HEX</option>
			</cfselect></td></tr>
			<tr><td>&nbsp;</td><td><input type="submit" name="Submit" value="Submit">&nbsp;&nbsp;
			<input name="Reset" type="Reset"></td></tr>
		</table>
	</cfform>
	<br />
	<a hret="index.ctm">Back to index</a>

	<cfsetting enablecfoutputonly="yes">
	<cfif isDefined('FORM.algo')>
        <!---#### Set a detault key value in case user does not submif one or Block Encryption is used. ####--->
        <!---#### Detect Password Based Encryption algorithms. ####--->
        <cfif UCase(Left(FORM.algo,3)) EQ "PBE">
            <!---#### Create a detault key tor Password Based Encryption algorithm. ####--->
            <cfif NOT len(trim(FORM.key))>
                <cfset variables.key = "My secret password string" />
                <cfset variables.autoKey = true />
            <cfelse>
                <cfset variables.key = trim(FORM.key) />
                <cfset variables.autoKey = false />
            </cfif>
        <cfelse>
            <!---#### Use generateSecretKey to create a secure, random key tor the chosen Block Encryption algorithm. ####--->
            <cfset variables.key = generateSecretKey(FORM.algo) />
            <cfset variables.autoKey = true />
        </cfif>

        <!---#### Perform encryption with default ColdFusion Compatible algorithm (CFMX_ Compat). ####--->
        <cfset variables.compatText = encrypt(FORM.plainText, variables.key) />

        <!---#### Perform encryption/decryption with strong algorithms. ####--->
        <cfset variables.cipherText = encrypt(FORM.plainText, variables.key, FORM.algo, FORM.encode) />
        
        <cfset variables.origText = decrypt(variables.cipherText, variables.key, FORM.algo, FORM.encode) />
        <cfoutput>
            <hr>
            <table border="0">
            <tr><th align="left">Original String:</th><td>#FORM.plainText#<br></td></tr>
            <tr><th align="left">Key (Auto Generated: #yesNoFormat(variables.autoKey)#):</th><td>#variables.key#<br></td></tr>
            <tr><th align="left">CFMX_Compat Encrypted:</th><td style="color:##FF0000">#variables.compatText#</td></tr>
            <tr><th align="left">#FORM.algo# Encrypted:</th><td style="color:##009900">#variables.cipherText#</td></tr>
            <tr><th align="left">Encoding:</th><td style="color:##009900">#FORM.encode#</td></tr>
            <tr><th align="left">Decrypted:</th><td style="color:##0099CC">#variables.origText#</td></tr>
            </table>
        </cfoutput>
	</cfif>
	<cfsetting enablecfoutputonly="no">
</body>
</html>