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
        <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                </td>
                    <xsl:apply-templates select="TeamStats" />
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
    
    <xsl:template match="TeamStats">    
        <form name="StatsEntry" action="Controller?page=stats&amp;mode=ProcessStats&amp;team={teamid}" method="post">
            <table width="800" border="1" cellspacing="0" cellpadding="0">
                <tr>                        
                    <td bgcolor="#FFFFFF" class="FeatureTextBold" colspan="2" align="center">
                            <xsl:value-of select="year"/><xsl:text> </xsl:text><xsl:value-of select="team"/>
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
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>E</B></th>
                            </tr>
                                <xsl:apply-templates select="battingstats"/>
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
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>GS</B></th>
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>CG</B></th>
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>SHO</B></th>
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>W</B></th>
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>L</B></th>
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>S</B></th>
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>IP</B></th>
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>Hits</B></th>
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>ER</B></th>
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>BB</B></th>
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>SO</B></th>
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>HR</B></th>
                            </tr>
                                <xsl:apply-templates select="pitchingstats"/>
                        </table>
                    </td> 
                 </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                 </tr>   
                <tr>
                    <td>
                        <IMG bgcolor='#000000' SRC='images/btn_save.gif' align='center' onMouseDown='save();'/>
                    </td>
                </tr>   
            </table>     
        </form>       
    </xsl:template> 

    <xsl:template match="battingstats">
        <xsl:apply-templates select="batter"/>
    </xsl:template>

    <xsl:template match="pitchingstats">
        <xsl:apply-templates select="pitcher"/>
    </xsl:template>
               
    <xsl:template match="batter">
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
            <td><input name='{id}-errors' value='{errors}' size='4'/></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="pitcher">
        <tr>
            <td><xsl:value-of select="name"/></td>
            <td><input name='{id}-pitch_gs' value='{pitch_gs}' size='4'/>
                <input type="hidden" name="{id}-teamid" value="{teamid}"/>
                <input type="hidden" name="{id}-season" value="{season}"/></td>
            <td><input name='{id}-pitch_cg' value='{pitch_cg}' size='4'/></td>
            <td><input name='{id}-pitch_sho' value='{pitch_sho}' size='4'/></td>
            <td><input name='{id}-pitch_wins' value='{pitch_wins}' size='4'/></td>
            <td><input name='{id}-pitch_loss' value='{pitch_loss}' size='4'/></td>
            <td><input name='{id}-pitch_save' value='{pitch_save}' size='4'/></td>
            <td><input name='{id}-pitch_ipfull' value='{pitch_ipfull}' size='4'/><B>.</B><input name='{id}-pitch_ipfract' value='{pitch_ipfract}' size='1'/></td>
            <td><input name='{id}-pitch_hits' value='{pitch_hits}' size='4'/></td>
            <td><input name='{id}-pitch_er' value='{pitch_er}' size='4'/></td>
            <td><input name='{id}-pitch_walks' value='{pitch_walks}' size='4'/></td>
            <td><input name='{id}-pitch_strikeouts' value='{pitch_strikeouts}' size='4'/></td>
            <td><input name='{id}-pitch_hr' value='{pitch_hr}' size='4'/></td>
        </tr>
    </xsl:template> 
</xsl:stylesheet>