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
		<td bgcolor="#FFFFFF" valign="top">                
			<table width = "100%" border="0" cellspacing="0" cellpadding="0">                    
				<tr>                        
					<td class="tableHeaderText" align="center">NABL Constitution</td>                    
				</tr>                                     
				<tr>                        
					<td class="Blacktext">
 
<p><b><u><font size="2" face="Arial">Nationwide APBA League- Established 1985</font></u></b></p>
<p><font face="Arial" size="2">PREAMBLE</font></p>

<p><font face="Arial" size="2">The purpose of the NABL is to provide its members with a hobby for relaxation
and enjoyment. Its goals are to promote friendly competition among its members
by playing APBA Major League Baseball Game (basic game) and to simulate real
life baseball as much as possible.</font></p>
<p><font face="Arial" size="2">The primary responsibility of all managers is to keep the league's purpose
and goals in mind while engaging in all league activities. All are expected to
play the game in the spirit of the rules and to maintain an atmosphere of
gentlemanly sportsmanship and competition. In addition, the managers are
expected to be punctual. The league commissioner will penalize managers that are
not punctual. Serious offenders have been and will be dismissed from the league.</font></p>
        <hr align="center"/>
<p><b><font face="Arial" size="2">SECTION ONE- LEAGUE MANAGEMENT</font></b></p>
<p><u><font face="Arial" size="2">A. Game Type</font></u></p>
<p><font face="Arial" size="2">The NABL is a basic game league. The APBA</font><font face="Arial" size="1">™</font><font face="Arial" size="2"> Major League Baseball Basic Game
will be used in adherence to the rules of this constitution and the minor
enhancements it describes. No other game or cards shall be used to play any NABL games,
even if both managers agree, and prefer other versions of APBA</font><font face="Arial" size="1">™</font><font face="Arial" size="2"> baseball. The
APBA</font><font face="Arial" size="1">™</font><font face="Arial" size="2"> Basic game
and cards are to be used in exclusivity.</font></p>

<p><u><font face="Arial" size="2">B. League Schedule</font></u></p>
<p><font face="Arial" size="2">This list of events constitutes a league cycle. The game schedule is on the
web site, and will typically be distributed by April, prior to the start of the
season.</font></p>
<p><font face="Arial" size="2">APRIL- Rookie draft is typically held on the first Saturday of the month. Draft time
and location, both physically and on the web, is left to the discretion of the
commissioner. The trading of the next year's draft picks can commence after the
draft is finished, with the exception of the first round picks, which cannot be
traded until September first. Unclaimed (waived) players can be picked up in May
and June following the procedure described in Rule G below.</font></p>
<p><font face="Arial" size="2">MAY 1- Start of the NABL season. Rosters set to
25 players. Trading
continues.</font></p>
<p><font face="Arial" size="2">JUNE - Last month to
make waiver claims.</font></p>
<p><font face="Arial" size="2">OCTOBER 31- Deadline for trades for traded players to be used in post-season.</font></p>
<p><font face="Arial" size="2">JANUARY- Last month of regular season play. Prior to January's games, Rosters
expand to 30 players</font></p>
<p><font face="Arial" size="2">FEB 1- Playoffs begin. 25-man playoff rosters must be turned in to the
commissioner's office.</font></p>
<p><font face="Arial" size="2">FEB 15- Rosters are cut to 30 players.</font></p>

