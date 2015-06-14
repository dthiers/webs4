<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="PERIODIC_TABLE">
    <HTML>
      <HEAD><TITLE>Gases</TITLE></HEAD>
      <BODY>
        <xsl:apply-templates/>
      </BODY>
    </HTML>
  </xsl:template>

  <xsl:template match="ATOM"/>

  <xsl:template match="ATOM[@STATE='GAS']">
    <P><xsl:value-of select="."/></P>
  </xsl:template>

</xsl:stylesheet>