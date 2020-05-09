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
        <form name="PlayerAssign" action="Controller?page=playerAssign" method="post">
        <xsl:apply-templates select="Selections"/>
        </form>
    </xsl:template>
    
    <xsl:template match="Selections">
        <td valign="top">                
            <table width="700" border="0" cellspacing="0" cellpadding="0">                    
                <tr>                        
                    <td bgcolor="#000033" class="tableHeaderText" colspan="2" align="center">Player Assign</td>                    
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>            
                    <xsl:apply-templates select="Years" mode="generateYearList"/>    
		</tr> 
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
                <tr>
                    <xsl:apply-templates select="teams" mode="generateDropList"/>    
		</tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="40"></td>
                </tr>
                <tr>
                    <td><input size='15' name='FilterText' value='' type='Text'/>
                        <IMG bgcolor='#000000' SRC='images/btn_apply.gif' align='center' onMouseDown='onApplyFilter();'/>
                    </td>
                </tr>
                <tr>
                    <td  height="300" width="325"> 
                        <APPLET
                            codebase="./classes"
                            CODE="com.wahoo.apba.web.util.SelectionListApplet"
                            NAME="ResourceSelectApplet"
                            WIDTH="290"
                            HEIGHT="290"
                            MAYSCRIPT="true"
                        >
                            <PARAM NAME="TeamId"        VALUE="1"/>
                            <PARAM NAME="Year"          VALUE="2005"/>
                            <PARAM NAME="ColumnName"    VALUE="Players"/>
                            <PARAM NAME="Action"        VALUE="saveTeam"/>
                        </APPLET>
                    </td>
                    <td height="300" width="325"> 
                        <APPLET
                            codebase="./classes"
                            CODE="com.wahoo.apba.web.util.SelectedListApplet"
                            NAME="SelectedApplet"
                            WIDTH="290"
                            HEIGHT="290"
                            MAYSCRIPT="true"
                        >
                            <PARAM NAME="TeamId"        VALUE="1"/>
                            <PARAM NAME="Year"          VALUE="2005"/>
                            <PARAM NAME="ColumnName"    VALUE="Team Members"/>  
                        </APPLET>
                    </td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr> 
                <tr>
                    <td>
                        <IMG bgcolor='#000000' SRC='images/Save.gif' align='center' onMouseDown='save();'/>
                    </td>
                    <td>
                        <IMG bgcolor='#000000' SRC='images/Return.gif' align='center' onMouseDown='onReturn();'/>
                    </td>
                </tr>               
            </table>            
        </td>        
	<xsl:apply-templates select="standings"/>
    </xsl:template>
    
    <xsl:template name="javascript">
        //load event
        
        year = "0";
        team = "0";
        
        function onLoad()
        {
            setTimeout( 'showSelected()', 4000, 'JavaScript' );    
        }

        function onUnload()
        {
        }
                
        function onSelectTeam(elementChanged)
        {
            team = elementChanged.value;
            //tell applets to reload elementChanged.value holds the new id
         
            if (year == "0" )
                return  true;
                
            if (document.all)
            {
                document.all("ResourceSelectApplet").reload(year, team);
            }
            else
            {
                document.ResourceSelectApplet.reload(year, team);
            }
            return true;
        }

        function onSelectYear(elementChanged)
        {
            year = elementChanged.value;
            //tell applets to reload elementChanged.value holds the new id
          
            if (team == "0")
                return  true;
                
            if (document.all)
            {
                document.all("ResourceSelectApplet").reload(year,team);
            }
            else
            {
                document.ResourceSelectApplet.reload(year,team);
            }
            return true;
        }
                
        function onApplyFilter()
        {
            if (document.all)
            {
                document.all("ResourceSelectApplet").setFilter(document.all("FilterText").value);
            }
            else
            {
                document.ResourceSelectApplet.setFilter(document.PlayerAssign.FilterText.value);
            }
        }

        function showSelected()
        {
            if (document.all)
            {
                document.all("SelectedApplet").showSelectedItems();
            }
            else
            {
                document.SelectedApplet.showSelectedItems();
            }
        }
        
        function save()
        {
            if (document.all)
            {
                document.all("ResourceSelectApplet").saveSelectedList();
            }
            else
            {
                document.ResourceSelectApplet.saveSelectedList();
            }
        }
        
        function onReturn()
        { 
            document.location = "Controller?page=management";
        }
    </xsl:template>    
    <!--
    *****************************************************************
    ** Generate the team droplist
    **************************************************************-->
    <xsl:template match="teams" mode="generateDropList">
        <td align="center" colspan="2">                        
            <SELECT CLASS='SELReg' onChange="onSelectTeam(this);" NAME='teamselect'> 
                <OPTION Value=''></OPTION>
                    <xsl:apply-templates select="team" mode="getListEntry"/>
            </SELECT>
        </td>              
    </xsl:template>

    <xsl:template match="Years" mode="generateYearList">
        <td align="center" colspan="2">                        
            <SELECT CLASS='SELReg' onChange="onSelectYear(this);" NAME='yearselect'> 
                <OPTION Value=''></OPTION>
                    <xsl:apply-templates select="Year" mode="getListEntry"/>
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
