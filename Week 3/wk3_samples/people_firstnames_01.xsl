<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <body>
    <xsl:apply-templates select="/people/person/name/first_name/text()"/>
    </body>
  </html>
</xsl:template>

<xsl:template match="text()">
  <p><strong><xsl:value-of select="position()"/></strong>: <xsl:value-of select="."/></p>
</xsl:template>

</xsl:stylesheet>

