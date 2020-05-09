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
        <form name="RotoWireNews" action="Controller?page=rotowire" method="post">
            <xsl:apply-templates select="Rotowire"/>
        </form>
    </xsl:template>
    
    <xsl:template match="Rotowire">
        <td valign="top">                
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>                        
                    <td bgcolor="#000033" class="tableHeaderText" colspan="2" align="center">
                        <xsl:value-of select="LastUpdate"/>
                    </td>                    
                </tr> 
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr> 
                <tr>
                	<td><textarea name='rotowire' rows='40' cols='80'></textarea></td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr> 
                
                <tr>
                    <td>
                        <IMG  SRC='images/Save.gif' align='center' onMouseDown='save();'/>
                    </td>
                </tr>
            </table>            
        </td>         
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
            document.RotoWireNews.submit();
        }
    </xsl:template>    
 
</xsl:stylesheet>