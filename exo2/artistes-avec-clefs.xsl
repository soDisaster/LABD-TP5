<?xml version="1.0" encoding="UTF-8" ?>

<!-- New document created with EditiX at Thu Feb 26 01:29:36 CET 2015 -->


<xsl:stylesheet version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://labd/art"
	xpath-default-namespace="http://labd/art">
	
	<xsl:output method="xml" indent="yes"/>
	
	<xsl:template match="/">

<art xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
   <artistes>
		<xsl:apply-templates select="//artiste"/>
		
  </artistes>
  	<xsl:copy-of select ="//mouvements"/>
</art>
	</xsl:template>

	<xsl:template match="artiste">

  	 <artiste>
   	
	 <xsl:attribute name="num">
   	 <xsl:value-of select="position()" />
  	</xsl:attribute>
		<xsl:copy-of select ="./nom"/>
		<xsl:copy-of select ="./prénom"/>
		<xsl:copy-of select ="./naissance"/>
		<xsl:copy-of select ="./décès"/>
		<xsl:copy-of select ="./période"/>
		<xsl:copy-of select ="./début"/>
		<xsl:copy-of select ="./fin"/>

	  </artiste>
	</xsl:template>

</xsl:stylesheet>


