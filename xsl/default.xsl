<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:bid="http://kakekonkurranse.bankid.no">
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:template match="/bid:cake">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
    <html>
    <body>
        <h1><xsl:value-of select="bid:title" /></h1>
        <p><xsl:value-of select="bid:description" /></p>
        <p>Complexity: <xsl:value-of select="bid:complexity/@level" /></p>
        <p>Time: <xsl:value-of select="bid:time/@amount" /><xsl:value-of select="bid:time/@unitShort" /></p>

        <xsl:for-each select="bid:ingredient_warnings/bid:warning">
            <p>Warning: <xsl:value-of select="." /></p>
        </xsl:for-each>

        <p>Number of modules: <xsl:value-of select="count(bid:modules/bid:module)" /></p>

        <h3>All ingredients</h3>
        <ul>
        <xsl:for-each select="bid:modules/bid:module/bid:ingredients/bid:ingredient">
            <li><xsl:value-of select="./@amount" /><xsl:value-of select="./@unitShort" />&#160;<xsl:value-of select="./@text" /></li>
        </xsl:for-each>
        </ul>
        
        <h3>All equipment</h3>
        <ul>
            <xsl:for-each select="bid:modules/bid:module/bid:equipments/bid:equipment">
                <li><xsl:value-of select="./@amount" />&#160;<xsl:value-of select="./@text" /></li>
            </xsl:for-each>
        </ul>

        <xsl:for-each select="bid:modules/bid:module">
            <h2>Module: <xsl:value-of select="./@text" /> (<xsl:value-of select="bid:time/@amount" /><xsl:value-of select="bid:time/@unitShort" />)</h2>
            <h3>Ingredients</h3>
            <ul>
            <xsl:for-each select="bid:ingredients/bid:ingredient">
                <li><xsl:value-of select="./@amount" /><xsl:value-of select="./@unitShort" />&#160;<xsl:value-of select="./@text" /></li>
            </xsl:for-each>
            </ul>

            <h3>Equipment</h3>
            <ul>
                <xsl:for-each select="bid:equipments/bid:equipment">
                    <li><xsl:value-of select="./@amount" />&#160;<xsl:value-of select="./@text" /></li>
                </xsl:for-each>
            </ul>
            
            <h3>Procedure</h3>
            <xsl:for-each select="bid:description/bid:step">
                <p><xsl:value-of select="./@number"/>.&#160;<xsl:value-of select="." /></p>
            </xsl:for-each>

        </xsl:for-each>
        <h2>Assembly: (<xsl:value-of select="bid:modules/bid:assembly/bid:time/@amount" /><xsl:value-of select="bid:modules/bid:assembly/bid:time/@unitShort" />)</h2>
        <xsl:for-each select="bid:modules/bid:assembly/bid:step">
            <p><xsl:value-of select="./@number" />.&#160;<xsl:value-of select="." /></p>
        </xsl:for-each>
    </body>
    </html>
</xsl:template>

 </xsl:stylesheet>
