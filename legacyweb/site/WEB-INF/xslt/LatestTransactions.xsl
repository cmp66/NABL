<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    
    <xsl:output method="html"/>    
     <!--
    ********************************************************************
    ** Latest Series table
    *****************************************************************-->    
    <xsl:template match="transactions">        
        <td align="center" width='100%'>
            <table  width="350" border="1" cellspacing="0" cellpadding="0">
                <tr><!-- Double Spacer -->
                    <td bgcolor="0000033" class="tableHeaderText" colspan="2">Latest Trades</td>
                </tr>
                <xsl:apply-templates select="transaction"/>
            </table>
        </td>
    </xsl:template>

   <xsl:template match="transaction">
        <tr><!-- Double Spacer -->
            <td bgcolor="0000033" class="WhiteTitletext" colspan="2"><xsl:value-of select="@type"/></td>
        </tr>
        <tr>
            <xsl:apply-templates select="Team"/>
        </tr>
        <tr><!-- Double Spacer -->
            <td bgcolor="0000033" colspan="2" height="20"></td>
        </tr>
    </xsl:template> 
    
    <xsl:template match="Team">
        <td width="50%" valign="top" bgcolor="#FFFFFF">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td align="center" bgcolor="#FFFFFF"><xsl:value-of select="@name"/></td>
                </tr>
                    <xsl:apply-templates select="Item"/>
            </table>
        </td>
    </xsl:template>
    
    <xsl:template match="Item">
        <tr>
        <td align="center" bgcolor="#FFFFFF">
            <xsl:value-of select="@name"/>
        </td>
        </tr>
    </xsl:template>
    
    
</xsl:stylesheet>