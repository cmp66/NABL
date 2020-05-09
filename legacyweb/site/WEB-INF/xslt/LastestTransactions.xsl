<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    
    <xsl:output method="html"/>    
     <!--
    ********************************************************************
    ** Latest Series table
    *****************************************************************-->    
    <xsl:template match="transactions">        
        <td width='100%'>
            <table  border="0" cellspacing="0" cellpadding="0">
                <xsl:apply-templates select="transaction"/>
            </table>
        </td>
    </xsl:template>

   <xsl:template match="transaction">
        <tr>
            <td><xsl:value-of select="trantext" /></td>
        </tr>
        <tr><!-- Double Spacer -->
            <td colspan="2" height="20"></td>
        </tr>
    </xsl:template>     
    
</xsl:stylesheet>