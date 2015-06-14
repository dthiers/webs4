<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="adresboek">
<!--<html>
  <head>
     <title></title>
  </head>
  <body bgcolor="lightblue">-->
    <table border="1">
      <tr>
        <th align="right">Nr</th>
        <th>Naam:<br/>(Let op spatie)</th>
        <th>Bijnaam:</th>
        <th>Geboortedatum:<br/>(element)</th>
        <th>Geboortedatum:<br/>(subelementen)</th>
        <th>Telefoon:</th>
        <th>Email:<br/>(methode 1)</th>
        <th>Email:<br/>(methode 2)</th>
      </tr>
      <xsl:apply-templates select="persoon">
        <xsl:sort select="@adresid" data-type="number"/>
      </xsl:apply-templates>
    </table>
<!--  </body>
</html>-->
</xsl:template>

<xsl:template match="persoon">
  <tr>
    <td align="right"><xsl:value-of select="@adresid"/></td>
    <td><xsl:value-of select="naam/voornaam"/>
	    <xsl:text> </xsl:text>
        <xsl:value-of select="naam/famnaam"/></td>
    <td><xsl:value-of select="naam/bijnaam"/></td>
    <td><xsl:value-of select="gebdat"/></td>
    <td><xsl:apply-templates select="gebdat"/></td>
    <td><xsl:value-of select="tel"/></td>
    <td>
	  <a>
	    <xsl:attribute name="href">mailto:<xsl:value-of select="email"/>
	    </xsl:attribute>
        <xsl:value-of select="email"/>
      </a>
    </td>
    <td>
	  <xsl:variable name="href">
        <xsl:value-of select="email"/>
	  </xsl:variable>
	  <a href="mailto:{$href}">
        Stuur <xsl:value-of select="naam/voornaam"/> een mailtje
      </a>
    </td>
  </tr>
</xsl:template>

<xsl:template match="gebdat">
  <xsl:value-of select="dag"/>-<xsl:value-of select="maand"/>-<xsl:value-of select="jaar"/>
</xsl:template>

</xsl:stylesheet>
