<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">  
    <xsl:import  href="common.xsl" />
    <xsl:import  href="standings.xsl" />  
    <xsl:output method="html"/>    
    <!--
    ********************************************************************
    ** Latest Series table
    *****************************************************************-->       
    <xsl:template match="/">        
        <xsl:call-template name="toppage">
	</xsl:call-template>
    </xsl:template>
    
       <xsl:template name="javascript">
        //load event
        function onLoad()
        {   
        }

        function onUnload()
        {
        }
    </xsl:template>  
    
	    
    <xsl:template name="bodypage">
        <xsl:apply-templates select="Stats"/>
    </xsl:template>
    
    <xsl:template match="Stats">
        <td>
            <table width="800" border="0" cellspacing="0" cellpadding="0">
                <xsl:apply-templates select="TeamStats"/>
            </table>
        </td>
    </xsl:template>
    
    <xsl:template match="TeamStats">    
        <tr>
            <td>
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
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>AVG</B></th>
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>OBP</B></th>
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>SLUG</B></th>
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
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>G</B></th>
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
                                <th BGCOLOR="#DADADA" ALIGN="center" class="FeatureTextBold"><B>ERA</B></th>
                            </tr>
                                <xsl:apply-templates select="pitchingstats"/>
                        </table>
                    </td> 
                 </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>   
            </table>
            </td>     
        </tr> 
        <tr><!-- Double Spacer -->
            <td colspan="2" height="20"></td>
        </tr>     
    </xsl:template> 

    <xsl:template match="battingstats">
        <xsl:apply-templates select="batter"/>
    </xsl:template>

    <xsl:template match="pitchingstats">
        <xsl:apply-templates select="pitcher"/>
    </xsl:template>
               
    <xsl:template match="batter">
        <tr>
            <td align='right'><xsl:value-of select="name"/></td>
            <td align='right'><xsl:value-of select="games"/></td>
            <td align='right'><xsl:value-of select="bat_ab"/></td>
            <td align='right'><xsl:value-of select="bat_runs"/></td>
            <td align='right'><xsl:value-of select="bat_hits"/></td>
            <td align='right'><xsl:value-of select="bat_rbi"/></td>
            <td align='right'><xsl:value-of select="bat_doubles"/></td>
            <td align='right'><xsl:value-of select="bat_triples"/></td>
            <td align='right'><xsl:value-of select="bat_hr"/></td>
            <td align='right'><xsl:value-of select="bat_walks"/></td>
            <td align='right'><xsl:value-of select="bat_strikeouts"/></td>
            <td align='right'><xsl:value-of select="bat_sb"/></td>
            <td align='right'><xsl:value-of select="bat_cs"/></td>
            <td align='right'><xsl:value-of select="errors"/></td>
            <td align='right'><xsl:value-of select="avg"/></td>
            <td align='right'><xsl:value-of select="obp"/></td>
            <td align='right'><xsl:value-of select="slug"/></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="pitcher">
        <tr>
            <td align='right'><xsl:value-of select="name"/></td>
            <td align='right'><xsl:value-of select="pitch_gp"/></td>
            <td align='right'><xsl:value-of select="pitch_gs"/></td>
            <td align='right'><xsl:value-of select="pitch_cg"/></td>
            <td align='right'><xsl:value-of select="pitch_sho"/></td>
            <td align='right'><xsl:value-of select="pitch_wins"/></td>
            <td align='right'><xsl:value-of select="pitch_loss"/></td>
            <td align='right'><xsl:value-of select="pitch_save"/></td>
            <td align='right'><xsl:value-of select="pitch_ip"/></td>
            <td align='right'><xsl:value-of select="pitch_hits"/></td>
            <td align='right'><xsl:value-of select="pitch_er"/></td>
            <td align='right'><xsl:value-of select="pitch_walks"/></td>
            <td align='right'><xsl:value-of select="pitch_strikeouts"/></td>
            <td align='right'><xsl:value-of select="pitch_hr"/></td>
            <td align='right'><xsl:value-of select="era"/></td>
        </tr>
    </xsl:template> 
</xsl:stylesheet>
