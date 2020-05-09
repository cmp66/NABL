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
		<td valign="top">                
			<table width = "100%" border="0" cellspacing="0" cellpadding="0">                    
				<tr>                        
					<td bgcolor="#FFFFFF" class="tableHeaderText" align="center">SBA Preview</td>                    
				</tr>                                     
				<tr>                        
					<td class="Featuretext">
<p>One of the things I do each year to prepare for the draft is to calculate the expected runs per game by player based on his APBA card.  After the draft each year,  I calculate the expected runs scored(the offense) and runs allowed(pitching and defense) for each team in the league.  For the hitters, the runs per game are multiplied by the estimated number of games played at each of the positions.  For the pitchers, I use earned run averages based on the pitcher’s letter grade and control factor, times the estimated number of starts.  The same computation is done with the relievers, based on the estimated number of relief innings.   The runs allowed by the defense is an analysis of total team fielding based on the number of games played by position.  This is then factored into the anticipated number of unearned runs allowed.  The final piece of the puzzle is the strength of bench for pinch hitting/injury coverage.</p>
 
<p>For the last three years, the predictions have been fairly close, but not exact.  There are several variables which are impossible to calculate, most important of which is management strength, which can not be quantified statistically.  Such things as which pitchers start against what teams, when do you pinch hit for your starter, when do you pinch run for the slow player, when do you call the H &amp; R, when do you make the defensive substitution, etc. It also does not factor in mid season trades, which frequently have the better teams trading for a stud pitcher or hitter from a team that is looking to rebuild. </p>

<p>The other major variable is the “luck of the dice”.  I know on my team, I always seem to have several players that woefully under perform what they did the previous year.  Most of the players perform slightly under their expected stats(which we would expect, based on no D pitching in our league, along with very strong bullpens), and then I might have one or two players that outperform the previous year.  While it rarely happens with guys that play every day(usually it is the guys with very limited playing time, such as a pinch hitter with a 1-5-5 type card that is used only with men on in home run situations), we do occasionally see guys that defy the averages.  </p>

<p>The pitchers seem to fare about as well as the hitters, most under perform the previous year because of the quality of the hitting they face day in and day out.  Of course, guys that tend to dominate(Randy Johnson, Maddux,  Pedro Martinez, etc.) will only allow home runs, because they stop everything else(Johnson last year gave up 56 homers, but only 183 hits in 251 innings pitched).  Managers can significantly affect runs allowed per team if they have a strong and deep bullpen, as they may pull a good pitcher earlier for a pinch hitter than a manager with a weak pen.  </p>

<p>The defense is the hardest to call, as I just take an average based on total games played at each position.  Many managers will pair up a weak fielder with a top rated fielder to get the fielding for the team to either good or excellent.  Many managers will use the best fielders to get to the top fielding rating, rather than using the better hitter/stone hands type of player. </p>



<p>	SO, WHO’S GOING TO MAKE IT TO THE PLAYOFFS?? </p>
<p></p>
<p>Here are the predictions:</p>
<table>
<tr>
<td>Destroyers</td>
<td>74</td>
<td>88</td>
</tr>
<tr> 
<td>Burmacats</td>
<td>88</td>
<td>74</td>
<td>Closest division race I have ever predicted</td>
</tr>
<tr>
<td>Ghosts</td>
<td>89</td>
<td>73</td>
<td>Too close to call</td>
</tr>
<tr>
<td>Express</td>
<td>59</td>
<td>103</td>
</tr>
</table>
<p></p>
<table>
<tr>
<td>Yanks</td>
<td>92</td>
<td>70</td>
<td>Also close</td>
</tr>
<tr><td>LV Lost Sheep</td><td>67</td><td>95</td></tr>
<tr><td>DoubleDowns</td><td>95</td><td>67</td><td>Probable champ</td></tr>
<tr><td>Pinstripes</td><td>63</td><td>99</td></tr>
</table>
<p></p>
<table>
<tr><td>Beer</td><td>100</td><td>62</td><td>Probable champ</td></tr>
<tr><td>Bombers</td><td>85</td><td>77</td></tr>
<tr><td>Lions</td><td>67</td><td>93</td></tr>
<tr><td>Gremlins</td><td>93</td><td>69</td></tr>
</table>
<p></p>
<table>
<tr><td>Wild Card/Dark Horse</td></tr>
<tr><td>Gremlins</td><td>93</td><td>69</td></tr>
<tr><td>Yanks</td><td>92</td><td>70</td></tr>
<tr><td>Burmacats</td><td>88</td><td>74</td></tr>
<tr><td>Bombers</td><td>85</td><td>77</td></tr>
</table>

<p>Only eight games separate the predicted wild card, and seven games or fewer separate the best team and the runner up in each division.  The games won and lost could be off by as much 5 to 10 games, so there is no sure thing this year.  If my predictions hold true, the Beer  should score the most runs, at just over 900 runs, while allowing less than 800 to score.  The top hitting teams in order are:  Beer, Lions and Destroyers, who should all score more than 850 runs. The best teams at preventing runs, based on pitching and defense are:  Gremlins, Doubledowns and Bombers.   They should allow less than 750 runs.  </p>
<p>This year does seem to have much more parity than the previous year.  Nine teams will have an ERA of between 4.50 and 5.00.   </p>

					</td>					
				</tr>                    
             
			</table>           
                </td>         
	</xsl:template>
</xsl:stylesheet>