<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    
    <xsl:import  href="common.xsl" />
    <xsl:import  href="standings.xsl" />
    <xsl:output method="html"/>    
     <!--
    ********************************************************************
    ** Stats entry page
    *****************************************************************-->    
    <xsl:template match="/">        
        <xsl:call-template name="toppage">
	</xsl:call-template>
    </xsl:template>
	    
    <xsl:template name="bodypage">
        <td width="100%" valign="top">
            <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <xsl:apply-templates select="SeriesStats" />
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
            document.StatsEntry.submit();
        }
    </xsl:template> 
    
    <xsl:template match="SeriesStats">
        <xsl:apply-templates select="Errors"/>
        <form name="StatsEntry" action="Controller?page=stats&amp;mode=ProcessSeriesStats&amp;year={Year}&amp;series={Series}&amp;reportingteam={ReportingTeam}&amp;otherteam={OtherTeam}" method="post">
            <table width="800" border="1" cellspacing="0" cellpadding="0">
                <tr>                        
                    <td bgcolor="#FFFFFF" class="FeatureTextBold" colspan="2" align="center">
                            <xsl:value-of select="ReportName"/><xsl:text> - </xsl:text><xsl:value-of select="OtherName"/>
                    </td>                    
                </tr> 
                <xsl:apply-templates select="ReportingTeamStats"/>
                <tr><!-- Double Spacer -->
                    <td colspan="1" height="80"></td>
                </tr>
                <xsl:apply-templates select="OtherTeamStats"/>
                <tr><!-- Double Spacer -->
                    <td colspan="1" height="20"></td>
                 </tr>   
                <tr>
                    <td>
                        <IMG bgcolor='#000000' SRC='images/Save.gif' align='center' onMouseDown='save();'/>
                    </td>
                    <td>
                        <a href="Controller?page=schedule&amp;team={ReportingTeam}"><IMG bgcolor='#000000' SRC='images/Return.gif' align='center'/></a>
                    </td>
                </tr>   
            </table>     
        </form>       
    </xsl:template>
    
    <xsl:template match="ReportingTeamStats">
        <table width="800" border="1" cellspacing="0" cellpadding="0">
            <tr>
                <td bgcolor="#FFFFFF" class="FeatureTextBold" colspan="2" align="center">
                            <xsl:value-of select="team"/>
                </td>
            </tr>
            <tr>
                <td>
                <table bgcolor="#FFFFFF" width="800" border="0" cellspace="0" cellpadding="0">
                    <tr>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>G</B></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>AB</B></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>R</B></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>Hits</B></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>RBI</B></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>D</B></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>T</B></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>HR</B></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>BB</B></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>SO</B></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>SB</B></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>CS</B></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>HBP</B></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>E</B></th>
                    </tr>
                    <xsl:apply-templates select="battingstats" mode="normal"/>
                </table>
                </td>    
            </tr>
            <tr><!-- Double Spacer -->
                <td colspan="2" height="20"></td>
            </tr>
            <tr><!-- Double Spacer -->
                <td colspan="2" height="10"></td>
            </tr> 
            <tr>
                <td>
                    <table bgcolor="#FFFFFF" width="800" border="0" cellspace="0" cellpadding="0">
                        <tr>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>GP</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>GS</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>CG</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>SHO</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>W</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>L</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>S</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>IP</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>Hits</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>Runs</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>ER</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>BB</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>SO</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>HR</B></th>
                        </tr>
                        <xsl:apply-templates select="pitchingstats" mode="normal"/>
                    </table>
                </td> 
             </tr>
         </table>
    </xsl:template>
    
    <xsl:template match="OtherTeamStats">
        <table width="400" border="1" cellspacing="0" cellpadding="0">
            <tr>
                <td bgcolor="#FFFFFF" class="FeatureTextBold" colspan="2" align="center">
                            <xsl:value-of select="team"/>
                </td>
            </tr>
            <tr>
                <td>
                <table bgcolor="#FFFFFF" width="400" border="0" cellspace="0" cellpadding="0">
                    <tr>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"></th>
                        <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>G</B></th>
                    </tr>
                    <xsl:apply-templates select="battingstats" mode="other"/>
                </table>
                </td>    
            </tr>
            <tr><!-- Double Spacer -->
                <td colspan="2" height="20"></td>
            </tr>
            <tr><!-- Double Spacer -->
                <td colspan="2" height="10"></td>
            </tr> 
            <tr>
                <td>
                    <table bgcolor="#FFFFFF" width="400" border="0" cellspace="0" cellpadding="0">
                        <tr>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>GS</B></th>
                            <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>IP</B></th>
                        </tr>
                        <xsl:apply-templates select="pitchingstats" mode="other"/>
                    </table>
                </td> 
             </tr>
         </table>
    </xsl:template>
    
                

    <xsl:template match="battingstats" mode="normal">
        <xsl:apply-templates select="batter" mode="normal"/>
    </xsl:template>

    <xsl:template match="pitchingstats" mode="normal">
        <xsl:apply-templates select="pitcher" mode="normal"/>
    </xsl:template>
    
    <xsl:template match="battingstats" mode="other">
        <xsl:apply-templates select="batter" mode="other"/>
    </xsl:template>

    <xsl:template match="pitchingstats" mode="other">
        <xsl:apply-templates select="pitcher" mode="other"/>
    </xsl:template>
               
    <xsl:template match="batter" mode="normal">
        <tr>
            <td><xsl:value-of select="name"/>
                <input type="hidden" name="{id}-teamid" value="{teamid}"/>
                <input type="hidden" name="{id}-season" value="{season}"/></td>
            <td><input name='{id}-games' value='{games}' size='4'/></td>
            <td><input name='{id}-bat_ab' value='{bat_ab}' size='4'/></td>
            <td><input name='{id}-bat_runs' value='{bat_runs}' size='4'/></td>
            <td><input name='{id}-bat_hits' value='{bat_hits}' size='4'/></td>
            <td><input name='{id}-bat_rbi' value='{bat_rbi}' size='4'/></td>
            <td><input name='{id}-bat_doubles' value='{bat_doubles}' size='4'/></td>
            <td><input name='{id}-bat_triples' value='{bat_triples}' size='4'/></td>
            <td><input name='{id}-bat_hr' value='{bat_hr}' size='4'/></td>
            <td><input name='{id}-bat_walks' value='{bat_walks}' size='4'/></td>
            <td><input name='{id}-bat_strikeouts' value='{bat_strikeouts}' size='4'/></td>
            <td><input name='{id}-bat_sb' value='{bat_sb}' size='4'/></td>
            <td><input name='{id}-bat_cs' value='{bat_cs}' size='4'/></td>
            <td><input name='{id}-bat_hbp' value='{bat_hbp}' size='4'/></td>
            <td><input name='{id}-errors' value='{errors}' size='4'/></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="batter" mode="other">
        <tr>
            <td><xsl:value-of select="name"/>
                <input type="hidden" name="{id}-teamid" value="{teamid}"/>
                <input type="hidden" name="{id}-season" value="{season}"/></td>
            <td><input name='{id}-games' value='{games}' size='4'/></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="pitcher" mode="normal">
        <tr>
            <td><xsl:value-of select="name"/></td>
            <td><input name='{id}-pitch_gp' value='{pitch_gp}' size='3'/></td>
            <td><input name='{id}-pitch_gs' value='{pitch_gs}' size='3'/>
                <input type="hidden" name="{id}-teamid" value="{teamid}"/>
                <input type="hidden" name="{id}-season" value="{season}"/></td>
            <td><input name='{id}-pitch_cg' value='{pitch_cg}' size='3'/></td>
            <td><input name='{id}-pitch_sho' value='{pitch_sho}' size='3'/></td>
            <td><input name='{id}-pitch_wins' value='{pitch_wins}' size='3'/></td>
            <td><input name='{id}-pitch_loss' value='{pitch_loss}' size='3'/></td>
            <td><input name='{id}-pitch_save' value='{pitch_save}' size='3'/></td>
            <td><input name='{id}-pitch_ipfull' value='{pitch_ipfull}' size='2'/><B>.</B><input name='{id}-pitch_ipfract' value='{pitch_ipfract}' size='1'/></td>
            <td><input name='{id}-pitch_hits' value='{pitch_hits}' size='3'/></td>
            <td><input name='{id}-pitch_runs' value='{pitch_runs}' size='3'/></td>
            <td><input name='{id}-pitch_er' value='{pitch_er}' size='3'/></td>
            <td><input name='{id}-pitch_walks' value='{pitch_walks}' size='3'/></td>
            <td><input name='{id}-pitch_strikeouts' value='{pitch_strikeouts}' size='3'/></td>
            <td><input name='{id}-pitch_hr' value='{pitch_hr}' size='3'/></td>
        </tr>
    </xsl:template> 

    <xsl:template match="pitcher" mode="other">
        <tr>
            <td><xsl:value-of select="name"/></td>
            <td><input name='{id}-pitch_gs' value='{pitch_gs}' size='4'/>
                <input type="hidden" name="{id}-teamid" value="{teamid}"/>
                <input type="hidden" name="{id}-season" value="{season}"/></td>
            <td><input name='{id}-pitch_ipfull' value='{pitch_ipfull}' size='4'/><B>.</B><input name='{id}-pitch_ipfract' value='{pitch_ipfract}' size='1'/></td>
        </tr>
    </xsl:template> 
    
    <xsl:template match="Errors">
        <xsl:apply-templates select="Error"/>
    </xsl:template>
    
    <xsl:template match="Error">
        <xsl:value-of select="ErrorString"/><p></p>    
    </xsl:template>
    
</xsl:stylesheet>