<p><u><font face="Arial" size="2">C. League Organization</font></u></p>
<p><font face="Arial" size="2">The NABL is a 18-team league composed of three
divisions of 6 teams. Teams are generally aligned by fictional
geographic location, however preferences of individual managers are considered.
Each team completes a 162 game schedule.</font></p>
<p><font face="Arial" size="2">League Commissioner- His responsibilities will be spokesman for the league.
He will be the arbiter in all disputes. In disputes involving the commissioner,
one of the other officers will be arbiter.  He will enforce all rules. He
will dispense all messages to the league, and will be the contact person for the
league on all matters. He will keep rosters, draft picks, waivers and
transactions. He will keep emergency instructions, and dispense them when
necessary. He will be in charge of enforcing the tardiness rules and applying
penalties when necessary. He will send out press releases at least monthly to
the league. He is the go-to guy.</font></p>
<p><font face="Arial" size="2">League Webmaster- Will maintain the league website. Will post standings,
stats, and other messages as given to him by the commissioner and/or
statistician. If other folks have things they want posted on the website, that
material is to go to the commissioner first, who will then deliver it to the
Webmaster</font></p>
<p><font face="Arial" size="2">League Statistician- He is the guy who gets all stats. They can be sent
directly to him, or to the commissioner, who will forward them. By the
deadlines, if the statistician is missing some stats, he will contact the
commissioner, who will inquire into the missing stats and dispense justice and
or penalties according to the constitution. The statistician will also send
stats and standings to the Webmaster for inclusion on the website</font></p>
<p><font face="Arial" size="2">Draftmaster- He will, upon receiving the final W-L records of every team,
conduct the draft lottery. He will report those results to the league office,
and the commissioner will release them to the league. The draftmaster is also
the host of the draft.</font></p>
<p><u><font face="Arial" size="2">D. Playoffs</font></u></p>
<p><font face="Arial" size="2">Six teams make the playoffs; the 1st
place teams in each of the three divisions and three wildcards (teams with the three best
records regardless of division). The teams are seeded by record,
with the best record getting a first round bye.</font></p>

<p><font face="Arial" size="2">All playoff series are 7 games, and follow the 2,3,2 format. The playoff
series are expected to be played by the managers involved, unless the
commissioners have granted prior approval. Detailed reports are expected for
each playoff segment. A schedule will be established by the commissioner for the
completion of each round of the playoffs. Games not completed on time will
result in penalties in the upcoming draft. At his discretion, the commissioner
can delegate another individual to play the games for the delinquent manager,
with the first choice usually being the opponent who has been delayed by the
tardiness.</font></p>
<p><font face="Arial" size="2">A 4-man rotation must be used in the playoffs.</font></p>
<p><font face="Arial" size="2">Graded Relievers are limited to 7 innings per series.
&quot;D&quot; Relievers can pitch unlimited innings.</font></p>
<p><font face="Arial" size="2">Each team in the post season must choose a 25-man roster for the entire post
season (no substitutions or replacements allowed) This playoff roster is
comprised of players on the 40-man roster as of the 2/3 mark of the
season.(10/31) Only J-0, J-1, J-2, and J-3 players are eligible for the
playoffs. No J-4 players are allowed. If a player has run out of games or
innings in the regular season but otherwise meets all criteria above, they are
eligible to play once again in the playoffs.</font></p>
<p><u><font face="Arial" size="2">E. Tie Breaking</font></u></p>
<p><font face="Arial" size="2">If teams are tied for the purposes of determining playoff bracket positions,
seeding is determined using the following tiebreakers:</font></p>
<p><font face="Arial" size="2">* Head-to-head record * Record against common non-divisional opponents *
Record against divisional winners * Three game series or round robin between
tied teams</font></p>

