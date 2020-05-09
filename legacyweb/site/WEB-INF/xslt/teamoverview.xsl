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
        <xsl:apply-templates select="leagueteams" mode="getTeamList"/>
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
    <!--
    *****************************************************************
    ** Generate the team droplist
    **************************************************************-->
    <xsl:template match="leagueteams" mode="getTeamList">
        <td valign="top">                
            <table width="700" border="0" cellspacing="0" cellpadding="0">
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="30"></td>
                </tr> 
                <tr><!-- Double Spacer -->
                    <td align="center"><a href="Controller?page=members&amp;season=2019">Member Directory</a></td>
                </tr>  
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="30"></td>
                </tr>                   
                <tr>                        
                    <td bgcolor="#000033" class="tableHeaderText" colspan="2" align="center">Teams</td>
                </tr> 
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <xsl:apply-templates select="division" mode="getDivisionTables"/>
            </table>            
        </td>         
    </xsl:template>
    
    <xsl:template match="division" mode="getDivisionTables">
        <tr><!-- Double Spacer -->
            <td colspan="2" height="20"></td>
        </tr>
     	<tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td bgcolor="#FFFFFF" colspan="3">
                            <table width="800" border="1" cellspacing="1" cellpadding="2">
                                <tr>
                                    <th class="WhiteTitletext" colspan="4" bgcolor="#000066" align="center"><b><xsl:value-of select="@divname"/> Divison</b></th>
                                </tr>
   				                 <tr>
                                    <th  bgcolor="#000066" class="WhiteTitletext"  ALIGN="center" width="30%"><B>Team</B></th>
                                    <th  bgcolor="#000066" class="WhiteTitletext"  ALIGN="center" width="70%"><B>Links</B></th>
                                <xsl:apply-templates select="team" mode="getTeamLinks" />
                                 </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="team" mode="getTeamLinks">
        <tr>
            <td BGCOLOR='FFFFFF' align='center'><b><xsl:value-of select="teamname"/></b></td>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td BGCOLOR='{color}' align='center'> <a href="{rosterlink}">Roster</a></td> 
                        <td BGCOLOR='{color}' align='center'> <a href="{schedulelink}">Schedule</a></td>
                        <td BGCOLOR='{color}' align='center'> <a href="{scoutlink}">Scout</a></td>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>
