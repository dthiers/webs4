<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:output method="text"/>
	
	<xsl:template match="/">
		USING INVOICE;
		<xsl:apply-templates select="//lineitem"/>
	</xsl:template>
	
	<xsl:template match="lineitem">
		INSERT INTO lineitems (description, price, quantity, subtotal) VALUES ('<xsl:value-of select="description"/>', '<xsl:value-of select="price"/>', '<xsl:value-of select="quantity"/>', '<xsl:value-of select="subtotal"/>');
	</xsl:template>
	
</xsl:stylesheet>