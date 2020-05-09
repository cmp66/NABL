<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet version="1.0" 
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
        <xsl:apply-templates select="roster" mode="getPlayerTable"/>
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
    <xsl:template match="roster" mode="getPlayerTable">
        <td valign="top">                
            <table width="700" border="0" cellspacing="0" cellpadding="0">     
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="40"></td>
                </tr>               
                <tr>                        
                    <td bgcolor="#000033" class="tableHeaderText" colspan="2" align="center"><xsl:value-of select="@teamname"/> Roster</td>
                </tr> 
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
     			<tr>
            		<td>
                		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr>
                        		<td bgcolor="#FFFFFF" colspan="3">
                            		<table width="800" border="1" cellspacing="1" cellpadding="2">
		                                <tr>
                                    		<th class="WhiteTitletext" colspan="4" bgcolor="#000066" align="center"><b>Pitchers</b></th>
                                		</tr>
   				                 		<tr>
                                    		<th class="WhiteTitletext" BGCOLOR="#000066" ALIGN="center" width="30%"><B>Name</B></th>
                                    		<th class="WhiteTitletext" BGCOLOR="#000066" ALIGN="center" width="70%"><B>Links</B></th>
                                			<xsl:apply-templates select="pitchers" mode="getPlayerRows" />
                                 		</tr>
                            	</table>
                        		</td>
                    		</tr>
                		</table>
            		</td>
        		</tr>
               <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
     			<tr>
            		<td>
                		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    		<tr>
                        		<td bgcolor="#FFFFFF" colspan="3">
                            		<table width="800" border="1" cellspacing="1" cellpadding="2">
		                                <tr>
                                    		<th class="WhiteTitletext" colspan="4" bgcolor="#000066" align="center"><b>Players</b></th>
                                		</tr>
   				                 		<tr>
                                    		<th class="WhiteTitletext" BGCOLOR="#000066" ALIGN="center" width="30%"><B>Name</B></th>
                                    		<th class="WhiteTitletext" BGCOLOR="#000066" ALIGN="center" width="70%"><B>Links</B></th>
                                			<xsl:apply-templates select="players" mode="getPlayerRows" />
                                 		</tr>
                            	</table>
                        		</td>
                    		</tr>
                		</table>
            		</td>
        		</tr>
        		<xsl:apply-templates select="cuts" mode="getPlayerRows" />
         	</table>
        </td>
    </xsl:template>
    
    <xsl:template match="pitchers" mode="getPlayerRows">
		<xsl:apply-templates select="player" mode="getPlayerRow" />
    </xsl:template>
    
    <xsl:template match="players" mode="getPlayerRows">
		<xsl:apply-templates select="player" mode="getPlayerRow" />
    </xsl:template>
    


    <xsl:template match="player" mode="getPlayerRow">
        <tr>
            <td BGCOLOR='{color}' align='center'><a href="Controller?page=player&amp;id={id}"><xsl:value-of select="displayname"/></a></td>
            <td BGCOLOR='{color}' align='center'></td>
        </tr>
    </xsl:template>
    
    <xsl:template match="cuts" mode="getPlayerRows" >
    	<tr><!-- Double Spacer -->
    		<td colspan="2" height="20"></td>
        </tr>
     	<tr>
        	<td>
           		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                	<tr>
                    	<td bgcolor="#FFFFFF" colspan="3">
                        	<table width="800" border="1" cellspacing="1" cellpadding="2">
		                    	<tr>
                                	<th class="WhiteTitletext" colspan="4" bgcolor="#000066" align="center"><b>Cuts</b></th>
                                </tr>
   				                <tr>
                                	<th class="WhiteTitletext" BGCOLOR="#000066" ALIGN="center" width="30%"><B>Name</B></th>
                                    <th class="WhiteTitletext" BGCOLOR="#000066" ALIGN="center" width="70%"><B>Links</B></th>
                                	<xsl:apply-templates select="player" mode="getPlayerRow" />
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>
    
    
</xsl:stylesheet>