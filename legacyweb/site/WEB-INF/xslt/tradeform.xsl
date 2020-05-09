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
        <form name="TradeEntry" action="Controller?page=transaction&amp;mode=ProcessTrade" method="post">
            <xsl:apply-templates select="Teams"/> 
        </form>
    </xsl:template>
    
    <xsl:template name="javascript">
        <xsl:text>
    
         var onChangeCallback;	//callback for input change events
         
        //load event
        function onLoad()
        { 
            setInputHandlers(document.TradeEntry,myChangeCallBack);  
        }

        function onUnload()
        {
        }
        
        function myChangeCallBack(elementChanged)
        {
            if (elementChanged.value == "false")
                elementChanged.value = "true";
            else
                elementChanged.value = "false";
                
            
        }
        
        function save()
        {
            document.TradeEntry.submit();
        }
        
        function setInputHandlers(form,onChangeHandler)
        {
            onChangeCallback = onChangeHandler;
            var i = 0;
            while (i != form.elements.length)
            {
		//don't overwrite the handler if it was already assigned
		if(form.elements[i].onchange == null)
		{
                    //capture check box clicks so we can set the dirty flag
                    if(form.elements[i].type=="checkbox" || form.elements[i].type=="radio" )
                    {
                        form.elements[i].onmousedown = new Function('valueChange(this)');
                    }
                    else
                        form.elements[i].onchange = new Function('valueChange(this)');
		}
                i++;
            }
        }
        
        function valueChange(changedElement)
        {    
            //if an onChange callback function was passed to setOnChangeHandlers,
            //call it!
            if (onChangeCallback)
		return onChangeCallback(changedElement);

            return true;
        }
        
        </xsl:text>
    </xsl:template>    
    <!--
    *****************************************************************
    ** Generate the team droplist
    **************************************************************-->
    <xsl:template match="Teams">
        <td valign="top">                
            <table width="100%" border="1" cellspacing="0" cellpadding="0">                    
                    <xsl:apply-templates select="roster" mode="getTradeElements"/>
            </table>
        </td>
    </xsl:template>
    
    <xsl:template match="roster" mode="getTradeElements">
        <tr>
        <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td bgcolor="#FFFFFF" colspan="3">
                        <table width="100%" border="0" cellspacing="1" cellpadding="2">
                            <tr>
                                <th colspan="3" class="tableHeaderText" bgcolor="000033" align="center"><b><xsl:value-of select="@teamname"/></b></th>
                            </tr>
                            <tr><!-- Double Spacer -->
                                <td colspan="3" height="20"></td>
                                </tr>
                            <tr bgcolor="#000066" class="WhiteTitletext">
                                <th  align="center"><b>Pitchers</b></th>
                                <th  align="center"><b>Players</b></th>
                                <th  align="center"><b>Draft Picks</b></th>
                            </tr>
                            <tr>
                                <xsl:apply-templates select="pitchers" mode="getPlayerRows" />
                                <xsl:apply-templates select="players" mode="getPlayerRows" />
                                <xsl:apply-templates select="draftpicks" mode="getDraftPickRows" />
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        </tr> 
            <tr>
                <td>
                    <IMG bgcolor='#000000' SRC='images/Save.gif' align='center' onMouseDown='save();'/>
                </td>
            </tr>  
    </xsl:template>
 
    
    <xsl:template match="pitchers" mode="getPlayerRows">
        <td>
            <table border="0" cellspacing="1" cellpadding="2">
		<xsl:apply-templates select="player" mode="getPlayerRow" />
            </table>
        </td>
    </xsl:template>
    
    <xsl:template match="players" mode="getPlayerRows">
          <td>
            <table border="0" cellspacing="1" cellpadding="2">
		<xsl:apply-templates select="player" mode="getPlayerRow" />
            </table>
          </td>
    </xsl:template>

    <xsl:template match="draftpicks" mode="getDraftPickRows">
        <td>
            <table border="0" cellspacing="1" cellpadding="2">
		<xsl:apply-templates select="draftpick" mode="getRow" />
            </table>
        </td>
    </xsl:template>
    
    <xsl:template match="player" mode="getPlayerRow">
        <tr>
            <td align='left'>
                <input name='player-{id}' type='checkbox' value='false'></input>
                <a href="{bbreflink}"><xsl:value-of select="displayname"/></a>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="draftpick" mode="getRow">
        <tr>
            <td align='left'>
                <input name='pick-{id}' type='checkbox' value='false'></input>
                <a href="{bbreflink}"><xsl:value-of select="displayname"/></a>
            </td>
        </tr>
    </xsl:template>    
    
</xsl:stylesheet>