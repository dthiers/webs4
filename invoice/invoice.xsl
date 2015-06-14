<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	
	<xsl:decimal-format decimal-separator="," grouping-separator="."/>
	
	<xsl:template match="/">
    <fo:root>
			
      <fo:layout-master-set>
        <fo:simple-page-master margin-top="15mm" margin-right="5mm" margin-bottom="5mm" margin-left="5mm" page-width="210mm" page-height="297mm" master-name="A4">
          <fo:region-body margin-top="4.2cm" margin-right="1cm" margin-bottom="2cm" margin-left="1cm" region-name="xsl-region-body"/>
					<fo:region-before extent="4.2cm"/>
					<fo:region-after extent="1.5cm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
			
      <fo:page-sequence master-reference="A4" font-family="'Minion Pro', serif" line-height="1.5em">
				
				<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="center">
						<fo:external-graphic src="url('butterfly.svg')" content-height="3cm" content-width="4cm"/>
					</fo:block>
				</fo:static-content>
				
				<fo:static-content flow-name="xsl-region-after" font-size="10pt" text-align="center" font-style="italic" color="#FC6F08">
					<fo:block>
						MijnBedrijf • Hoofdstraat 42 • 4321 AZ • Nergensoord • tel.: 06-12 34 56 78 • KvK: 12345678
					</fo:block>
					<fo:block>
						BTW-nr.: NL123456789B01 • IBAN: NL99 BANK 0123 4567 89 • www.mijnbedrijf.nl
					</fo:block>
				</fo:static-content>
				
        <fo:flow flow-name="xsl-region-body">
          <xsl:apply-templates select="//customer"/>
					
					<fo:table margin-top="-26mm">
						<fo:table-column column-width="158mm"/>
						<fo:table-column column-width="22mm"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell text-align="right" padding="1mm">
									<fo:block font-style="italic">
										datum
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm">
									<fo:block>
										<xsl:value-of select="//date"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell text-align="right" padding="1mm">
									<fo:block font-style="italic">
										factuurnummer
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm">
									<fo:block>
										<xsl:value-of select="//invoice"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					
					<fo:block color="#eee" font-style="italic" font-weight="bold" font-size="5cm" text-align="center" margin-top="36mm">
						factuur
					</fo:block>
					
					<fo:table margin-top="-2mm">
						<fo:table-column column-width="105mm"/>
						<fo:table-column column-width="15mm"/>
						<fo:table-column column-width="30mm"/>
						<fo:table-column column-width="30mm"/>
						
						<fo:table-header font-style="italic" border-bottom="0.1mm solid #ccc">
							<fo:table-cell><fo:block>omschrijving</fo:block></fo:table-cell>
							<fo:table-cell><fo:block text-align="center">aantal</fo:block></fo:table-cell>
							<fo:table-cell><fo:block text-align="right">prijs</fo:block></fo:table-cell>
							<fo:table-cell><fo:block text-align="right">subtotaal</fo:block></fo:table-cell>
						</fo:table-header>
						
						<fo:table-body>
							<xsl:apply-templates select="//lineitem"/>
							
							<fo:table-row line-height="1em" color="white" border-top="0.1mm solid #ccc">
								<fo:table-cell><fo:block>x</fo:block></fo:table-cell>
								<fo:table-cell><fo:block>x</fo:block></fo:table-cell>
								<fo:table-cell><fo:block>x</fo:block></fo:table-cell>
								<fo:table-cell><fo:block>x</fo:block></fo:table-cell>
							</fo:table-row>
							
							<fo:table-row>
								<fo:table-cell>
									<fo:block>
										<xsl:text> </xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:text> </xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="after">
									<fo:block text-align="right" font-style="italic">
										totaal ex. BTW
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="right" display-align="after">
									<fo:block>
										<xsl:value-of select="format-number(/order/subtotal, '€ 0,00')"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							
							<fo:table-row border-bottom="0.1mm solid #ccc">
								<fo:table-cell>
									<fo:block>
										<xsl:text> </xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:text> </xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-style="italic">
										BTW 21%
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="right">
									<fo:block>
										<xsl:value-of select="format-number(/order/tax, '€ 0,00')"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							
							<fo:table-row line-height="1em" color="white">
								<fo:table-cell><fo:block>x</fo:block></fo:table-cell>
								<fo:table-cell><fo:block>x</fo:block></fo:table-cell>
								<fo:table-cell><fo:block>x</fo:block></fo:table-cell>
								<fo:table-cell><fo:block>x</fo:block></fo:table-cell>
							</fo:table-row>
							
							<fo:table-row font-weight="bold">
								<fo:table-cell>
									<fo:block>
										<xsl:text> </xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block>
										<xsl:text> </xsl:text>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right">
										te betalen
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="right">
									<fo:block>
										<xsl:value-of select="format-number(/order/total, '€ 0,00')"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							
						</fo:table-body>
					</fo:table>
					
					<fo:block margin-top="1cm">
						Graag het bedrag van <fo:inline font-weight="bold"><xsl:value-of select="format-number(/order/total, '€ 0,00')"/></fo:inline> vóór <xsl:value-of select="//duedate"/> overmaken op rekening <fo:inline font-weight="bold">NL99 BANK 0123 4567 89</fo:inline>, onder vermelding van: ‘<fo:inline font-weight="bold">factuurnummer <xsl:value-of select="//invoice"/></fo:inline>’.
					</fo:block>
					<fo:block margin-top="1em">
						Met vriendelijke groet,
					</fo:block>
					<fo:block margin-top="2em">
						De Dikke Deur
					</fo:block>
					
        </fo:flow>
      </fo:page-sequence>
			
    </fo:root>
	</xsl:template>
	
	<xsl:template match="customer">
		<fo:block>
			<xsl:value-of select="company"/>
		</fo:block>
		<fo:block font-style="italic">
			<xsl:text>T.a.v. </xsl:text>
			<xsl:value-of select="contact"/>
		</fo:block>
		<fo:block>
			<xsl:value-of select="address"/>
		</fo:block>
		<fo:block>
			<xsl:value-of select="postalcode"/>
			<xsl:text>  </xsl:text>
			<xsl:value-of select="city"/>
		</fo:block>
	</xsl:template>
	
	<xsl:template match="lineitem">
		<fo:table-row>
			<fo:table-cell>
				<fo:block>
					<xsl:value-of select="description"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell display-align="after">
				<fo:block text-align="center">
					<xsl:value-of select="quantity"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell display-align="after">
				<fo:block text-align="right">
					<xsl:value-of select="format-number(price, '€ 0,00')"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell display-align="after">
				<fo:block text-align="right">
					<xsl:value-of select="format-number(subtotal, '€ 0,00')"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	
</xsl:stylesheet>