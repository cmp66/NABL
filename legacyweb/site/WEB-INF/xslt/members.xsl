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
            <table width="800" border="0" cellspacing="0" cellpadding="0">
                <tr><!-- Double Spacer -->
                    <td colspan="3" height="30"></td>
                </tr>                    
                <tr>                        
                    <td bgcolor="#000033" class="tableHeaderText" colspan="3" align="center">Members</td>
                </tr> 
                <tr><!-- Double Spacer -->
                    <td colspan="3" height="20"></td>
                </tr>
                <tr>
                    <xsl:apply-templates select="division" mode="getDivisionTables"/>
                </tr>
            </table>            
        </td>         
    </xsl:template>
    
    <xsl:template match="division" mode="getDivisionTables">
        <td width="33%" bgcolor="#FFFFFF" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th class="WhiteTitletext" bgcolor="#000066" align="center"><b><xsl:value-of select="@divname"/> Divison</b></th>
                    </tr>
                        <xsl:apply-templates select="team" mode="getMembers" />
                </table>
        </td>
    </xsl:template>
    
    <xsl:template match="team" mode="getMembers">
        <tr>
            <td height="150">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td BGCOLOR='FFFFFF' align='center'><b><xsl:value-of select="fullteamname"/></b></td>
                    </tr>
                    <xsl:apply-templates select="Owner" mode="getInfo" />
                </table>
            </td>
        </tr>
        <tr><!-- Double Spacer -->
                    <td bgcolor="#FFFFFF" colspan="1" height="20"></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="Owner" mode="getInfo">
        <tr>
            <td bgcolor="#FFFFFF"  align="center"><xsl:value-of select="@name"/></td>
        </tr>
        <tr><!-- Double Spacer -->
                    <td colspan="1" height="5"></td>
        </tr>
        <tr>
            <td bgcolor="#FFFFFF"  align="center"><xsl:value-of select="@streetaddress1"/></td>
        </tr>
        <tr>
            <td bgcolor="#FFFFFF"  align="center"><xsl:value-of select="@streetaddress2"/></td>
        </tr>
        <tr>
            <td bgcolor="#FFFFFF"  align="center"><xsl:value-of select="@city"/><xsl:text> </xsl:text><xsl:value-of select="@state"/>,<xsl:text> </xsl:text><xsl:value-of select="@zipcode"/></td>
        </tr>
        <tr><!-- Double Spacer -->
                    <td colspan="1" height="10"></td>
        </tr>
        <xsl:apply-templates select="Email" mode="getAddresses" />
        <tr><!-- Double Spacer -->
                    <td colspan="1" height="10"></td>
        </tr>
        <xsl:apply-templates select="Phone" mode="getNumbers" />
    </xsl:template>
    
    <xsl:template match="Email" mode="getAddresses">
        <xsl:apply-templates select="Address" mode="getAddress" />
    </xsl:template>
    
    <xsl:template match="Address" mode="getAddress">
        <tr>
            <td bgcolor="#FFFFFF"  align="center"><xsl:value-of select="@address"/></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="Phone" mode="getNumbers">
        <xsl:apply-templates select="PhoneNumber" mode="getNumber" />
    </xsl:template>
    
    <xsl:template match="PhoneNumber" mode="getNumber">
        <tr>
            <td bgcolor="#FFFFFF"  align="center"><xsl:value-of select="@number"/></td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>