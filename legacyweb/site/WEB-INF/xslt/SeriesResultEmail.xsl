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
         <xsl:apply-templates select="Series" />
    </xsl:template>
    
    <xsl:template match="Series">
<xsl:value-of select="VisitTeamName"/> at <xsl:value-of select="HomeTeamName"/>

<xsl:apply-templates select="GameResult" mode="getGames"/>    
    </xsl:template> 
    
    <xsl:template match="GameResult" mode="getGames" >
        <xsl:variable name="homescore" select="HomeScore"/>
        <xsl:variable name="visitscore" select="VisitScore" />
        
Game <xsl:value-of select="GameId"/>: 
   <xsl:if test="$homescore > $visitscore">
   <xsl:value-of select="HomeTeamName"/><xsl:text> </xsl:text><xsl:value-of select="HomeScore"/> - <xsl:value-of select="VisitTeamName"/> <xsl:text> </xsl:text><xsl:value-of select="VisitScore"/>
   Winning Pitcher: <xsl:value-of select="HomePitcherName"/>      Losing Pitcher: <xsl:value-of select="VisitPitcherName"/>
   Game Notes: <xsl:value-of select="Comment" />
   </xsl:if>
   <xsl:if test="$visitscore > $homescore">
   <xsl:value-of select="VisitTeamName"/><xsl:text> </xsl:text><xsl:value-of select="VisitScore"/> - <xsl:value-of select="HomeTeamName"/><xsl:text> </xsl:text><xsl:value-of select="HomeScore"/>
   Winning Pitcher: <xsl:value-of select="VisitPitcherName"/>      Losing Pitcher: <xsl:value-of select="HomePitcherName"/>
   Game Notes: <xsl:value-of select="Comment" />
   </xsl:if>
       </xsl:template>
    
</xsl:stylesheet>