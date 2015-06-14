<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
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
  <xsl:for-each select="kennisgebied">
    <xsl:sort select="@richting" />
    <tr>
        <td><xsl:apply-templates select="naam"/></td>
        <td><xsl:apply-templates select="@richting"/></td>
        <td><xsl:apply-templates select="coordinator/docent"/></td>
        <td><xsl:apply-templates select="coordinator/kamer"/></td>
        <td><xsl:apply-templates select="coordinator/email"/></td>
	</tr>
  </xsl:for-each>
</table>

</body>
</html>
</xsl:template>


<xsl:template match="naam">
  <i><xsl:value-of select="." /></i>
</xsl:template>

<xsl:template match="@richting">
  <center><xsl:value-of select="." /></center>
</xsl:template>

<xsl:template match="coordinator/docent">
  <xsl:value-of select="." />
</xsl:template>

<xsl:template match="coordinator/kamer">
  <xsl:value-of select="." />
</xsl:template>

<xsl:template match="coordinator/email">
  <xsl:value-of select="." />
</xsl:template>

</xsl:stylesheet>

