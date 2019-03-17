<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:template match="conjugator">
  <html>
   <head>
    <title>Conjugator</title>
    <script type="text/javascript" src="Conjugator.js" />
    <link rel="StyleSheet" href="ConjugatorStyle.css" type="text/css" />
   </head>

   <body onload="load_languages('None');">
	<div id="Content">	
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
          <td> Language: <select id="language_selector" onChange="select_language(this.value);"><option value="None">Choose...</option></select></td>
	  <td> Verb: <select disabled="true"> </select>&#x00a0; </td>
	  <td> Definition: <input type="text" disabled="true"><xsl:attribute name="value"><xsl:value-of select="definition" /></xsl:attribute></input><br /><br/>
	   Comments: <input type="text" disabled="true"><xsl:attribute name="value"><xsl:value-of select="comments" /></xsl:attribute></input></td>
        </tr>
		<tr><td colspan="3"><br/><hr/></td></tr>
     </table>
</div>

   </body>
	
  </html>
 </xsl:template>

</xsl:stylesheet>
