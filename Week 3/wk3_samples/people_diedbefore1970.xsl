<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
    <body>
    <xsl:apply-templates select="//person[@died &lt;= 1970]" />
    </body>
  </html>
</xsl:template>

<xsl:template match="person">
  <b><xsl:value-of select="position()"/></b>:<xsl:value-of select="name/first_name"/> <xsl:value-of select="name/last_name"/> <br/>
</xsl:template>

</xsl:stylesheet>

