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
        <xsl:apply-templates select="schedule" mode="getSchedule"/>
    </xsl:template>
    
    <xsl:template name="javascript">
        <!-- Original:  ArjoGod, Shauna Merritt -->
        <!-- Modified By:  Ronnie T. Moore, Editor -->

        <!-- This script and many more are available free online at -->
        <!-- The JavaScript Source!! http://javascript.internet.com -->

        extArray = new Array(".xls");
        
        function LimitAttach(form, file) {
            allowSubmit = false;
            if (!file) return;
            
            while (file.indexOf("\\") != -1)
                file = file.slice(file.indexOf("\\") + 1);
            ext = file.slice(file.indexOf(".")).toLowerCase();

            for (var i = 0; i &lt; extArray.length; i++) 
            {
                if (extArray[i] == ext) 
                { 
                    allowSubmit = true; 
                    break; 
                }
            }
            if (allowSubmit) 
                form.submit();
            else
                alert("Please only upload files that end in types:  " 
                      + (extArray.join("  ")) + "\nPlease select a new "
                      + "file to upload and submit again.");
            }
            
        //load event
        function onLoad()
        {   
        }

        function onUnload()
        {
        }
        
        function statsNotice(notice)
        {
        	alert(notice);
        }
        
    </xsl:template>    
    <!--
    *****************************************************************
    ** Generate the team droplist
    **************************************************************-->
    <xsl:template match="schedule" mode="getSchedule">
        <td valign="top">                
            <table width="700" border="0" cellspacing="0" cellpadding="0">        
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="30"></td>
                </tr>            
                <tr>                        
                    <td bgcolor="#000033" class="tableHeaderText" colspan="2" align="center"><xsl:value-of select="@team"/></td>                    
                </tr> 
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td class="BlackTextBold">Upload Excel Series Stat File<p></p>
                    <form method="post" name="upform" action="UploadServlet?path=" enctype="multipart/form-data">
                    
                    <input type="hidden" name="path" value="/usr/share/tomcat7/webapps/NABL/files/import/series"/>
                    <input type="file" name="statsfile"/>
                    <p></p>
                    <input type="button" name="Submit" value="Submit" onclick="LimitAttach(this.form, this.form.statsfile.value)"/>
                    </form> 
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <td BGCOLOR='{color}' align='center'> <a href="{StatFileLink}"><xsl:value-of select="StatFileText"/></a></td> 
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="40"></td>
                </tr>
                <xsl:apply-templates select="homegames" mode="getHomeTable"/>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <xsl:apply-templates select="visitgames" mode="getVisitTable"/>         
            </table>            
        </td>         
    </xsl:template>
    
    <xsl:template match="homegames" mode="getHomeTable">
     	<tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr >
                        <td colspan="3">
                            <table width="800" border="1" cellspacing="1" cellpadding="2">
                                <tr>
                                    <th class="WhiteTitletext" BGCOLOR="#000066" colspan="8"  align="center"><b>Home Series</b></th>
                                </tr>
    				<tr class="WhiteTitletext" BGCOLOR="#000066">
    				                <th  ALIGN="center" width="10%"><B>Month</B></th>
                                    <th  ALIGN="center" width="10%"><B>Opponent</B></th>
                                    <th  ALIGN="center" width="10%"><B>Games</B></th>
                                    <th  ALIGN="center" width="15%"><B>Result</B></th>
                                    <th  ALIGN="center" width="18%"><B>Game Score Form</B></th>
                                    <th  ALIGN="center" width="15%"><B>Web Stat Form</B></th>
                                    <th  ALIGN="center" width="15%"><B>Excel Stat File</B></th>
                                    <th  ALIGN="center" width="7%"><B>Valid</B></th>
    				</tr>
                                <xsl:apply-templates select="series" mode="getHomeSeriesResult" />
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="visitgames" mode="getVisitTable">
        <tr>
            <td bgcolor="#FFFFFF" colspan="3">
                <table width="800" border="1" cellspacing="1" cellpadding="2">
                    <tr>						
                        <th colspan="7" class="WhiteTitletext" BGCOLOR="#000066" align="center">Away Series</th>
                    </tr>
                    <tr class="WhiteTitletext" BGCOLOR="#000066">
         				            <th  ALIGN="center" width="10%"><B>Month</B></th>
                                    <th  ALIGN="center" width="10%"><B>Opponent</B></th>
                                    <th  ALIGN="center" width="10%"><B>Games</B></th>
                                    <th  ALIGN="center" width="15%"><B>Result</B></th>
                                    <th  ALIGN="center" width="15%"><B>Game Score Form</B></th>
                                    <th  ALIGN="center" width="15%"><B>Web Stat Form</B></th>
                                    <th  ALIGN="center" width="15%"><B>Excel Stat File</B></th>
                    </tr>
                    <xsl:apply-templates select="series" mode="getVisitSeriesResult" />
   		</table>
            </td>
 	</tr>
    </xsl:template>
    
    <xsl:template match="series" mode="getHomeSeriesResult">
        <tr>
            <td BGCOLOR="{color}" align="center"><xsl:value-of select="playmonth"/></td>
            <!--<td BGCOLOR='{color}' align='center'><img border="0" src="images/{visitteam}.gif"/></td>--> 
            <td BGCOLOR="{color}" align="center"><b><xsl:value-of select="visitteam"/></b></td> 
            <td BGCOLOR="{color}" align="center"><xsl:value-of select="numgames"/></td> 
            <td BGCOLOR="{color}" align="center"><xsl:value-of select="result"/></td>
            <td BGCOLOR='{color}' align='center'><a href="{otherlink}">Enter Game Results</a></td>
            <td BGCOLOR='{color}' align='center'> <a href="{statslink}">Enter Stats</a></td>
            <td BGCOLOR='{color}' align='center'> <a href="{SeriesStatFileLink}"><xsl:value-of select="SeriesStatFileText"/></a></td>
            <td BGCOLOR='{color}' align='center'> <a href="{SeriesStatDetailLink}"><xsl:value-of select="SeriesStatDetailText"/></a></td>  
            <!-- <td BGCOLOR="{color}" align="center"><input type="button" name="{seriesid}" value="{ValidStats}" onclick="statsNotice('{StatsText}')"/></td> -->
            <!-- <td BGCOLOR="{color}" align="center" onclick="statsNotice({ValidStats})"><xsl:value-of select="ValidStats"/></td> -->
        </tr>
    </xsl:template>

       <xsl:template match="series" mode="getVisitSeriesResult">
        <tr>
            <td BGCOLOR="{color}" align="center"><xsl:value-of select="playmonth"/></td>
            <!--<td BGCOLOR='{color}' align='center'><img border="0" src="images/{hometeam}.gif"/></td>--> 
            <td BGCOLOR="{color}" align="center"><b><xsl:value-of select="hometeam"/></b></td> 
            <td BGCOLOR="{color}" align="center"><xsl:value-of select="numgames"/></td> 
            <td BGCOLOR="{color}" align="center"><xsl:value-of select="result"/></td>
            <td BGCOLOR='{color}' align='center'><a href="{otherlink}">Enter Game Results</a></td>
            <td BGCOLOR='{color}' align='center'> <a href="{statslink}">Enter Stats</a></td> 
            <td BGCOLOR='{color}' align='center'> <a href="{SeriesStatFileLink}"><xsl:value-of select="SeriesStatFileText"/></a></td>   
        </tr>
    </xsl:template>
        
</xsl:stylesheet>
