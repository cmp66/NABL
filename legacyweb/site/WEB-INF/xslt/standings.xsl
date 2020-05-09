<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <!--
    ********************************************************************
    ** Generate a table containing the standings for inclusion in a page
    *****************************************************************-->
    <xsl:template match="standings">
        <td width="280" valign='top'> 
            <table border="0" width="100%" cellpadding="0" cellspacing="0" valign='top'>
                <tr BGCOLOR="#000000" valign='top'> 
                    <td valign='top'> 
                        <table width="100%" border="0" cellpadding="1" cellspacing="1">
    <xsl:apply-templates select="division" mode="generateDivisionStandings"/>
						</table>
                    </td>
                 </tr>
             </table>
         </td>
    </xsl:template>

    <xsl:template name="javascript">
        function onLoad()
        {  
        }

        function onUnload()
        {  
        }
        
        function onBeforeUnoad()
        {
        }
    </xsl:template>    
    
    <!--
    *****************************************************************
    ** Generate a private field declaration.
    **************************************************************-->
    <xsl:template match="division" mode="generateDivisionStandings">
        <tr bgcolor="#000066"> 
            <td> </td>
            <td colspan="4" align="center" class="WhitetextBold"> Overall</td>
            <td> </td>
            <td colspan="2" align="center" class="WhitetextBold"> Division</td>
        </tr>
        <tr bgcolor="#000066"> 
            <td width="40%" align="center" class="WhitetextBold"><xsl:value-of select="@divname"/></td>
            <td align="center" class="WhitetextBold">W</td>
            <td align="center" class="WhitetextBold">L</td>
            <td align="center" class="WhitetextBold">Pct.</td>
            <td align="center" class="WhitetextBold">GB</td>
            <td class="WhitetextBold"> </td>
            <td align="center" class="WhitetextBold">W</td>
            <td align="center" class="WhitetextBold">L</td>
         </tr>
         <xsl:apply-templates select="teamentry" mode="generateTeamRow"/>
         <tr> 
            <td bgcolor="#FFFFFF" colspan="8"> </td>
         </tr>
    </xsl:template>
    
    <!--
    *****************************************************************
    ** Generate a "getter" method for a property.
    **************************************************************-->
    <xsl:template match="teamentry" mode="generateTeamRow">
        <tr bgcolor="#FFFFFF">
            <td align="center"> <a href="{@link}" class="BlueLinks"><!--<img border="0" src="images/{teamname}.gif"/>--><b><xsl:value-of select="teamname"/></b></a></td>
                <td class="BlackText"><xsl:value-of select="wins"/></td>
                <td class="BlackText"><xsl:value-of select="losses"/></td>
                <td class="BlackText" align="right"><xsl:value-of select="pct"/></td>
                <td class="BlackText"> <xsl:value-of select="gb"/></td>
                <td class="BlackText"> </td>
                <td class="BlackText"><xsl:value-of select="divwin"/></td>
                <td class="BlackText" align="right"><xsl:value-of select="divloss"/></td>
              </tr>
    </xsl:template>
</xsl:stylesheet>
