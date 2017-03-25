<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:template match="verb">
  <HTML>
   <HEAD>
    <TITLE>Portugese Conjugation</TITLE>
    <SCRIPT type="text/javascript" src="Conjugator.js" />
    <LINK rel="StyleSheet" href="ConjugatorStyle.css" type="text/css" /> 
    <STYLE type="text/css">
	.green {background-color:#00FF00}
	.red {background-color:#FF0000}
	.white {background-color:#FFFFFF}
	.yellow {background-color:#FFFF00}
    </STYLE>

   </HEAD>

   <BODY>
			<xsl:attribute name="onLoad">
   			load_languages('Portuguese');load_verbs('Portuguese', '<xsl:value-of select="infinitive"/>');
			</xsl:attribute>

      <TABLE id="title">
        <TR>
          <TD>
            Conjugator
          </TD>
        </TR>
      </TABLE>

     <TABLE id="controls">
        <TR>
          <TD> Language: <select id="language_selector" onChange="select_language(this.value);"><option value="None"></option> </select></TD>
    			<TD> Verb: <select id="verb_selector" onChange="select_verb('Portuguese',this.value);"> <option value="None"></option></select>&#x00a0; <input type="button" value="random" disabled="true"/></TD>
    			<TD> Definition: <input type="text" readonly="true"><xsl:attribute name="value"><xsl:value-of select="definition" /></xsl:attribute></input><br /><br/>
     					Comments: <input type="text" readonly="true"><xsl:attribute name="value"><xsl:value-of select="comments" /></xsl:attribute></input><br /></TD>
        </TR>
		<TR><TD colspan="3">
    <HR />
		</TD></TR>
     </TABLE>

    <TABLE id="answers">
    
		<xsl:for-each select="participles">
       <TR><TD align="left"><B>Participles:</B></TD></TR>
		<TR>
     <TD>Present: </TD><TD> <INPUT type="text" id="present" > 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("present", "<xsl:value-of select="present" />", this.value ); </xsl:attribute> 
        </INPUT> </TD>

     <TD>Past: </TD><TD> <INPUT type="text" id="past" > 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("past", "<xsl:value-of select="past" />", this.value ); </xsl:attribute> 
        </INPUT> </TD>
     </TR>
		<TR><TD colspan="6">
    <HR />
		</TD></TR>
		</xsl:for-each>
	
    <xsl:for-each select="conjugation">

     <xsl:for-each select="mood">
       <TR><TD align="left"><B><xsl:value-of select="@text"/>:</B></TD></TR>
     </xsl:for-each>
		<TR>
     <TD>eu</TD><TD> <INPUT type="text"> 
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_FPS</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_FPS", "<xsl:value-of select="FPS" />", this.value ); </xsl:attribute> 
        </INPUT> </TD>

     <TD>tu</TD><TD> <INPUT type="text"> 
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_SPS</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_SPS", "<xsl:value-of select="SPS" />", this.value ); </xsl:attribute> 
        </INPUT></TD>

     <TD>ele/ela/voc&#x00ea;</TD><TD> <INPUT type="text"> 
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_TPS</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_TPS", "<xsl:value-of select="TPS" />", this.value ); </xsl:attribute> 
        </INPUT></TD>
     </TR>
		<TR>

     <TD>n&#243;s</TD> <TD><INPUT type="text"> 
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_FPP</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_FPP", "<xsl:value-of select="FPP" />", this.value ); </xsl:attribute> 
        </INPUT></TD>

    <TD>v&#243;s</TD><TD> <INPUT type="text"> 
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_SPP</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_SPP", "<xsl:value-of select="SPP" />", this.value ); </xsl:attribute> 
        </INPUT></TD>

     <TD>eles/elas/voc&#x00ea;s</TD><TD> <INPUT type="text"> 
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_TPP</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_TPP", "<xsl:value-of select="TPP" />", this.value ); </xsl:attribute> 
        </INPUT></TD>
			</TR>
		<TR><TD colspan="6">
    <HR />
		</TD></TR>
    </xsl:for-each>










    <xsl:for-each select="imperative">

     <xsl:for-each select="mood">
       <TR><TD align="left"><B><xsl:value-of select="@text"/>:</B></TD></TR>
     </xsl:for-each>
		<TR>

     <TD>tu</TD><TD> <INPUT type="text"> 
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_SPS</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_SPS", "<xsl:value-of select="SPS" />", this.value ); </xsl:attribute> 
        </INPUT></TD>



    <TD>v&#243;s</TD><TD> <INPUT type="text"> 
         <xsl:attribute name="id"> <xsl:value-of select="mood"/>_SPP</xsl:attribute> 
         <xsl:attribute name="onkeyup"> javascript:test_the_string("<xsl:value-of select="mood"/>_SPP", "<xsl:value-of select="SPP" />", this.value ); </xsl:attribute> 
        </INPUT></TD>

			</TR>
		<TR><TD colspan="6">
    <HR />
		</TD></TR>
    </xsl:for-each>






    </TABLE>
   </BODY>
	
  </HTML>
 </xsl:template>

</xsl:stylesheet>
