<cfsetting enablecfoutputonly="yes">
    <!---####
    Name ot file: hasher.ctm
    Description: Demonstrates strong algorithms used in the Hash() tunction. Author name and e-mail: Sarge (sarge5sargeway.com) www.sargeway.com/blog Date created: February 9, 2005
    Date modified: March 19, 2010 ####--->
    
    <!---#### Set the detault encoding. ####--->
    <cfparam name="FORM.encode" default="UTF-8" type="string">
    <!--- <cfparam name="FORM.encode" default="ISO-8859-1" type="string"> --->
    <!---#### Create a object to hold all ot the charsets available to the JVM. ####--->
    <cfobject type="java" name="cs" class="java.nio.charset.Charset" action="create">
    <cfset variables.charSets = cs.availableCharsets()>
    <cfsetting enablecfoutputonly="no">
    <!DOCTYPE HTML PUBLIC -//W3C//DTD HTML 4.0 Transitional//EN>
    <html>
        <head>
        <title>ColdFusion 9 Hash Test</title>
        </head>
        <body>


            <h2>ColdFusion 9 Hasher</h2>
            <cfform name="hasher">
                <table border="0">
                <tr>
                    <td>String: </td>
                    <td>
                        <cfinput type="text" name="plainText" size="25" required="yes" message="You must provide a string to hash.">
                    </td>
                </tr>
                <tr>
                    <td>Algorithm:</td>
                    <td>
                        <cfselect name="algo">
                            <option value="MD2">MD2</option>
                            <option value="MD5">MD5</option>
                            <option value="SHA">SHA-1</option>
                            <option value="SHA-256">SHA-256</option>
                            <option value="SHA-384">SHA-384</option>
                            <option value="SHA-512">SHA-512</option>
                        </cfselect>
                    </td>
                </tr>
                <tr>
                    <td>Encoding:</td>
                    <td>
                        <!--- <cfdump var="#charSets#" > --->
                        <cfselect name="encode">
                            <cfoutput>
                                <cfloop collection="#charSets#" item="set">
                                    <option value="#charSets[set]#"<cfif findNoCase(FORM.encode, set)>selected</cfif>>
                                        #charSets[set]#
                                    </option>
                                </cfloop>
                            </cfoutput>
                        </cfselect>
                        
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <input type="submit" name="Submit" value="Submit">&nbsp;&nbsp;
                        <input name="Reset" type="Reset">
                    </td>
                </tr>
                </table><br />
            </cfform>
            <a hret="index.ctm">Back to index</a>
            <cfsetting enablecfoutputonly="yes">
            <cfif isDefined('FORM.algo')>
                <!---#### Pertorm the hash using submitted algorithm and encoding. ####--->
                <cfset variables.theHash = hash(FORM.plainText, FORM.algo, FORM.encode)>
                <cfoutput>
                    <hr>
                    <table border="0">
                        <tr><th align="left">Original String:</th><td>#FORM.plainText#<br></td></tr>
                        <tr><th align="left">CF Hash:</th><td style="color:##FF0000">#hash(FORM.plainText)#</td></tr>
                        <tr><th align="left">#FORM.algo# Hash:</th><td style="color:##009900">#variables.theHash#<br></td></tr>
                        <tr><th align="left">Hash Length:</th><td style="color:##0099CC">#len(Trim(variables.theHash))#characters</td></tr>
                        <tr><th align="left">Encoding:</th><td style="color:##009900">#FORM.encode#</td></tr>
                    </table>
                </cfoutput>
            </cfif>
            <cfsetting enablecfoutputonly="no">
        </body>
    </html>