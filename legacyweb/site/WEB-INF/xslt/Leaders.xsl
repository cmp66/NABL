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
            <xsl:apply-templates select="LeagueLeaders"/> 
    </xsl:template>
    
    <xsl:template name="javascript">
        <xsl:text>
         
        //load event
        function onLoad()
        { 
        }

        function onUnload()
        {
        }        
        </xsl:text>
    </xsl:template>    
    <!--
    *****************************************************************
    ** Generate the team droplist
    **************************************************************-->
    <xsl:template match="LeagueLeaders">
        <td valign="top">                
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>                        
                    <td bgcolor="#0000^^" class="tableHeaderText" colspan="2" align="center">
                        <xsl:value-of select="season"/><xsl:text> Leaders</xsl:text>
                    </td>                    
                </tr>                     
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="50"></td>
                </tr>
                <tr>
                    <td>
                        <xsl:apply-templates select="BattingAverage"/>
                    </td>
                   <td>
                        <xsl:apply-templates select="OBP"/>
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td>
                        <xsl:apply-templates select="SLUG"/>
                    </td>
                   <td>
                        <xsl:apply-templates select="Runs"/>
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td>
                        <xsl:apply-templates select="RBI"/>
                    </td>
                   <td>
                        <xsl:apply-templates select="Hits"/>
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td>
                        <xsl:apply-templates select="Doubles"/>
                    </td>
                   <td>
                        <xsl:apply-templates select="Triples"/>
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td>
                        <xsl:apply-templates select="HomeRuns"/>
                    </td>
                   <td>
                        <xsl:apply-templates select="Walks"/>
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td>
                        <xsl:apply-templates select="Whiffs"/>
                    </td>
                   <td>
                        <xsl:apply-templates select="StolenBases"/>
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td>
                        <xsl:apply-templates select="Errors"/>
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="40"></td>
                </tr>
                <tr>
                    <td>
                        <xsl:apply-templates select="ERA"/>
                    </td>
                   <td>
                        <xsl:apply-templates select="GamesStarted"/>
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td>
                        <xsl:apply-templates select="CompleteGames"/>
                    </td>
                   <td>
                        <xsl:apply-templates select="Shutouts"/>
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td>
                        <xsl:apply-templates select="Wins"/>
                    </td>
                   <td>
                        <xsl:apply-templates select="Losses"/>
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td>
                        <xsl:apply-templates select="Saves"/>
                    </td>
                   <td>
                        <xsl:apply-templates select="InningsPitched"/>
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td>
                        <xsl:apply-templates select="WalksAllowed"/>
                    </td>
                   <td>
                        <xsl:apply-templates select="Strikeouts"/>
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td>
                        <xsl:apply-templates select="HomeRunsAllowed"/>
                    </td>
                </tr>
            </table>
        </td>
    </xsl:template>
    
    <xsl:template match="BattingAverage">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Average'"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="OBP">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'OBP'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="SLUG">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'SLUG'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="Hits">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Hits'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="RBI">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'RBI'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="Doubles">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Doubles'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="Triples">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Triples'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="HomeRuns">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'HR'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="Walks">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Walks'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="Whiffs">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Strikeouts'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="StolenBases">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'SB'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="Errors">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Errors'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="ERA">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'ERA'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="GamesStarted">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'GS'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="CompleteGames">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'CG'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="Shutouts">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Shutouts'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="Wins">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Wins'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="Losses">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Losses'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="Saves">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Saves'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="InningsPitched">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'IP'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="WalksAllowed">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Walks'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="Strikeouts">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Strikeouts'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="HomeRunsAllowed">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'HR'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="Runs">
        <xsl:call-template name="LeaderTable">
            <xsl:with-param name="Type" select="'Runs'"/>
        </xsl:call-template>
    </xsl:template>
    
     
    <xsl:template name="LeaderTable">
        <xsl:param name="Type"/>
        <table width="100%" border="1" cellspacing="0" cellpadding="0">
            <tr>
                <th BGCOLOR="#000066" colspan="2" ALIGN="center" class="WhiteTitletext"><xsl:value-of select="$Type"/></th>
            </tr>
            <xsl:apply-templates select="Player" />
        </table>
    </xsl:template>
    
    <xsl:template match="Player">
        <tr>
            <td bgcolor="#FFFFFF" class="FeatureText" width="70%"><xsl:value-of select="displayname"/></td>
            <td bgcolor="#FFFFFF" class="FeatureText" width="30%"><xsl:value-of select="value"/></td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>