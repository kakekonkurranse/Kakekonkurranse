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
            <link rel="stylesheet" type="text/css" href="../css/default.css" />
        </head>
    <body>
        <div id="content">
        <!--header-->
            <!--div-->
            <div class="picture">
                <img alt="Picture">
                    <xsl:attribute name="src">
                        <xsl:value-of select="fl:image"/>
                    </xsl:attribute>
                </img>
            </div>
            <div class="heading">
                <h1><xsl:value-of select="fl:title" /></h1>
                <p class="description"><xsl:value-of select="fl:description" /></p>
            <!--/div-->
            <div class="summary">
                <ul class="inline">
                    <li><h3>Complexity</h3><xsl:call-template name="addHat" /></li>
                    <li><h3>Time</h3><xsl:value-of select="fl:time/@amount" /><xsl:value-of select="fl:time/@unitShort" /></li>
                </ul>
            </div>
            </div>
        <!--/header-->
        <!--section-->
            <div class="column_left">
                <div>
                    <h3>Complexity</h3>
                    <ul class="inline">
                        <li><xsl:call-template name="addHat" /></li>
                    </ul>
                </div>
                <div>
                    <h3>Time</h3>
                    <ul class="inline">
                        <li><xsl:value-of select="fl:time/@amount" /><xsl:value-of select="fl:time/@unitShort" /></li>
                    </ul>
                    <canvas id="time">
                    </canvas>
                </div>
                <div>
                <h3>Shopping list</h3>
                <ul>
                    <xsl:for-each select="fl:modules/fl:module/fl:ingredients/fl:ingredient">
                        <li><xsl:value-of select="./@amount" /><xsl:value-of select="./@unitShort" />&#160;<xsl:value-of select="./@text" /></li>
                    </xsl:for-each>
                </ul>
            </div>
            <div>
                <h3>All equipment</h3>
                <ul>
                    <xsl:for-each select="fl:modules/fl:module/fl:equipments/fl:equipment/@text[generate-id() = generate-id(key('equipment',.)[1])]">
                        <li><xsl:value-of select="." /></li>
                    </xsl:for-each>
                </ul>
            </div>
            <div class="column">
                <h3>Warnings:</h3>
                <ul>
                <xsl:for-each select="fl:ingredient_warnings/fl:warning">
                    <li><xsl:value-of select="." /></li>
                </xsl:for-each>
                </ul>
            </div>
            </div>
        <xsl:for-each select="fl:modules/fl:module">
            <div class="module">
                <h2>Module: <xsl:value-of select="./@text" /> (<xsl:value-of select="fl:time/@amount" /><xsl:value-of select="fl:time/@unitShort" />)</h2>
                <div class="ingredients">
                <h3>Ingredients</h3>
                <ul class="ingredients">
                <xsl:for-each select="fl:ingredients/fl:ingredient">
                    <li><xsl:value-of select="./@amount" /><xsl:value-of select="./@unitShort" />&#160;<xsl:value-of select="./@text" /></li>
                </xsl:for-each>
                </ul>
                </div>

                <div class="equipment">
                <h3>Equipment</h3>
                <ul class="equipment">
                    <xsl:for-each select="fl:equipments/fl:equipment">
                        <li><xsl:value-of select="./@text" /></li>
                    </xsl:for-each>
                </ul>
                </div>
                <div class="procedure">
                    <h3>Procedure</h3>
                    <xsl:for-each select="fl:description/fl:step">
                        <p><xsl:value-of select="./@number"/>.&#160;<xsl:value-of select="." /></p>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:for-each>
        <!--/section-->
            <div class="assembly">
                <div class="procedure">
                    <h2>Assembly: (<xsl:value-of select="fl:modules/fl:assembly/fl:time/@amount" /><xsl:value-of select="fl:modules/fl:assembly/fl:time/@unitShort" />)</h2>
                    <xsl:for-each select="fl:modules/fl:assembly/fl:step">
                        <p><xsl:value-of select="./@number" />.&#160;<xsl:value-of select="." /></p>
                    </xsl:for-each>
                </div>
            </div>
        </div>
        <xsl:call-template name="javascript" />
    </body>
    </html>
</xsl:template>

<xsl:template name="addHat">
    <xsl:param name="index" select="fl:complexity/@level" />
    <img class="difficulty" src="../img/hat.gif" alt="hat" />
    <xsl:if test="$index > 1">
        <xsl:call-template name="addHat">
            <xsl:with-param name="index" select="$index -1" />
        </xsl:call-template>
    </xsl:if>
</xsl:template>

<xsl:template name="javascript">
    <script>
        var canvas = document.getElementById('time');
        if (canvas.getContext) {
            var ctx = canvas.getContext('2d'); 
       
            /* Reset canvas */
            canvas.width = canvas.width;
        }
    </script>
</xsl:template>

 </xsl:stylesheet>
