<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.pnp-software.com/XSLTdoc"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="3.0">
    
    <xd:doc>dlösgjaöldgjaälfkj</xd:doc>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Mein Ergebnis</title>
            </head>
            <body>
                <ul>
                    <xsl:apply-templates/>
                </ul>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:person">
        <li xmlns="http://www.w3.org/1999/xhtml">    
            <xsl:value-of select=".//tei:surname"/>
        </li>
    </xsl:template>
    
</xsl:stylesheet>