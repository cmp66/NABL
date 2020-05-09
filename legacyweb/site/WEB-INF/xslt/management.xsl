<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">    
    <xsl:import  href="common.xsl" />
    <xsl:import  href="LatestTransactions.xsl" />
    <xsl:output method="html"/>    
     <!--
    ********************************************************************
    ** Main Management page
    *****************************************************************-->    
    <xsl:template match="/">        
        <xsl:call-template name="toppage">
	</xsl:call-template>
    </xsl:template>
	    
    <xsl:template name="bodypage">
        <xsl:apply-templates select="Selections"/>
    </xsl:template>
    
    <xsl:template match="Selections">
        <form name="Management" action="Controller?page=management" method="post">
        <td valign="top">                
            <table width="700" border="0" cellspacing="0" cellpadding="0">                    
                <tr><!-- Double Spacer -->
                    <td colspan="3" height="20"></td>
                </tr>
                <tr>                        
                    <td bgcolor="#000033" class="tableHeaderText" colspan="3" align="center">League Management</td>                    
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="3" height="50"></td>
                </tr>
                <tr>            
                    <xsl:apply-templates select="Years" mode="generateYearList"/>    
		        </tr> 
                <tr><!-- Double Spacer -->
                    <td colspan="3" height="30"></td>
                </tr>
                <tr>                        
                    <th width="50%" bgcolor="#000066" class="WhiteTitletext"  align="center">Action</th>
                    <th width="25%" bgcolor="#000066" class="WhiteTitletext"  align="center">Team 1</th>   
                    <th width="25%" bgcolor="#000066" class="WhiteTitletext"  align="center">Team 2</th>                       
                </tr>
                <tr>
                    <td align="center" ><IMG bgcolor='#000000' SRC='images/Trade.gif' align='center' onMouseDown='onTrade();'/>
                        <IMG bgcolor='#000000' SRC='images/Assign.gif' align='center' onMouseDown='onAssign();'/>
                        <IMG bgcolor='#000000' SRC='images/Drop.gif' align='center' onMouseDown='onDrop();'/>
                        <IMG bgcolor='#000000' SRC='images/btn_refresh.gif' align='center' onMouseDown='onReset();'/>
                    </td>
                    <xsl:apply-templates select="teams" mode="generateDropList1"/>
                    <xsl:apply-templates select="teams" mode="generateDropList2"/>
                </tr>                  
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="50"></td>
                </tr>   
                <tr>                        
                    <td bgcolor="#000033" class="tableHeaderText" colspan="3" align="center">Latest Transactions</td>                    
                </tr>   
                <tr>
                    <xsl:apply-templates select="transactions" />
                </tr>        
            </table>            
        </td> 
        </form>       
    </xsl:template>
    
    <xsl:template name="javascript">
        //load event
        
        year = "0";
        team = "0";
        
        function onLoad()
        {
        }

        function onUnload()
        {
        }
                
        function onSelectTeam(elementChanged)
        {
            return true;
        }

        function onSelectYear(elementChanged)
        {
            return true;
        }
                
        function onTrade()
        {
            if (document.all)
            {
                document.location = "Controller?page=transaction&amp;mode=ShowForm&amp;team1=" +
                    document.all("teamselect1").value + "&amp;team2=" + document.all("teamselect2").value;
            }
            else
            {
                document.location = "Controller?page=transaction&amp;mode=ShowForm&amp;team1=" +
                document.Management.teamselect1.value + "&amp;team2=" + document.Management.teamselect2.value;
            }
        }
        
        function onAssign()
        { 
            document.location = "Controller?page=transaction&amp;mode=AddPlayers&amp;team1=" +
                    document.all("teamselect1").value;
        }
        
        function onDrop()
        {
            if (document.all)
            {
                document.location = "Controller?page=transaction&amp;mode=DropPlayers&amp;team1=" +
                    document.all("teamselect1").value;
            }
            else
            {
                document.location = "Controller?page=transaction&amp;mode=DropPlayers&amp;team1=" +
                document.Management.teamselect1.value;
            }
        }
        
        function onReset()
        {
            if (document.all)
            {
                document.location = "Controller?page=management&amp;mode=Reset";
            }
            else
            {
                document.location = "Controller?page=management&amp;mode=Reset";
            }
        }
    </xsl:template>    
    <!--
    *****************************************************************
    ** Generate the team droplist
    **************************************************************-->
    <xsl:template match="teams" mode="generateDropList1">
        <td align="center">                        
            <SELECT CLASS='SELReg' onChange="onSelectTeam(this);" NAME='teamselect1'> 
                <OPTION Value=''></OPTION>
                    <xsl:apply-templates select="team" mode="getListEntry"/>
            </SELECT>
        </td>              
    </xsl:template>
    
    <xsl:template match="teams" mode="generateDropList2">
        <td align="center" colspan="2">                        
            <SELECT CLASS='SELReg' onChange="onSelectTeam(this);" NAME='teamselect2'> 
                <OPTION Value=''></OPTION>
                    <xsl:apply-templates select="team" mode="getListEntry"/>
            </SELECT>
        </td>              
    </xsl:template>
    

    <xsl:template match="Years" mode="generateYearList">
        <td align="center" colspan="3" class="BlacktextBold">Year:                         
            <SELECT CLASS='SELReg' onChange="onSelectYear(this);" NAME='yearselect'> 
                <OPTION Value=''></OPTION>
                    <!--
                    <xsl:apply-templates select="Year" mode="getListEntry"/>
                    -->
                    <OPTION VALUE='{Value}'>2020</OPTION>
            </SELECT>
        </td>
    </xsl:template>
        
    <xsl:template match="team" mode="getListEntry">
        <OPTION VALUE='{id}'><xsl:value-of select="nickname"/></OPTION>
    </xsl:template>
    
    <xsl:template match="Year" mode="getListEntry">
        <OPTION VALUE='{Value}'><xsl:value-of select="Value"/></OPTION>
    </xsl:template>
</xsl:stylesheet>
