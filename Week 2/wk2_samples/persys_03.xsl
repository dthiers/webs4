<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/PERIODIC_TABLE">
  <HTML>
  <HEAD><TITLE>The Elements</TITLE></HEAD>
  <BODY>
  <H2>Table of Contents</H2>
  <UL>
    <xsl:apply-templates select="ATOM" mode="toc"/>
  </UL>
  <H2>The Elements</H2>
    <xsl:apply-templates select="ATOM" mode="full"/>
  </BODY>
  </HTML>
</xsl:template>

<xsl:template match="ATOM" mode="toc">
  <LI><A>
    <xsl:attribute name="HREF">#<xsl:value-of
      select="SYMBOL"/></xsl:attribute>
    <xsl:value-of select="NAME"/>
  </A></LI>
</xsl:template>

<xsl:template match="ATOM" mode="full">
  <H3><A>
  <xsl:attribute name="NAME">
    <xsl:value-of select="SYMBOL"/>
  </xsl:attribute>
  <xsl:value-of select="NAME"/>
  </A></H3>
  <P>
    <xsl:value-of select="."/>
  </P>
</xsl:template>

</xsl:stylesheet>