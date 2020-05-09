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
                <xsl:apply-templates select="CardedPlayers"/>
    </xsl:template>
    
    <xsl:template match="CardedPlayers">
     <form name="AddEntry" action="Controller?page=transaction&amp;mode=CompleteAdd&amp;team1={@id}" method="post">
        <td valign="top">
            <table width="450" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="tableHeaderText" colspan="2" align="center"><xsl:value-of select="@name"/> Add</td>
                </tr>
                <tr><!-- Double Spacer -->
                    <td colspan="2" height="20"></td>
                </tr>
        <xsl:for-each select="Team">
            <xsl:if test="position() mod 3 = 1">
                <xsl:text disable-output-escaping="yes">&lt;tr&gt;</xsl:text>
            </xsl:if>
                <td valign="top">
                    <table width="200" border="1" cellspacing="0" cellpadding="0">
                        <tr>
                            <th BGCOLOR="#DADADA" ALIGN="center"><xsl:value-of select="Name"/></th>
                        </tr>
                        <xsl:apply-templates select="Player"/>
                    </table>
                </td>
            <xsl:if test="position() mod 3 = 0">
                <xsl:text disable-output-escaping="yes">&lt;/tr&gt;</xsl:text>
            </xsl:if>                
        </xsl:for-each>
             <tr>
                <td>
                    <IMG bgcolor='#000000' SRC='images/Save.gif' align='center' onMouseDown='save();'/>
                </td>
            </tr>  
            </table>
        </td>
     </form>               
    </xsl:template>
    
    <xsl:template name="javascript">
        var onChangeCallback;	//callback for input change events
         
        //load event
        function onLoad()
        { 
            setInputHandlers(document.AddEntry,myChangeCallBack);  
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
            document.AddEntry.submit();
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
    </xsl:template>    
    
   <xsl:template match="Player">
        <tr>
            <td><input name='player-{id}' type='checkbox' value='false'></input></td>
            <td BGCOLOR='{color}' align='center'><a href="{bbreflink}"><xsl:value-of select="displayname"/></a></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>