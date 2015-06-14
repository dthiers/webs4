<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="aii">
<html>
<head></head>
<body>

<table border="1">
  <tr>
    <th>Kennisgebied</th>
    <th>Richting</th>
    <th>Coordinator</th>
    <th>Kamer</th>
    <th>E-mail</th>
  </tr>
  <xsl:apply-templates select="kennisgebied">
     <xsl:sort select="naam" />
  </xsl:apply-templates>
</table>

</body>
</html>
</xsl:template>

<xsl:template match="kennisgebied">
    <tr>
      <td><xsl:apply-templates select="naam"/></td>
      <td>@ri-><xsl:value-of select="@richting"/></td>
      <td><xsl:apply-templates select="coordinator/docent"/></td>
      <td><xsl:apply-templates select="coordinator/kamer"/></td>
      <td><xsl:apply-templates select="coordinator/email"/></td>
    </tr>
</xsl:template>

<xsl:template match="naam">
  <i><xsl:value-of select="."/>:</i>
</xsl:template>

<xsl:template match="@richting">
  <center>rrr<xsl:value-of select="@richting"/></center>
</xsl:template>

<xsl:template match="coordinator/docent">
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="coordinator/kamer">
  <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="coordinator/email">
  <xsl:value-of select="."/>
</xsl:template>

</xsl:stylesheet>

