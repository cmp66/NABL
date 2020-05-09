<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    
    <xsl:import  href="common.xsl" />
    <xsl:import  href="standings.xsl" />
    <xsl:output method="html"/>    
     <!--
    ********************************************************************
    ** Player assign page
    *****************************************************************-->    
    <xsl:template match="/">        
        <xsl:call-template name="toppage">
	</xsl:call-template>
    </xsl:template>
	    
    <xsl:template name="bodypage">
        <form name="SeriesEntry" action="Controller?page=series" method="post">
            <xsl:apply-templates select="Series" mode="getSeriesTable" />
        </form>
    </xsl:template>
    
    <xsl:template match="Series" mode="getSeriesTable">
        <xsl:variable name="hometeamname" select="HomeTeamName" />
        <xsl:variable name="visitteamname" select="VisitTeamName" />
        <xsl:variable name="hometeamid" select="HomeTeamId" />
        <xsl:variable name="visitteamid" select="VisitTeamId" />
        <td valign="top">                
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>                        
                    <td bgcolor="#000033" class="tableHeaderText" colspan="2" align="center">
                        <input type="hidden" name="id" value="{id}"/>
                        <input type="hidden" name="visitid" value="{$visitteamid}"/>
                        <input type="hidden" name="homeid" value="{$hometeamid}"/>
                        <xsl:value-of select="$visitteamname"/> at <xsl:value-of select="$hometeamname"/>   (Played  <xsl:value-of select="DatePlayed"/>)
                    </td>                    
                </tr> 
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td>
                    <table  width="100%" border="0" cellspace="0" cellpadding="0">
                        <xsl:apply-templates select="GameResult" mode="getGameTable"/>
                    </table>
                    </td>    
		</tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td>
                        <IMG  SRC='images/Save.gif' align='center' onMouseDown='save();'/>
                    </td>
                </tr>    
            </table>            
        </td>         
    </xsl:template>
    
    <xsl:template name="javascript">
        //load event
        function onLoad()
        { 
        }

        function onUnload()
        {
        }
        
        function save()
        {
            document.SeriesEntry.submit();
        }
    </xsl:template>    
    
    <xsl:template match="GameResult" mode="getGameTable" >
        <xsl:variable name="visitpitcherid" select="VisitPitcherId"/>
        <xsl:variable name="homepitcherid" select="HomePitcherId" />
        
        <tr><!-- Double Spacer -->
            <td colspan="2" height="30"></td>
        </tr>
        <tr>
            <td>
                <table width="700" border="1" cellspace="0" cellpadding="0">
                    <tr>
                        <th BGCOLOR="#000066" class="WhiteTitletext" ALIGN="center" colspan='6'><B>Game <xsl:value-of select="GameId"/></B></th>
                    </tr>
                    <tr BGCOLOR="#000066" class="WhiteTitletext">
                        <th  ALIGN="center" width="21%"></th>
                        <th  ALIGN="center" width="11%"><B>Score</B></th>
                        <th  ALIGN="center" width="16%"><B></B>Pitcher</th>
                        <th  ALIGN="center" width="21%"><B></B></th>
                        <th  ALIGN="center" width="11%"><B>Score</B></th>
                        <th  ALIGN="center" width="16%"><B>Pitcher</B></th>
                    </tr>
                    <tr>
                        <!--<td BGCOLOR="#FFFFFF" ALIGN="center"><img border="0" src="images/{VisitTeamName}.gif"/></td>-->
                        <td BGCOLOR="#FFFFFF" ALIGN="center"><b><xsl:value-of select="VisitTeamName"/></b></td>
                        <td><input size='7' name='{GameId}-visitscore' value='{VisitScore}'/></td>
                        <td>
                            <SELECT Class='SELReg' NAME='{GameId}-visitpitcher'>
                                <OPTION Value=''></OPTION>
                                <xsl:apply-templates select="VisitPitchers" mode="getPitcherDrops" />
                            </SELECT>
                        </td>
                        <!--<td BGCOLOR="#FFFFFF" ALIGN="center"><img border="0" src="images/{HomeTeamName}.gif"/></td>-->
                        <td BGCOLOR="#FFFFFF" ALIGN="center"><b><xsl:value-of select="HomeTeamName"/></b></td>
                        <td><input size='7' name='{GameId}-homescore' value='{HomeScore}'/></td>
                        <td>
                            <SELECT Class='SELReg' NAME='{GameId}-homepitcher'>
                                <OPTION Value=''></OPTION>
                                <xsl:apply-templates select="HomePitchers" mode="getPitcherDrops" />
                            </SELECT>
                        </td>
                    </tr>
                    <tr>
                        <td colspan='6'><textarea name='{GameId}-comment' rows='3' cols='80'><xsl:value-of select="Comment"/></textarea></td>
                    </tr>
                </table>
            </td>
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