<p><font face="Arial" size="2">Teams cannot be eliminated from post-season eligibility through tiebreakers.
If two or more teams are tied for the final playoff spot, the commissioners will
conduct one game playoffs as necessary to determine the post-season
participants. All players on the 37-man rosters are eligible for these games. If
a round robin is necessary, seeding (including any necessary byes) will be
determined by the bracket seeding criteria listed above.</font></p>
<p><u><font face="Arial" size="2">F. Trading</font></u></p>
<p><font face="Arial" size="2">Trading is allowed throughout the year. Any combination of players and draft
picks may be exchanged between teams providing trades are made in the spirit of
the preamble. First round draft picks cannot be traded until September 1st prior
to the draft in question. All other picks can be traded in the season prior to
the draft in question beginning at the end of the previous rookie draft. Players
traded after 10/31 are not eligible for post-season play. All trades must be
reported to the commissioner and is subject to approval. If a trade appears
unfair to either team or is not in the league's best interest, the Commissioner
will notify both managers that the trade is under review. The Commissioner will
then ask the league advisors for their opinion. The decision of the Commissioner
will be deemed final. If a trade takes place that would affect a set of
instructions that has already gone out to opponents, the trade is not executed
until the following month, when correct instructions can be sent.</font></p>
<p><u><font face="Arial" size="2">G. Unclaimed Players (Waiver Wire)</font></u></p>
<p><font face="Arial" size="2">There will always be some carded players not on any team's roster. These
players may be added to a team's roster as long as the roster never exceeds the
player limit (40). They can be added in season, in May or June only. To make a
waiver claim, a manager submits a list of players they are interested in, and
cuts if necessary to keep the team at or below 40 players. Claims must be
received by the 20th of the month. On the 21st of the month, the waiver claims
are executed, according to the draft order of the previous rookie draft, one
player per team per round, until all claims are awarded. A team may give
specific instructions as to how many players to get from the list, which players
to cut for each acquisition, etc…</font></p>
<p><u><font face="Arial" size="2">H. Roster Size</font></u></p>
<p><font face="Arial" size="2">NABL rosters fluctuate during the course of a year. During the season, each
team is allowed to keep 40 players, 25 at the major league level, and 15 at the
minor level. On January 1st, the Major league roster is expanded to 30. On
February 15th, (unless another date is announced by commissioner) each team is
required to cut down to 30 players; the 10 cut players go into the rookie draft.
Rosters may temporarily expand to over 40 at the conclusion of the rookie draft
and prior to the established date for reporting the final roster. Players may be
exchanged between the major and minor league rosters at any time between series,
but never in the middle of a series.</font></p>
<p><u><font face="Arial" size="2">I. Uncarded Players</font></u></p>
<p><font face="Arial" size="2">Each year there are some players that do not receive a card from the APBA
Game Company that have received cards in the past. If a team holds the rights to
such a player, the team may retain the rights to the player. Such a player must
be treated as a carded player with regard to roster spots, they count against
roster limits at all times during the season. There is no limit to the number of
uncarded players a team may retain, and these players may be traded. If an
uncarded player is cut in the pre-draft cutdown, he is eligible to be drafted by
any team during the draft. If an uncarded player is not drafted, he is eligble
to be &quot;pulled back by the team that originally cut him at the conclusion of that team's draft. Any
uncarded player not on a roster at the conclusion of the draft is not subject to
waivers, and is dropped from the league until he receives a card again. At that
time he will be draftable as a rookie.</font></p>

<p><u><font face="Arial" size="2">J. Rookie Draft</font></u></p>
<p><font face="Arial" size="2">Each April, a Rookie draft is held to allow teams to restock their rosters
and select the players first carded by the game company. All carded players not
on a roster, and all cut players (carded or uncarded) are eligible for the
rookie draft. The draft is held online or via telephone and is traditionally the first or second
Saturday in April. The specific date and time is at the discretion of the
draftmaster. The draft is eight rounds long. At any point during the draft, a
team may announce that they are pulling back some or all of their cut players
that are still undrafted, up to the 40 player limit. At this point, those
players are put back on that team and are ineligible to be drafted by another
team. The team that announces the pullbacks also forfeits the rest of their
draft picks for the draft (i.e. they are done). If, after eight rounds, a team
has less than 40 players they may claim some of their cuts (but may not go over
the 40 man roster limit) or just keep the roster below 40 and attempt to pick up
players via the waiver wire. Teams are allowed to accumulate draft picks that
may take them over the 40-man limit, and are not allowed to pull back any
pre-draft waived players. The team must cut to the 40-man limit within 72-hours
of the end of the draft.</font></p>
<p><u><font face="Arial" size="2">K. Amendments</font></u></p>
<p><font face="Arial" size="2">At the conclusion of each season, the league will vote on any proposed
amendments to the constitution. A 2/3 majority of those voting is required to
pass an amendment.</font></p>
<p><u><font face="Arial" size="2">L. Teams without Managers</font></u></p>
<p><font face="Arial" size="2">The league will attempt to keep a backfill of managers to take over any team
that is relinquished by a manager. If at the end of the season, two or more
teams do not have managers, the players on these teams as well as their draft
picks will be placed in a special pool from which the new managers will draft to
create two new franchises.</font></p>
        <hr align="center"/>
