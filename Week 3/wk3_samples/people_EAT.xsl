<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <body>
    <h3>Aantal elementen+attributen+text-nodes:<xsl:value-of select="count(//*|//@*|//text())"/></h3>
    <xsl:apply-templates select="//*|//@*|//text()"/>
    <!--<xsl:apply-templates />-->
    </body>
  </html>
</xsl:template>

<xsl:template match="*">
  <b><xsl:value-of select="position()"/>-Element <xsl:value-of select="name()"/></b>:<xsl:value-of select="."/><br/>
</xsl:template>

<xsl:template match="@*">
  <b><xsl:value-of select="position()"/>-Attribute <xsl:value-of select="name()"/></b>:<xsl:value-of select="."/><br/>
</xsl:template>

<xsl:template match="text()">
  <b><xsl:value-of select="position()"/>-Text <xsl:value-of select="name()"/></b>:<xsl:value-of select="."/><br/>
</xsl:template>

</xsl:stylesheet>

