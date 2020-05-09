<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    
    <xsl:output method="html"/>    
     <!--
    ********************************************************************
    ** Latest Series table
    *****************************************************************-->    
    <xsl:template match="LastestSeries">        
        <td width='100%'>
            <table  border="0" cellspacing="0" cellpadding="0">
                <xsl:apply-templates select="series"/>
            </table>
        </td>
    </xsl:template>
    
    <xsl:template match="Series">
        <xsl:variable name="hometeamname" select="HomeTeamName" />
        <xsl:variable name="visitteamname" select="VisitTeamName" />
        <xsl:variable name="hometeamid" select="HomeTeamId" />
        <xsl:variable name="visitteamid" select="VisitTeamId" />
        <tr>
            <td>                
                <table width="100%" border="1" cellspacing="0" cellpadding="0">
                    <tr>                        
                        <td bgcolor="#000044" class="WhiteTitletext" colspan="2" align="center">
                            <xsl:value-of select="$visitteamname"/> at <xsl:value-of select="$hometeamname"/>    (Played <xsl:value-of select="DatePlayed"/>)
                        </td>                    
                    </tr> 
                    <tr>
                        <td>
                            <table bgcolor="#FFFFFF" width="100%" border="0" cellspace="0" cellpadding="0">
                                <tr BGCOLOR="#000044" class="Whitetext">
                                    <th ALIGN="center"  width="10%"></th>
                                    <th ALIGN="center"  width="5"><B>Score</B></th>
                                    <th ALIGN="center"  width="10%"><B></B>Pitcher</th>
                                    <th ALIGN="center"  width="10%"><B></B></th>
                                    <th ALIGN="center"  width="5"><B>Score</B></th>
                                    <th ALIGN="center"  width="10%"><B>Pitcher</B></th>
                                    <th ALIGN="center"  width="45%"><B></B></th>
                                </tr>
                                <xsl:apply-templates select="GameResult"/>
                            </table>
                        </td>    
                    </tr> 
                </table>            
            </td>
        </tr>
        <tr><!-- Double Spacer -->
            <td colspan="2" height="20"></td>
        </tr>
    </xsl:template> 
    
    <xsl:template match="GameResult">
        <xsl:variable name="visitpitcherid" select="VisitPitcherId"/>
        <xsl:variable name="homepitcherid" select="HomePitcherId" />
        <tr>
                        <td BGCOLOR="#E3E8EE" ALIGN="center"><xsl:value-of select="VisitTeamName"/></td>
                        <td align='center'><xsl:value-of select="VisitScore" /></td>
                        <td align='center'><xsl:value-of select="VisitPitcherName" /></td>
                        <td align='center' BGCOLOR="#E3E8EE" ALIGN="center"><xsl:value-of select="HomeTeamName"/></td>
                        <td align='center'><xsl:value-of select="HomeScore" /></td>
                        <td align='center'><xsl:value-of select="HomePitcherName" /></td>
                        <td><xsl:value-of select="Comment"/></td>
        </tr>
    </xsl:template>
    <!--
    *****************************************************************
    ** Generate the pitcher droplists
    **************************************************************-->
    <xsl:template match="VisitPitchers" mode="getPitcherDrops">
        <xsl:apply-templates select="player" mode="getPitcherDrops"/>
    </xsl:template>

    <xsl:template match="HomePitchers" mode="getPitcherDrops">
        <xsl:apply-templates select="player" mode="getPitcherDrops"/>
    </xsl:template>
        
    <xsl:template match="player" mode="getPitcherDrops">
        <xsl:choose>
            <xsl:when test="Selected='true'">
                <OPTION VALUE='{id}' SELECTED='true'><xsl:value-of select="displayname"/>
                </OPTION>
            </xsl:when>
            <xsl:otherwise>
                <OPTION VALUE='{id}'><xsl:value-of select="displayname"/>
                </OPTION>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>