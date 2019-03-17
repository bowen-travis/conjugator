<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:template match="verb">
  <html>
   <head>
    <title>German Conjugation</title>
    <script type="text/javascript" src="Conjugator.js" />
    <link rel="StyleSheet" href="ConjugatorStyle.css" type="text/css" />
    <STYLE type="text/css">
	.green {background-color:#00FF00}
	.red {background-color:#FF0000}
	.white {background-color:#FFFFFF}
	.yellow {background-color:#FFFF00}
    </STYLE>

   </head>

   <body>
			<xsl:attribute name="onLoad">
   			load_languages('German');load_verbs('German', '<xsl:value-of select="infinitive"/>');
			</xsl:attribute>

      <table id="title">
        <tr>
          <td>
            Conjugator
          </td>
        </tr>
      </table>
<br/>
     <table id="controls">
        <tr>
          <td> Language: <select id="language_selector" onChange="select_language(this.value);"><option value="None"></option> </select></td>
    			<td> Verb: <select id="verb_selector" onChange="select_verb('German',this.value);"> <option value="None">Choose...</option></select>&#x00a0; </td>
    			<td> Definition: <input type="text" readonly="true"><xsl:attribute name="value"><xsl:value-of select="definition" /></xsl:attribute></input><br /><br/>
     					Comments: <input type="text" readonly="true"><xsl:attribute name="value"><xsl:value-of select="comments" /></xsl:attribute></input><br /></td>
        </tr>
				<tr><td colspan="3"><br/><hr/></td></tr>
     </table>

    <table id="answers">

    <xsl:for-each select="participles">
       <tr><td align="left"><strong>Participles:</strong></td></tr>
    <tr>
     <td>Present: </td><td> <input type="text" id="present" >
         <xsl:attribute name="onkeyup"> javascript:test_the_string("present", "<xsl:value-of select="present" />", this.value ); </xsl:attribute>
        </input> </td>

     <td>Past: </td><td> <input type="text" id="past" >
         <xsl:attribute name="onkeyup"> javascript:test_the_string("past", "<xsl:value-of select="past" />", this.value ); </xsl:attribute>
        </input> </td>
     </tr>
    <tr><td colspan="6">
    <hr />
    </td></tr>
    </xsl:for-each>

    <xsl:for-each select="conjugation">

     <xsl:for-each select="mood">
       <tr><td align="left"><strong><xsl:value-of select="@text"/>:</strong></td></tr>
     </xsl:for-each>
		<tr>
     <td>ich</td><td> <input type="text">
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_FPS</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_FPS", "<xsl:value-of select="FPS" />", this.value ); </xsl:attribute> 
        </input> </td>

     <td>du</td><td> <input type="text">
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_SPS</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_SPS", "<xsl:value-of select="SPS" />", this.value ); </xsl:attribute> 
        </input></td>

     <td>er/sie/es</td><td> <input type="text">
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_TPS</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_TPS", "<xsl:value-of select="TPS" />", this.value ); </xsl:attribute> 
        </input></td>
     </tr>
		<tr>

     <td>wir</td> <td><input type="text">
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_FPP</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_FPP", "<xsl:value-of select="FPP" />", this.value ); </xsl:attribute> 
        </input></td>

    <td>ihr</td><td> <input type="text">
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_SPP</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_SPP", "<xsl:value-of select="SPP" />", this.value ); </xsl:attribute> 
        </input></td>

     <td>sie</td><td> <input type="text">
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_TPP</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_TPP", "<xsl:value-of select="TPP" />", this.value ); </xsl:attribute> 
        </input></td>
			</tr>
		<tr><td colspan="6">
    <hr />
		</td></tr>
    </xsl:for-each>
    </table>
   </body>
	
  </html>
 </xsl:template>

</xsl:stylesheet>
