<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:template match="conjugator">
  <HTML>
   <HEAD>
    <TITLE>Conjugator</TITLE>
    <SCRIPT type="text/javascript" src="Conjugator.js" />
    <LINK rel="StyleSheet" href="ConjugatorStyle.css" type="text/css" /> 
   </HEAD>

   <BODY onload="load_languages('None');">
	<div id="Content">	
    <TABLE id="title">
        <TR>
          <TD>
            Conjugator
          </TD>
        </TR>
      </TABLE>

     <TABLE id="controls">
        <TR>
          <TD> Language: <select id="language_selector" onChange="select_language(this.value);"><option value="None">Choose...</option></select></TD>
	  <TD> Verb: <select disabled="true"> </select>&#x00a0; </TD>
	  <TD> Definition: <input type="text" disabled="true"><xsl:attribute name="value"><xsl:value-of select="definition" /></xsl:attribute></input><br /><br/> 
	   Comments: <input type="text" disabled="true"><xsl:attribute name="value"><xsl:value-of select="comments" /></xsl:attribute></input></TD>
        </TR>
		<TR><TD colspan="3"><hr/></TD></TR> 
     </TABLE>
</div>

   </BODY>
	
  </HTML>
 </xsl:template>

</xsl:stylesheet>
