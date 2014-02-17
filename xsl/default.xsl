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
    <script type="text/javascript" src="../javascript/piechartLib.js"></script> 
</head>
<body>
    <div id="wrapper">
        <div class="container">
            <div class="row">
                <div id="sidebar" class="span4">
                    <div id="picture" class="widget personal-image">
                        <div class="standard-pi-pic">
                            <img alt="Picture">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="fl:image"/>
                                </xsl:attribute>
                            </img>
                        </div>
                    </div>
                    <div class="widget">
                        <div>
                            <div class="left_info_box">
                                <div style="float: left; width: 100%">
                                    <h3 class="left">Baker info</h3>
                                </div>
                                <div style="width: 100px; height: 100px; background-color: #000; float: left; clear: left"></div>
                                <div style="float: left; margin-left: 2em">
                                    <p>John</p>
                                    <p>Johnson</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget">
                        <div>
                            <div class="left_info_box">
                                <h3 class="left">Shopping list</h3>
                                <xsl:for-each select="fl:modules/fl:module">
                                    <h4><xsl:value-of select="@text" /></h4>
                                    <ul class="ingredients">
                                        <xsl:for-each select="fl:ingredients/fl:ingredient">
                                                <li><xsl:value-of select="./@amount" />&#160;<xsl:value-of select="./@unitShort" />&#160;<xsl:value-of select="./@text" /></li>
                                        </xsl:for-each>
                                    </ul>
                                </xsl:for-each>
                            </div>
                        </div>
                    </div>
                    <div class="widget">
                        <div>
                            <div class="left_info_box">
                                <h3 class="left">All equipment</h3>
                                <ul>
                                    <xsl:for-each select="fl:modules/fl:module/fl:equipments/fl:equipment/@text[generate-id() = generate-id(key('equipment',.)[1])]">
                                        <li><xsl:value-of select="." /></li>
                                    </xsl:for-each>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="widget">
                        <div>
                            <div class="left_info_box">
                                <h3 class="left">Warnings</h3>
                                <ul>
                                    <xsl:for-each select="fl:ingredient_warnings/fl:warning">
                                        <li><xsl:value-of select="." /></li>
                                    </xsl:for-each>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="main" class="span8 clearfix" role="main">
                    <div class="post clearfix">
                        <div class="post-header clearfix">
                            <div class="clearfix">
                                <h2 class="entry-title"><xsl:value-of select="fl:title" /></h2>
                                <div class="post-header-meta">
                                    <span><xsl:value-of select="fl:description" /></span>
                                </div>
                                <div class="post-header-meta">
                                    <ul class="inline">
                                        <li class="complexity"><h3>Complexity</h3></li><li><xsl:call-template name="addHat" /></li>
                                    </ul>
                                    <ul class="inline">
                                        <li class="total_time"><h3>Total time</h3></li>
                                        <li>
                                            <h3><xsl:value-of select="fl:time/@amount" />&#160;<xsl:value-of select="fl:time/@unitShort" /></h3>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:for-each select="fl:modules/fl:module">
                    <div class="post clearfix">
                        
                            <div class="entry-content clearfix">
                                <div>
                                    <div class="pf-content">
                                        <h2><xsl:value-of select="./@text" /> <!--(<xsl:value-of select="fl:time/@amount" />&#160;<xsl:value-of select="fl:time/@unitShort" />)--></h2>
                                            <div class="ingredients">
                                            <h3>Ingredients</h3>
                                            <ul class="ingredients">
                                            <xsl:for-each select="fl:ingredients/fl:ingredient">
                                                <li><xsl:value-of select="./@amount" />&#160;<xsl:value-of select="./@unitShort" />&#160;<xsl:value-of select="./@text" /></li>
                                            </xsl:for-each>
                                            </ul>
                                            </div>

                                            <div>
                                            <h3>Equipment</h3>
                                            <ul>
                                                <xsl:for-each select="fl:equipments/fl:equipment">
                                                    <li><xsl:value-of select="./@text" /></li>
                                                </xsl:for-each>
                                            </ul>
                                            </div>
                                            <div>
                                                <h3>Procedure</h3>
                                                <ul class="procedure">
                                                <xsl:for-each select="fl:description/fl:step">
                                                    <li><xsl:value-of select="./@number"/>.&#160;<xsl:value-of select="." /></li>
                                                </xsl:for-each>
                                                </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                    </xsl:for-each>
                    <xsl:for-each select="fl:modules/fl:assembly">
                        <div class="post clearfix">
                            <div class="entry-content clearfix">
                                <div>
                                    <div class="pf-content">
                                        <h2>Assembly <xsl:value-of select="@text" /> <!--(<xsl:value-of select="fl:time/@amount" />&#160;<xsl:value-of select="fl:time/@unitShort" />)--></h2>
                                        <div>
                                            <xsl:for-each select="fl:equipments">
                                                <h3>Equipment</h3>
                                                <ul>
                                                    <xsl:for-each select="fl:equipment">
                                                        <li><xsl:value-of select="@text" /></li>
                                                    </xsl:for-each>
                                                </ul>
                                            </xsl:for-each>
                                        </div>
                                        <h3>Procedure</h3>
                                        <ul class="procedure">
                                            <xsl:for-each select="fl:step">
                                                <li><xsl:value-of select="./@number" />.&#160;<xsl:value-of select="." /></li>
                                            </xsl:for-each>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
</xsl:template>

<xsl:template name="addHat">
    <xsl:param name="index" select="fl:complexity/@level" />
    <img class="complexity" src="../img/hat.gif" alt="hat" />
    <xsl:if test="$index > 1">
        <xsl:call-template name="addHat">
            <xsl:with-param name="index" select="$index -1" />
        </xsl:call-template>
    </xsl:if>
</xsl:template>

<xsl:template name="addClock">
    <xsl:param name="time" select="floor(fl:time/@amount div 60)" />
    <xsl:choose>
        <xsl:when test="$time &gt; 0">
            <!--span>
                <canvas width="35px" height="35px">
                    <xsl:attribute name="id">
                        <xsl:value-of select="$time"/>
                    </xsl:attribute>
                </canvas>
            </span-->
            <!--img src="../img/hourglass_small.png" alt="hourglass" style="height: 2em; margin-right: 1em" /-->
            <!--<script>drawPiechart(15, <xsl:value-of select="$time" />, <xsl:value-of select="$time" />);</script>-->
            <xsl:call-template name="addClock">
                <xsl:with-param name="time" select="$time -1" />
            </xsl:call-template>
        </xsl:when>
    </xsl:choose>
</xsl:template>
 </xsl:stylesheet>
