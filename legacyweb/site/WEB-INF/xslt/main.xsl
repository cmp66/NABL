<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    
	<xsl:import  href="common.xsl" />
	<xsl:import  href="standings.xsl" />
        <xsl:import  href="LatestSeries.xsl" />
        <xsl:import  href="LastestTrades.xsl" />
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
            <xsl:apply-templates select="MainPage"/>
    </xsl:template>
    
    <xsl:template match="MainPage">        
		<td valign="top">                
			<table width="100%" border="0" cellspacing="0" cellpadding="0">                    
                <tr>                        
                    <td colspan="2" height="15"></td>                 
                </tr>                    
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                            <td align="center">
				<!--
                                <a href="Controller?page=draft&amp;year=2010&amp;mode=draftscout"> Draft Scout Page</a>
                                <p></p>-->
                                <a href="Controller?page=draft&amp;year=2019&amp;mode=list"> Draft List Page</a>
                                <p></p>
				<!--
                                <a href="Controller?page=draft&amp;year=2013&amp;mode=status"> Draft Status Page</a>
				-->
                            </td>
                            </tr>
                            <tr><!-- Double Spacer -->
                                <td colspan="2" height="10"></td>
                            </tr>
                            <tr>
                                <td class="FeatureText" colspan='2' align='center'> </td>
                            </tr>
                            <tr><!-- Double Spacer -->
                                <td colspan="2" height="15"></td>
                            </tr>
                        </table>
                    </td>
                </tr>                              
                <tr>                        
                    <xsl:apply-templates select="transactions" />
                </tr>                    
                <tr><!-- Double Spacer -->
                   <td colspan="2" height="15"></td>
                </tr>     
                <tr><!-- Double Spacer -->
                    <td bgcolor="0000033" class="tableHeaderText" colspan="2">Latest Series Results</td>
                </tr>     
                <tr>                        
                    <xsl:apply-templates select="LatestSeries" />
                </tr>                 
            </table>           
        </td>
        <td valign="top" width="300">
            <table>
                <tr>         
		            <xsl:apply-templates select="standings"/>
		        </tr>
		        <tr><!-- Double Spacer -->
                   <td colspan="2" height="30"></td>
                </tr>   
                <tr><!-- Double Spacer -->
                   <td align="center"><a href="http://www.apbastadium.com"><img border="0" src="images/APBAlogo.gif"/></a></td>
                </tr>
		        <tr><!-- Double Spacer -->
                   <td colspan="2" height="30"></td>
                </tr>   
                <tr><!-- Double Spacer -->
                   <td align="center"><a href="http://www.rotowire.com"><img border="0" src="images/rotowire.gif"/></a></td>
                </tr>
                <tr><!-- Double Spacer -->
                   <td colspan="2" height="30"></td>
                </tr>   
                <tr><!-- Double Spacer -->
                   <td align="center"><a href="http://www.baseball-reference.com"><img border="0" src="images/BRbanner.gif"/></a></td>
                </tr>   
		    </table>
		</td>
	</xsl:template>
</xsl:stylesheet>
