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
        <tr>
            <td valign="top">                
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>                        
                        <td bgcolor="#000066" class="tableHeaderText" colspan="2" align="center">
                            <xsl:value-of select="@year"/> Draft </td>                    
                    </tr> 
                    <tr><!-- Double Spacer -->
                        <td colspan="2" height="20"></td>
                    </tr>
                    <tr>
                        <td>
                            <table bgcolor="#FFFFFF" width="800" border="1" cellspace="0" cellpadding="0">
                                <tr>
                                    <th width="8" BGCOLOR="#DADADA" ALIGN="center">Team</th>
                                    <xsl:apply-templates select="Rounds" mode="getColumnHeadings"/>
                                </tr>
                                <xsl:apply-templates select="OwnerTeam" mode="getRow" />
                            </table>
                        </td>    
                    </tr>
                </table>
            </td>
        </tr>
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
            document.SeriesEntry.submit();
        }
    </xsl:template>    
    
    <xsl:template match="Rounds" mode="getColumnHeadings" >
        <xsl:apply-templates select="Round" mode="getNum" />
    </xsl:template>

    <xsl:template match="Round" mode="getNum" >
        <th BGCOLOR="#DADADA" ALIGN="center"><xsl:value-of select="@id"/></th>
    </xsl:template>    
    
    <xsl:template match="OwnerTeam" mode="getRow">
        <tr>
             <!--<td BGCOLOR="#FFFFFF" align="center"><img border="0" src="images/{@name}.gif"/></td>-->
             <td BGCOLOR="#FFFFFF" align="center"><b><xsl:value-of select="@name"/></b></td>
            <xsl:apply-templates select="DraftPick" mode="getOwner" />
        </tr>
    </xsl:template>

    <xsl:template match="DraftPick" mode="getOwner">
        <td BGCOLOR="#E3E8EE" align="center">
            <xsl:value-of select="@team"/>
        </td>
    </xsl:template>    
    
</xsl:stylesheet>
