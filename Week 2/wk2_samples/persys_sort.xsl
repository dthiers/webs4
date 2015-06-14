<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="PERIODIC_TABLE">
      <HTML>
        <HEAD>
          <TITLE>Atomic Number vs. Atomic Weight</TITLE>
        </HEAD>
        <BODY>
          <H1>Atomic Number vs. Atomic Weight</H1>
          <TABLE>
            <TH>Element</TH>
            <TH>Atomic Number</TH>
            <TH>Atomic Weight</TH>
            <xsl:apply-templates>
              <xsl:sort data-type="number" select="ATOMIC_NUMBER"/>
            </xsl:apply-templates>
          </TABLE>
        </BODY>
      </HTML>
    </xsl:template>

    <xsl:template match="ATOM">
      <TR>
        <TD><xsl:apply-templates select="NAME"/></TD>
        <TD><xsl:apply-templates select="ATOMIC_NUMBER"/></TD>
        <TD><xsl:apply-templates select="ATOMIC_WEIGHT"/></TD>
      </TR>
    </xsl:template>

</xsl:stylesheet>