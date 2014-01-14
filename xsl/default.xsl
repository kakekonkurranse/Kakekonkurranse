<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fl="http://kakekonkurranse.finstadlille.no"
    exclude-result-prefixes="fl">
<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:key name="equipment" match="/fl:cake/fl:modules/fl:module/fl:equipments/fl:equipment/@text" use="." />

<xsl:template match="/fl:cake">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
    <html>
        <head>
            <title><xsl:value-of select="fl:title" /></title>
            <meta charset="utf-8" />
        </head>
    <body>
        <h1><xsl:value-of select="fl:title" /></h1>
        <p><xsl:value-of select="fl:description" /></p>
        <p>Complexity: <xsl:value-of select="fl:complexity/@level" /></p>
        <p>Time: <xsl:value-of select="fl:time/@amount" /><xsl:value-of select="fl:time/@unitShort" /></p>

        <xsl:for-each select="fl:ingredient_warnings/fl:warning">
            <p>Warning: <xsl:value-of select="." /></p>
        </xsl:for-each>

        <p>Number of modules: <xsl:value-of select="count(fl:modules/fl:module)" /></p>

        <h3>All ingredients</h3>
        <ul>
        <xsl:for-each select="fl:modules/fl:module/fl:ingredients/fl:ingredient">
            <li><xsl:value-of select="./@amount" /><xsl:value-of select="./@unitShort" />&#160;<xsl:value-of select="./@text" /></li>
        </xsl:for-each>
        </ul>
        
        <h3>All equipment</h3>
        <ul>
            <xsl:for-each select="fl:modules/fl:module/fl:equipments/fl:equipment/@text[generate-id() = generate-id(key('equipment',.)[1])]">
                <li><xsl:value-of select="." /></li>
            </xsl:for-each>
        </ul>

        <xsl:for-each select="fl:modules/fl:module">
            <h2>Module: <xsl:value-of select="./@text" /> (<xsl:value-of select="fl:time/@amount" /><xsl:value-of select="fl:time/@unitShort" />)</h2>
            <h3>Ingredients</h3>
            <ul>
            <xsl:for-each select="fl:ingredients/fl:ingredient">
                <li><xsl:value-of select="./@amount" /><xsl:value-of select="./@unitShort" />&#160;<xsl:value-of select="./@text" /></li>
            </xsl:for-each>
            </ul>

            <h3>Equipment</h3>
            <ul>
                <xsl:for-each select="fl:equipments/fl:equipment">
                    <li><xsl:value-of select="./@amount" />&#160;<xsl:value-of select="./@text" /></li>
                </xsl:for-each>
            </ul>
            
            <h3>Procedure</h3>
            <xsl:for-each select="fl:description/fl:step">
                <p><xsl:value-of select="./@number"/>.&#160;<xsl:value-of select="." /></p>
            </xsl:for-each>

        </xsl:for-each>
        <h2>Assembly: (<xsl:value-of select="fl:modules/fl:assembly/fl:time/@amount" /><xsl:value-of select="fl:modules/fl:assembly/fl:time/@unitShort" />)</h2>
        <xsl:for-each select="fl:modules/fl:assembly/fl:step">
            <p><xsl:value-of select="./@number" />.&#160;<xsl:value-of select="." /></p>
        </xsl:for-each>
    </body>
    </html>
</xsl:template>

 </xsl:stylesheet>