<p><b><font face="Arial" size="2">SECTION TWO- LEAGUE MANAGER RESPONSIBILITIES</font></b></p>
<p><font face="Arial" size="2">Each manager has the responsibility to be prompt and fair.</font></p>

<p><u><font face="Arial" size="2">A. Deadlines</font></u></p>
<p><font face="Arial" size="2">Managers must meet the following deadlines:</font></p>
<p><font face="Arial" size="2">* 30 man roster and cuts to the commissioner by
MARCH 1st<br></br>
* 40 man roster
and cuts to the commissioner by APRIL 15th<br></br>
* A set of default instructions to
the commissioner by APRIL 25th<br></br>
* A set of instructions for each road series to
opponent by the 1st of the month<br></br>
* Dues to commissioner (or his designee) by
date announced.<br></br>
* Results and statistics back to opponent by the 10th of the
month following the series<br></br>
* Your teams total statistics, including W-L
breakdown for the previous month's home and road games and present month's home
games by the 15th of the following month. A schedule of when statistics are due,
and how many games those statistics are to include, is to be provided by the
statistician, and included on the webpage.</font></p>

<p><u><font face="Arial" size="2">B. Timeliness</font></u></p>
<p><font face="Arial" size="2">If a manager cannot meet the deadlines above or any other deadlines imposed
during the year by the commissioner, it is his responsibility to contact the
commissioner regarding the delay. Unexcused delays in sending instructions,
results, or statistics to opponents or the commissioner's office will be
punished as follows- 1st offense - Warning 2nd offense - Loss of 5th round draft
pick (if that pick is already traded, the pick lost will be the next higher
pick) 3rd offense - Loss of 3rd round draft pick 4th offense - Loss of 2nd round
draft pick 5th offense - Loss of first round draft pick 6th offense - Expulsion
from the league</font></p>
<p><font face="Arial" size="2">The commissioner's office reserves the right to expel someone prior to the
6th offense if it is in the best interest of the league.</font></p>
<p><u><font face="Arial" size="2">C. Statistics</font></u></p>
<p><font face="Arial" size="2">Each manager must keep the following statistics for his team:</font></p>
<p><font face="Arial" size="2">Batters- G, AB, R, H, RBI, 2B, 3B, HR, BB, SO, SB,
HBP, AVG</font></p>
<p><font face="Arial" size="2">Pitchers- G, GS, CG, SH, W, L, S, IP, H, R, ER, BB, K, ERA</font></p>
<p><font face="Arial" size="2">Please keep them in the order given. For individual series reports, AVG and
ERA are not required, but for monthly stat reports to statistician, including of
course final stats, they are.</font></p>
<p><font face="Arial" size="2">If reported in hard copy form, statistics must be reported to opponents on
the official NABL stat sheet. If reported in electronic form, they must be on
the official league template or other approved format. If you don't know for
certain a format is approved, it isn't!! Please check your programs out with the
league statistician prior to the start of the season to avoid penalties. Series
reports must include statistics for BOTH teams, totaled and balanced, and
linescores for each game. Failure to comply with these minimum requirements will
result in penalties.</font></p>

