<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    
	<xsl:import  href="common.xsl" />
	<xsl:import  href="standings.xsl" />
	<xsl:output method="html"/>    
	<!--
    ********************************************************************
    ** Main page for the web site
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
		<td valign="top">                
			<table width = "100%" border="0" cellspacing="0" cellpadding="0">                    
				<tr>                        
					<td bgcolor="#FFFFFF" class="tableHeaderText" align="center">History</td>                    
				</tr>                                  
             
			</table>           
                </td>         
	</xsl:template>
</xsl:stylesheet>