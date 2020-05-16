<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    
    <!--
    ********************************************************************
    ** Generate a table containing the standings for inclusion in a page
    *****************************************************************-->
    <xsl:template name="toppage">
    <html>
        <head>
        <title>NABL</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></meta>
        <link rel="stylesheet" href="BT_styles.css" type="text/css"></link>
        <script LANGUAGE="javascript">
        <xsl:call-template name="javascript" />
        </script>
        </head>

        <body bgcolor="#333333" text="#000000" onLoad="onLoad();" onUnload="onUnload();">
        <center>
        <table width="980" border="1">
        <tr>
        <td>
        <table bgcolor="#333333" width="980" border="0">
            <tr>
                <td align="center"><img src="images/NABL.gif"></img></td>
            </tr>
        </table>
        </td>
        </tr>
        <tr>
        <td>
        <table bgcolor="#CCCCCC" width="980" border="0">
            <tr>
                <td><a href="Controller?page=main"><img border="0" src="images/Home.gif"/></a></td>
                <td><a href="Controller?page=teamoverview&amp;season=2020"><img border="0" src="images/Teams.gif"/></a></td>
                <td><a href="Controller?page=history"><img border="0" src="images/History.gif"/></a></td>
                <td><a href="Controller?page=draft&amp;year=2020&amp;mode=grid"><img border="0" src="images/Draft.gif"/></a></td>
                <td><a href="constitution.pdf"><img border="0" src="images/Rules.gif"/></a></td>
                <td><a href="Controller?page=stats&amp;mode=ShowTeamStats&amp;year=2020&amp;teams=53,48,52,47,3,1,30,9,31,15,45,8,10,41,50,16,51,25"><img border="0" src="images/Stats.gif"/></a></td>
                <td><a href="Controller?page=stats&amp;mode=Leaders&amp;year=2020"><img border="0" src="images/Leaders.gif"/></a></td>
            </tr>
        </table>
        </td>
        </tr>
        <tr>
        <td>  
        <table bgcolor="CCCCCC" width="980" border="0">
            <tr> 
            <!--
                <td class="navCell" width="108" valign="top"> 
                    <table border="0" width="108" cellspacing="0" cellpadding="0" bgcolor="#00297B">
                        <tr> 
                            <td bgcolor="#000000" align="center"><a href="Controller?page=main" class="yellowSmallTitles">MAIN</a></td>
                        </tr>
                        <tr> 
                            <td><a href="Controller?page=teamoverview" class="WhiteLinks">Teams</a></td>
                        </tr>
                        <tr>
                            <td><a href="Controller?page=history" class="WhiteLinks">History</a></td>
                        </tr>
                        <tr>
                            <td><a href="Controller?page=draft&amp;year=2007&amp;mode=grid" class="WhiteLinks">Draft Grid</a></td>
                        </tr>
                        <tr>
                            <td><a href="Controller?page=draft&amp;year=2007&amp;mode=list" class="WhiteLinks">2004 Draft List</a></td>
                        </tr>
                        <tr>
                            <td><a href="Controller?page=draft&amp;year=2004&amp;mode=status" class="WhiteLinks">2004 Draft Status</a></td>
                        </tr>
                        <tr>
                            <td><a href="Controller?page=constitution" class="WhiteLinks">Constitution</a></td>
                        </tr>
                        <tr>
                            <td><a href="http://www.wahoosoftware.com:8080/jchatbox/applet/jchatboxclient.html" class="WhiteLinks">Chat Room</a></td>
                        </tr>
                        <tr>
                            <td><a href="Controller?page=stats&amp;mode=ShowTeamStats&amp;year=2005&amp;teams=1,2,3,4,6,7,8,9,10,11,12,13,14,15,16,17,18" class="WhiteLinks">Stats</a></td>
                        </tr>
                        <tr>
                            <td><a href="Controller?page=stats&amp;mode=Leaders&amp;year=2005" class="WhiteLinks">Stat Leaders</a></td>
                        </tr>
                        <tr>
                            <td><a href="http://www.wahoosoftware.com:8080/mvnforum/mvnforum/index" class="WhiteLinks">Message Board</a></td>
                        </tr>
                        <tr>
                            <td><a href="Controller?page=playerassign" class="WhiteLinks">Player Assign</a></td>
                        </tr>
                    </table>
                </td>
            -->
				<xsl:call-template name="bodypage" />
             </tr>
        </table>
        </td>
        </tr>
        </table>
        </center>
        </body>
	</html>
    </xsl:template>
    
</xsl:stylesheet>
