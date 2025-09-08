<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:my="mein-persoenliocher-namespace"
    xmlns:xd="http://www.pnp-software.com/XSLTdoc"
    version="3.0">
    
    <xsl:template match="/">
        <html>
            <body>
                <table border="1">
                    <tr>
                        <th>Nachname</th>
                        <th>Vorname</th>
                    </tr>
                    <xsl:for-each select=".//tei:person">
                        <xsl:sort order="ascending" select="my:betterSort(.//tei:surname)"/>
                        <tr>
                            <td><xsl:value-of select=".//tei:surname"/></td>
                            <td><xsl:value-of select="my:nameShortener(.//tei:forename)"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xd:doc>Diese Funktion konvertiert einen Namen in Kleinbuchstaben und eliminiert den string "von ", sofern vorhanden.</xd:doc>
    <xsl:function name="my:betterSort">
        <xsl:param name="name" as="element()"/>
        <xsl:choose>
            <xsl:when test="starts-with($name,'von ')"><xsl:value-of select="substring-after($name,'von ')"/></xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$name"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="my:nameShortener">
        <xsl:param name="names" as="element()*"/>
        <xsl:choose>
            <xsl:when test="count($names) gt 1">
                <xsl:value-of select="$names[1]"/>
                <xsl:text> </xsl:text>
                <xsl:for-each select="$names[position() > 1]">
                    <xsl:value-of select="concat(substring(.,1,1),'.')"/>   
                </xsl:for-each>
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$names"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
</xsl:stylesheet>