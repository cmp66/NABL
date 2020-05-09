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
        <xsl:apply-templates select="roster"/>
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
    <xsl:template match="roster">
        <td valign="top">                
            <table width="100%" border="0" cellspacing="0" cellpadding="0"> 
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="30"></td>
                </tr>                   
                <tr>                        
                    <td bgcolor="#000033" class="tableHeaderText" colspan="2" align="center"> Ratings</td>
                </tr> 
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
     		<tr>
                    <td width="100%">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="50%" align="top">
                                    <table width="100%" border="1" cellspaceing="1" cellpadding="0">
                                        <tr>
                                            <th colspan="3" class="WhiteTitletext" BGCOLOR="#000066" align="center"><b>Starting Pitchers</b></th>
                                        </tr>
                                        <tr class="WhiteTitletext" BGCOLOR="#000066">
                                            <th  ALIGN="center" width="30%"><B>Name</B></th>
                                            <th  ALIGN="center" width="70%"><B>Grade</B></th>
                                            <th ALIGN="center" width="70%"><B>Starts</B></th>
                                        </tr>
                                        <xsl:apply-templates select="startingpitchers"/>
                                    </table>
                                </td>
                                <td width="50%" align="top">
                                    <table width="100%" border="1" cellspaceing="1" cellpadding="0">
                                        <tr>
                                            <th colspan="3" class="WhiteTitletext" BGCOLOR="#000066" align="center"><b>Relief Pitchers</b></th>
                                        </tr>
                                        <tr class="WhiteTitletext" BGCOLOR="#000066">
                                            <th  ALIGN="center"><B>Name</B></th>
                                            <th  ALIGN="center"><B>Grade</B></th>
                                            <th  ALIGN="center"><B>IP</B></th>
                                        </tr>
                                        <xsl:apply-templates select="reliefpitchers"/>
                                    </table>
                                </td>
                            </tr>
                        </table>
                     </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td width="100%" align="top">
                        <table width="100%" border="1" cellspaceing="1" cellpadding="0">
                            <tr>
                                <th colspan="17" class="WhiteTitletext" BGCOLOR="#000066" align="center"><b>Position Players</b></th>
                            </tr>
                            <tr class="WhiteTitletext" BGCOLOR="#000066">
                                <th  ALIGN="center"><B>Name</B></th>
                                <th  ALIGN="center"><B>Primary Position</B></th>
                                <th  ALIGN="center"><B>Defense</B></th>
                                <th  ALIGN="center"><B>Speed</B></th>
                                <th width="40"  ALIGN="center"><B>1's</B></th>
                                <th  ALIGN="center"><B>Power</B></th>
                                <th  ALIGN="center"><B>Walks</B></th>
                                <th width="40"  ALIGN="center"><B>11</B></th>
                                <th width="40"  ALIGN="center"><B>7</B></th>
                                <th width="40"  ALIGN="center"><B>8</B></th>
                                <th width="40"  ALIGN="center"><B>9</B></th>
                                <th width="40"  ALIGN="center"><B>10</B></th>
                                <th width="40"  ALIGN="center"><B>22</B></th>
                                <th width="40"  ALIGN="center"><B>24</B></th>
                                <th width="40"  ALIGN="center"><B>26</B></th>
                                <th width="40"  ALIGN="center"><B>27</B></th>
                                <th width="40"  ALIGN="center"><B>28</B></th>
                            </tr>
                                <xsl:apply-templates select="positionplayers"/>
                        </table>
                    </td>
        	</tr>
            </table>
        </td>
    </xsl:template>
    
    <xsl:template match="reliefpitchers">
        <xsl:apply-templates select="player" mode="reliefpitcher"/>
    </xsl:template>   
    
    <xsl:template match="startingpitchers">
        <xsl:apply-templates select="player" mode="startingpitcher"/>
    </xsl:template> 
    
    <xsl:template match="positionplayers">
        <xsl:apply-templates select="player" mode="positionplayer"/>
    </xsl:template> 
    
    <xsl:template match="player" mode="startingpitcher">
        <tr>
           <td BGCOLOR='{color}' align='center'><a href="Controller?page=player&amp;id={id}"><xsl:value-of select="displayname"/></a></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="startinggrade"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="starts"/></td>
       </tr>
    </xsl:template>
    
    <xsl:template match="player" mode="reliefpitcher">
        <tr>
           <td BGCOLOR='{color}' align='center'><a href="Controller?page=player&amp;id={id}"><xsl:value-of select="displayname"/></a></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="reliefgrade"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="ip"/></td>
       </tr>
    </xsl:template>

    <xsl:template match="player" mode="positionplayer">
        <tr>
           <td BGCOLOR='{color}' align='center'><a href="Controller?page=player&amp;id={id}"><xsl:value-of select="displayname"/></a></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="primary"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="def-ratings"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="speed"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="one"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="power"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="walk"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="eleven"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="seven"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="eight"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="nine"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="ten"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="twentytwo"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="twentyfour"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="twentysix"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="twentyseven"/></td>
           <td BGCOLOR='{color}' align='center'><xsl:value-of select="twentyeight"/></td>
       </tr>
    </xsl:template>
    
</xsl:stylesheet>