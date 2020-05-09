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
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <xsl:apply-templates select="Drafts" />
            </table>
        </td>
    </xsl:template>

    <xsl:template match="Drafts">
        <td valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <xsl:apply-templates select="Draft" mode="getDraftGrid" />
            </table>
        </td>
    </xsl:template>
    
    <xsl:template match="Draft" mode="getDraftGrid">
        <form name="DraftPick" action="Controller?page=draft&amp;mode=status&amp;year=2020&amp;admin={@admin}" method="post">
        <tr>
            <td valign="top">                
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>                        
                        <td bgcolor="#FFFFFF" class="tableHeaderText" colspan="2" align="center">
                            <xsl:value-of select="@year"/> Draft </td>                    
                    </tr> 
                    <tr><!-- Double Spacer -->
                        <td colspan="2" height="20"></td>
                    </tr>
                    <tr>
                        <td>
                            <table bgcolor="#FFFFFF" width="800" border="1" cellspace="0" cellpadding="0">
                                <xsl:apply-templates select="Round" mode="getRound" />
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        </form>
        <tr><!-- Double Spacer -->
            <td height="40"></td>
        </tr>        
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
            document.DraftPick.submit();
        }
    </xsl:template>      
    
    <xsl:template match="Round" mode="getRound">
        <tr>
            <table bgcolor="#FFFFFF" border="1" cellspace="0" cellpadding="0">
                <tr>
                    <th width="8" colspan = "2" BGCOLOR="#DADADA" ALIGN="left">Round <xsl:value-of select="@id"/></th>
                </tr>
                <tr>
                    <th width="8" BGCOLOR="#DADADA" ALIGN="center">Team</th>
                    <th width="8" BGCOLOR="#DADADA" ALIGN="center">Player</th>
                </tr>
                <xsl:apply-templates select="DraftPick" mode="getPick" />
            </table>
        </tr>
        <tr><!-- Double Spacer -->
            <td height="40"></td>
        </tr>
    </xsl:template>

    <xsl:template match="DraftPick" mode="getPick">
        <tr>
            <td BGCOLOR="#E3E8EE" align="center">
                <xsl:value-of select="@team"/>
            </td>
                <xsl:choose>
                    <xsl:when  test="@Current" >
                        <td>
                        <xsl:apply-templates select="CardedPlayers" mode="getDropList" />
                        </td>
                    </xsl:when>
                    <xsl:otherwise>
                        <td BGCOLOR="#E3E8EE" align="center">
                        <xsl:value-of select="@Player"/>
                        </td>
                    </xsl:otherwise>
                </xsl:choose>
        </tr>
    </xsl:template>    

    <xsl:template match="CardedPlayers" mode="getDropList">
        <SELECT Class='SELReg' NAME='DraftedPlayer'>
                                <OPTION Value=''></OPTION>
                                <xsl:apply-templates select="Player" mode="getPlayerDrops" />
                            </SELECT> 
         <IMG bgcolor='#000000' SRC='images/btn_save.gif' align='center' onMouseDown='save();'/>       
    </xsl:template>
     
    
    <xsl:template match="Player" mode="getPlayerDrops">
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
