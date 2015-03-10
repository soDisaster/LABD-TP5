<?xml version="1.0" encoding="UTF-8" ?>

<!-- New document created with EditiX at Thu Feb 19 11:08:34 CET 2015 -->

<xsl:stylesheet version="1.0" exclude-result-prefixes="xs xdt err fn" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:err="http://www.w3.org/2005/xqt-errors">
	
	<xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="/">
	<clubs xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:apply-templates select="//club">
				<xsl:with-param name="var" select="//clubs/club/ville"/>
			</xsl:apply-templates>
	</clubs>
	</xsl:template>
	
	<xsl:template match="club">
		<xsl:param name="var" />
		<xsl:choose>
			<xsl:when test="@id= $var">
.       <club><xsl:value-of select="./nom"/></club>
			</xsl:when>
			<xsl:when test="$var = //clubs/club/ville">
.				
<club>
					<xsl:copy-of select="./nom"/>
					<xsl:copy-of select="./ville"/>
					<xsl:apply-templates select="//rencontre">
						<xsl:with-param name="id" select="@id"/>
					</xsl:apply-templates>
</club>
			</xsl:when>
			<xsl:otherwise>

			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
	<xsl:template match="rencontre">
		<xsl:param name="id"/>
		<xsl:if test="./receveur = $id">
			<rencontre>
				<xsl:apply-templates select="//club">
					<xsl:with-param name="var" select="./invite"/>
				</xsl:apply-templates>
				<score><xsl:value-of select="./score"/></score>
			</rencontre>
		</xsl:if>
		<xsl:if test="./invite &lt;= $id">
			<rencontre>
				<xsl:apply-templates select="//club">
					<xsl:with-param name="var" select="./receveur"/>
				</xsl:apply-templates>
				<score><xsl:value-of select="./score"/></score>
			</rencontre>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>
