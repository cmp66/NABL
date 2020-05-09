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
<frameset >
      <frame name = "constitution" src = "/constitution.html" />
      <noframes>
         <body>Your browser does not support frames.</body>
      </noframes>
      
   </frameset>
	</xsl:template>
</xsl:stylesheet>
