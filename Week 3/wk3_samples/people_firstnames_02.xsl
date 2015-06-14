<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <body>
    <xsl:apply-templates select="//first_name/text()"/>
    </body>
  </html>
</xsl:template>

<xsl:template match="text()">
  <b><xsl:value-of select="position()"/></b>:<xsl:value-of select="."/><br/>
</xsl:template>

</xsl:stylesheet>