<p><u><font face="Arial" size="2">D. Road Instructions</font></u></p>
<p><font face="Arial" size="2">The purpose of this system is to keep the league running on time. Each team
must furnish the commissioner with a set of default instructions by the
beginning of the season. These instructions will be for all 81 road games. These
instructions do not supercede the responsibility of the manager to have
instructions to his opponents by the first of each month. If for some reason the
manager is late getting instructions to his opponent, that opponent can contact
the commissioner, who will, after making one attempt to contact the tardy
manager, issue the default instructions.</font></p>
<p><font face="Arial" size="2">All instructions will be typewritten, or neatly printed. Illegible
instructions are late instructions!! Instructions must contain the following:</font></p>
<p><font face="Arial" size="2">* Lineups with position for player, and APBA rating. Fielding will be totaled
for infield and team. * Rotations, including grade of pitcher, and all adjusters
(W, X, Y, ,Z, etc…) * Bullpen, with grade of pitcher, and all adjusters *
Substitutes for injury or ejection for all positions * Major league team in
present card set for all players on active roster * No more than 25 active
players, which must include at least 5 starting pitchers</font></p>
<p><u><font face="Arial" size="2">E. Player Restrictions</font></u></p>
<p><font face="Arial" size="2">Batters may only play the actual number of games in which they appeared
during the season for which they are carded. Starting pitchers are limited to
the number of starts they had during the season for which they are carded.
Relievers are limited to the number of innings they pitched during the season
for which they are carded. Grade D pitchers may start any number of games (but
still require rest- see below) and can relieve for unlimited games and innings.
Grade C or higher starting pitchers used in relief are limited to the number of
starts and/or the number of innings pitched during the season for which they are
carded.</font></p>
<p><font face="Arial" size="2">Team mangers are responsible for monitoring these limits. The commissioner
reserves the right to penalize teams in violation of usage limits.</font></p>
<p><u><font face="Arial" size="2">F. Pitcher rest requirements</font></u></p>
<p><font face="Arial" size="2">Starters must rest 3 games between starts. When determining rest days, teams
may treat their home and away games as separate schedules (i.e. rest three games
between home starts and three games between road starts) There are no rest rules
for relievers, however, they should be used in a realistic manner.</font></p>

<p><u><font face="Arial" size="2">G. Penalties for Violations other than Timeliness</font></u></p>
<p><font face="Arial" size="2">If a manager fails to comply with the rules, responsibilities, or deadlines
contained herein, including but not limited to voting, keeping stats in order
and in given formats, providing legible and complete instructions, and following
protocol with regard to league activities, the commissioner can at his
discretion penalize the offending member in accordance with the penalty schedule
contained in section 2B of this constitution.</font></p>
        <hr align="center"/>
<p><b><font face="Arial" size="2">SECTION THREE- PLAYING RULES</font></b></p>
<p><u><font face="Arial" size="2">A. Designated Hitter</font></u></p>
<p><font face="Arial" size="2">The NABL uses a DH for all games. The NABL has modified the DH rule so that a
DH may play a position in the field later in the game, and the position of the
DH relegated to a new player in a different spot in the order. The DH must be
used for pitchers only, pitchers may never bat; however, pitchers may be used to
pinch run.</font></p>
<p><u><font face="Arial" size="2">B. Base Coaching slow runners</font></u></p>
<p><font face="Arial" size="2">Base coaching may be done to guide runners the fielding (12-42) play results,
but on the hitting play results, ROAD teams ONLY, if a play result ends with a
runner being thrown out, that runner is automatically held at the previous base.
Note that this is limited to SLOW runners, so normal or (F) fast runners do not
get this protection. HOME teams must base coach in all situations.</font></p>
<p><u><font face="Arial" size="2">C. Advanced Fielding</font></u></p>

