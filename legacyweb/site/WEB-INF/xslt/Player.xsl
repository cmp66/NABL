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
        <xsl:apply-templates select="Player"/>
    </xsl:template>
    
    <xsl:template match="Player">
        <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
            	<tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>                        
                    <td bgcolor="#000033" class="tableHeaderText" colspan="2" align="center">
                            <xsl:value-of select="FirstName"/><xsl:text> </xsl:text><xsl:value-of select="LastName"/>
                    </td>                    
                </tr> 
                <xsl:apply-templates select="PlayerStats"/>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr> 
                <tr>
                	<td align="center"><a href="{BBRefLink}">MLB Player Data</a></td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <xsl:apply-templates select="PlayerNews"/>
            </table>
        </td>
    </xsl:template>
    
    <xsl:template match="PlayerStats">    
        <tr>
            <td align="center">
            <table width="800" border="1" cellspacing="0" cellpadding="0">
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="50"></td>
                </tr>
                <xsl:apply-templates select="battingstats"/>
                <xsl:apply-templates select="pitchingstats"/>
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
    
    <xsl:template match="PlayerNews">
    	<tr>
        	<td>
            	<table bgcolor="#FFFFFF" width="100%" border="0" cellspace="0" cellpadding="0">
                	<tr class="Whitetext" bgcolor="#000066">
                                <th width="10%" ALIGN="center"><B>Date</B></th>
                                <th width="45%" ALIGN="center"><B>News</B></th>                    
                                <th width="45%" ALIGN="center"><B>Comment</B></th>
                    </tr>
                    	<xsl:apply-templates select="NewsEntry"/>
                </table>
            </td>    
        </tr>
    </xsl:template>
    
    <xsl:template match="NewsEntry">
        <tr>
            <td align='center'><xsl:value-of select="date"/></td>
            <td align='center'><xsl:value-of select="news"/></td>
            <td align='center'><xsl:value-of select="comment"/></td>
        </tr>
        <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
        </tr> 
    </xsl:template>

    <xsl:template match="battingstats">
    	<tr>
        	<td>
            	<table bgcolor="#FFFFFF" width="800" border="0" cellspace="0" cellpadding="0">
                	<tr class="Whitetext" bgcolor="#000066">
                                <th ALIGN="center"><B>YEAR</B></th>
                                <th ALIGN="center"><B>TEAM</B></th>                    
                                <th ALIGN="center"><B>G</B></th>
                                <th ALIGN="center"><B>AB</B></th>
                                <th ALIGN="center"><B>R</B></th>
                                <th ALIGN="center"><B>Hits</B></th>
                                <th ALIGN="center"><B>RBI</B></th>
                                <th ALIGN="center"><B>D</B></th>
                                <th ALIGN="center"><B>T</B></th>
                                <th ALIGN="center"><B>HR</B></th>
                                <th ALIGN="center"><B>BB</B></th>
                                <th ALIGN="center"><B>SO</B></th>
                                <th ALIGN="center"><B>SB</B></th>
                                <th ALIGN="center"><B>CS</B></th>
                                <th ALIGN="center"><B>E</B></th>
                                <th ALIGN="center"><B>AVG</B></th>
                                <th ALIGN="center"><B>OBP</B></th>
                                <th ALIGN="center"><B>SLUG</B></th>
                    </tr>
                    	<xsl:apply-templates select="batter"/>
                </table>
            </td>    
        </tr>
    </xsl:template>

    <xsl:template match="pitchingstats">
    	<tr>
    		<td>
        		<table bgcolor="#FFFFFF" width="800" border="0" cellspace="0" cellpadding="0">
            		<tr class="Whitetext" colspan="4" bgcolor="#000066">
                                <th ALIGN="center"><B>YEAR</B></th>
                                <th ALIGN="center"><B>TEAM</B></th>
                                <th ALIGN="center"><B>G</B></th>
                                <th ALIGN="center"><B>GS</B></th>
                                <th ALIGN="center"><B>CG</B></th>
                                <th ALIGN="center"><B>SHO</B></th>
                                <th ALIGN="center"><B>W</B></th>
                                <th ALIGN="center"><B>L</B></th>
                                <th ALIGN="center"><B>S</B></th>
                                <th ALIGN="center"><B>IP</B></th>
                                <th ALIGN="center"><B>Hits</B></th>
                                <th ALIGN="center"><B>ER</B></th>
                                <th ALIGN="center"><B>SO</B></th>
                                <th ALIGN="center"><B>BB</B></th>
                                <th ALIGN="center"><B>HR</B></th>
                                <th ALIGN="center"><B>ERA</B></th>
                 	</tr>
                 		<xsl:apply-templates select="pitcher"/>           
             	</table>
         	</td> 
    	</tr>
    </xsl:template>
               
    <xsl:template match="batter">
        <tr>
            <td align='center'><xsl:value-of select="season"/></td>
            <td align='center'><xsl:value-of select="teamname"/></td>
            <td align='center'><xsl:value-of select="games"/></td>
            <td align='center'><xsl:value-of select="bat_ab"/></td>
            <td align='center'><xsl:value-of select="bat_runs"/></td>
            <td align='center'><xsl:value-of select="bat_hits"/></td>
            <td align='center'><xsl:value-of select="bat_rbi"/></td>
            <td align='center'><xsl:value-of select="bat_doubles"/></td>
            <td align='center'><xsl:value-of select="bat_triples"/></td>
            <td align='center'><xsl:value-of select="bat_hr"/></td>
            <td align='center'><xsl:value-of select="bat_walks"/></td>
            <td align='center'><xsl:value-of select="bat_strikeouts"/></td>
            <td align='center'><xsl:value-of select="bat_sb"/></td>
            <td align='center'><xsl:value-of select="bat_cs"/></td>
            <td align='center'><xsl:value-of select="errors"/></td>
            <td align='center'><xsl:value-of select="avg"/></td>
            <td align='center'><xsl:value-of select="obp"/></td>
            <td align='center'><xsl:value-of select="slug"/></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="pitcher">
        <tr>
            <td align='center'><xsl:value-of select="season"/></td>
            <td align='center'><xsl:value-of select="teamname"/></td>
            <td align='center'><xsl:value-of select="pitch_gp"/></td>
            <td align='center'><xsl:value-of select="pitch_gs"/></td>
            <td align='center'><xsl:value-of select="pitch_cg"/></td>
            <td align='center'><xsl:value-of select="pitch_sho"/></td>
            <td align='center'><xsl:value-of select="pitch_wins"/></td>
            <td align='center'><xsl:value-of select="pitch_loss"/></td>
            <td align='center'><xsl:value-of select="pitch_save"/></td>
            <td align='center'><xsl:value-of select="pitch_ip"/></td>
            <td align='center'><xsl:value-of select="pitch_hits"/></td>
            <td align='center'><xsl:value-of select="pitch_er"/></td>
            <td align='center'><xsl:value-of select="pitch_walks"/></td>
            <td align='center'><xsl:value-of select="pitch_strikeouts"/></td>
            <td align='center'><xsl:value-of select="pitch_hr"/></td>
            <td align='center'><xsl:value-of select="era"/></td>
        </tr>
    </xsl:template> 
</xsl:stylesheet>