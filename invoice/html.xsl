<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:decimal-format decimal-separator="," grouping-separator="."/>
	
	<xsl:template match="/">
		<html>
			<head>
				<style>
					body { width:720px; }
					th, td { padding:2px 10px 2px 0; vertical-align:bottom; }
					th { font-weight:normal; font-style:italic; border-bottom:1px solid #ddd; }
					#lineitems { clear:both; background:#eee; border-radius:10px; padding:20px; }
					footer { font-size:80%; font-style:italic; text-align:center; }
				</style>
				<title>Factuurtje</title>
			</head>
			<body>
				<h1>Factuur</h1>
				<xsl:apply-templates select="//customer"/>
				<table style="float:right;">
					<tr><td style="text-align:right;"><em>datum</em></td><td><xsl:value-of select="//date"/></td></tr>
					<tr><td style="text-align:right;"><em>factuurnummer</em></td><td><xsl:value-of select="//invoice"/></td></tr>
				</table>
				<table id="lineitems">
					<tr><th style="text-align:left;">omschrijving</th><th>aantal</th><th style="text-align:right;width:100px;">prijs</th><th style="text-align:right; width:70px;">subtotaal</th></tr>
					<xsl:apply-templates select="//lineitem"/>
					<tr>
						<td style="border-top:1px solid #ddd;"></td>
						<td style="border-top:1px solid #ddd;"></td>
						<td style="border-top:1px solid #ddd; text-align:right;">totaal ex. BTW</td>
						<td style="border-top:1px solid #ddd; text-align:right;"><xsl:value-of select="format-number(/order/subtotal, '€ 0,00')"/></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td style="text-align:right;">BTW 21%</td>
						<td style="text-align:right;"><xsl:value-of select="format-number(/order/tax, '€ 0,00')"/></td>
					</tr>
					<tr>
						<td style="border-top:1px solid #ddd;"></td>
						<td style="border-top:1px solid #ddd;"></td>
						<td style="border-top:1px solid #ddd; text-align:right;"><strong>te betalen</strong></td>
						<td style="border-top:1px solid #ddd; text-align:right;"><strong><xsl:value-of select="format-number(/order/total, '€ 0,00')"/></strong></td>
					</tr>
				</table>
				<p>Graag het bedrag van <strong><xsl:value-of select="format-number(/order/total, '€ 0,00')"/></strong> vóór <xsl:value-of select="//duedate"/> overmaken op rekening <strong>NL99 BANK 0123 4567 89</strong>, onder vermelding van: ‘<strong>factuurnummer <xsl:value-of select="//invoice"/></strong>’.</p>
				<footer>
					<p>MijnBedrijf • Hoofdstraat 42 • 4321 AZ • Nergensoord • tel.: 06-12 34 56 78 • KvK: 12345678<br/>BTW-nr.: NL123456789B01 • IBAN: NL99 BANK 0123 4567 89 • www.mijnbedrijf.nl</p>
				</footer>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="customer">
		<p style="float:left;">
			<xsl:value-of select="company"/><br/>
			<em>T.a.v. <xsl:value-of select="contact"/></em><br/>
			<xsl:value-of select="address"/><br/>
			<xsl:value-of select="postalcode"/><xsl:text> </xsl:text><xsl:value-of select="city"/>
		</p>
	</xsl:template>
	
	<xsl:template match="lineitem">
		<tr>
			<td><xsl:value-of select="description"></xsl:value-of></td>
			<td style="text-align:center;"><xsl:value-of select="quantity"></xsl:value-of></td>
			<td style="text-align:right;"><xsl:value-of select="format-number(price, '€ 0,00')"></xsl:value-of></td>
			<td style="text-align:right;"><xsl:value-of select="format-number(subtotal, '€ 0,00')"></xsl:value-of></td>
		</tr>
	</xsl:template>
	
</xsl:stylesheet>