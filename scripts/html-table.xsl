<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="3.0">
    
    <xsl:template match="/">
        <html>
            <body>
                <table border="1">
                    <tr>
                        <th>Nachname</th>
                        <th>Vorname</th>
                    </tr>
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:person">
        <tr>
            <td><xsl:value-of select=".//tei:surname"/></td>
            <td><xsl:value-of select=".//tei:forename"/></td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>