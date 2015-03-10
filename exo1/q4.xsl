<?xml version="1.0" encoding="UTF-8" ?>


<xsl:stylesheet version="1.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
	
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates select="//journees">
			<xsl:with-param name="num" select="18"/>
		</xsl:apply-templates>
	</xsl:template>
	<xsl:template match="journees">
		<xsl:param name="num"/>
		<xsl:copy-of select="//journee[$num]"/>
	</xsl:template>
	
</xsl:stylesheet>