<p><font face="Arial" size="2">With bases empty change play results 18 and 20 with fielding one (after
consulting Advanced Fielding Chart and making appropriate roll) &quot;out at
first&quot;</font></p>
<p><font face="Arial" size="2">Any time a play result may differ according to the fielding column, consult
the Advanced Fielding Chart to determine which fielding column to use for that
particular play.</font></p>
<p><u><font face="Arial" size="2">D. Rare Play and Error Chart</font></u></p>
<p><font face="Arial" size="2">Whenever a players card yields a result number of 15-21 (Error Chart) or
36-41, and 23 (Rare Play Chart), consult the appropriate chart and roll the
dice. Ignore rainouts, if a rainout is obtained, roll and consult the chart
again. All injuries, even to J-0 players should be acknowledged for the game in
progress only. The injured player may return to play in the next game, no matter
what the board says about length of injury.</font></p>
<p><u><font face="Arial" size="2">E. Pitcher Grade Advancement and Reduction</font></u></p>
<p><font face="Arial" size="2">A pitchers grade is advanced in accordance with the rules as outlined on the
&quot;Runner on Second&quot; game board (old boards) or on page 2 of the
sacrifice/ hit and run booklet (new boards) A pitchers grade is advanced or
reduced in accordance with the rules as outlined on the NABL &quot;Summary of
Game Rules&quot; sheet. A relief pitcher's grade is advanced whenever he enters
the game, for the first batter he faces, regardless of the handedness of the
pitcher or batting side of the batter. This advancement is for one batter only.</font></p>

<p><font face="Arial" size="2">* A pitcher's grade is reduced one grade (for the remainder of the game) if
one of the following occurs:</font></p>
<p><font face="Arial" size="2">a. If he gives up 5 earned runs in 3 consecutive innings, or</font></p>
<p><font face="Arial" size="2">b. If he gives up 6 earned runs total in the game, or</font></p>
<p><font face="Arial" size="2">c. If he gives up 7 total runs in the game. * Once a pitchers grade is
reduced (through rule #1 above) it is reduced again every time another 2 earned
runs are given up. * A pitcher must be removed after his grade has been reduced
3 times in the same game. * A pitcher drops a grade for every inning pitched in
excess of 9. Therefore, a starter is reduced a grade entering the 10th inning,
and is reduced again entering the 11th inning. He cannot go more than 11
innings, because his grade would be reduced a third time entering the 12th, and
therefore must be removed as per rule # 3 above.</font></p>
<p><u><font face="Arial" size="2">F. A&amp;B and A&amp;C pitchers</font></u></p>
<p><font face="Arial" size="2">Every time a batter gets an extra base hit against an A&amp;B or A&amp;C
pitcher, roll one die. If the roll is a 1,2, or 3, the hit stands. If it is a 4,
5, or 6, change the result to a 7- single.</font></p>
<p><u><font face="Arial" size="2">G. Player Positions</font></u></p>

<p><font face="Arial" size="2">Players may only play positions on their current cards.</font></p>
<p><u><font face="Arial" size="2">H. Hit and Run</font> </u></p>
<p><font face="Arial" size="2">The hit and run play may be used 3 times in a 9 inning game, and once more in
extra innings. The batter must have 2 31's on his card to be used on the hit and
run.</font></p>
<p><u><font face="Arial" size="2">I. Use of Relievers</font></u></p>
<p><font face="Arial" size="2">In order to minimize unrealistic early use of relief pitchers, starting
pitchers cannot be removed unless one of the following has occurred:</font></p>
<p><font face="Arial" size="2">* He has pitched 5 innings * He has allowed three or more earned runs * He
has been reduced * He is injured or ejected as result of a rare play.</font></p>
<p></p><font face="Arial" size="2">Remember, in the NABL, a reliever is upgraded for the first batter he faces,
regardless of handedness or whether he enters at the beginning or middle of an
inning.</font>	

					</td>					
				</tr>                    
             
			</table>           
                </td>         
	</xsl:template>
</xsl:stylesheet>