<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="3.0">
    
    <xsl:template match="/">
        <xsl:for-each select=".//tei:persName">
            <xsl:value-of select="tei:surname"/>, <xsl:value-of select="tei:forename"/>    
        </xsl:for-each>
        
    </xsl:template>
    
</xsl:stylesheet>