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
        <td valign="top">
            <table width="450" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td bgcolor="#FFFFFF" class="tableHeaderText" colspan="2" align="center">Draft List</td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <xsl:apply-templates select="CardedPlayers"/>
            </table>
        </td>
    </xsl:template>
    
    <xsl:template match="CardedPlayers">
        <xsl:for-each select="Team">
            <xsl:if test="position() mod 3 = 1">
                <xsl:text disable-output-escaping="yes">&lt;tr&gt;</xsl:text>
            </xsl:if>
                <td valign="top">
                    <table width="200" border="1" cellspacing="0" cellpadding="0">
                        <tr>
                            <th BGCOLOR="#DADADA" ALIGN="center"><xsl:value-of select="Name"/></th>
                        </tr>
                        <xsl:apply-templates select="Player"/>
                    </table>
                </td>
            <xsl:if test="position() mod 3 = 0">
                <xsl:text disable-output-escaping="yes">&lt;/tr&gt;</xsl:text>
            </xsl:if>                
        </xsl:for-each>               
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
    
   <xsl:template match="Player">
        <tr>
            <td BGCOLOR='{color}' align='center'><a href="Controller?page=player&amp;id={id}"><xsl:value-of select="displayname"/></a></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>