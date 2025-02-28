//Coaches of particular teams
MATCH (c:COACH)-[:COACHES_FOR]->(t:TEAM)  
WHERE t.name IN ["Australia", "New Zealand", "South Africa"]  
RETURN c.name AS Coach, t.name AS Team;


//coaches and players in database 
MATCH (coach:COACH), (player:PLAYER)
RETURN coach, player


//fetching few properties of players together
MATCH (p:PLAYER)  
RETURN p.name, p.age, p.role, p.batting_style, p.bowling_style, p.rating, p.height 
ORDER BY p.rating DESC;


//list of players in decreasing order of their age
MATCH (p:PLAYER)  
RETURN p.name AS Player, p.age AS Age  
ORDER BY p.age DESC;


//list of players in decreasing order of their age with limit
MATCH (p:PLAYER)  
RETURN p.name AS Player, p.age AS Age  
ORDER BY p.age DESC  
LIMIT 5;


//roles of each player
MATCH (p:PLAYER)  
RETURN p.role AS Role, COLLECT(p.name) AS Players;


//count of players for particular role
MATCH (p:PLAYER)  
RETURN p.role AS Role, COUNT(p) AS PlayerCount  
ORDER BY PlayerCount DESC;


//assigning random rating to players as their properties
MATCH (p:PLAYER)  
SET p.rating = 1 + rand() * 9;


//fetching player rating
MATCH (p:PLAYER)  
RETURN p.name, p.rating  
ORDER BY p.rating DESC;


//fetch player id
MATCH (p:PLAYER)  
RETURN ID(p) AS PlayerID, p.name AS Name;


//fetch players who are batsmen
MATCH (p:PLAYER)  
WHERE p.role = "Batsman"  
RETURN p.name, p.batting_style, p.rating  
ORDER BY p.rating DESC;


//fetch players who are all rounders
MATCH (p:PLAYER)  
WHERE p.role = "All-rounder"  
RETURN p.name, p.batting_style, p.bowling_style, p.rating;


//players belonging to respective teams
MATCH (p:PLAYER)-[:PLAYS_FOR]->(t:TEAM)  
RETURN t.name AS Team, COLLECT(p.name) AS Players;


//player playing for more than one team
MATCH (p:PLAYER)-[:PLAYS_FOR]->(t1:TEAM), (p)-[:PLAYS_FOR]->(t2:TEAM)  
WHERE t1 <> t2  
RETURN p.name AS Player, COLLECT(t1.name) AS Teams;


//no of matches played by player
MATCH (p:PLAYER)-[r:PLAYS_FOR]->(t:TEAM)  
RETURN p.name AS Player, SUM(r.matches) AS MatchesPlayed  
ORDER BY MatchesPlayed DESC;


//height of player
MATCH (player:PLAYER) 
WHERE player.height >= 2
RETURN player
SKIP 1
LIMIT 3


//player height with skip 
MATCH (player:PLAYER) 
WHERE player.height >= 2
SKIP 1
ORDER BY player.height DESC
LIMIT 3
RETURN player


match(n) return(n)


//no of runs scored by players
match(p:PLAYER)-[d:PLAYED_AGAINST]-(t:TEAM)
return p.name as player, SUM(d.runs) as runs_scored


//average of players
match(p:PLAYER)-[d:PLAYED_AGAINST]-(t:TEAM)
return p.name as player, AVG(d.runs) as Average


//players played against a particular team
MATCH(player:PLAYER)-[:PLAYED_AGAINST]-(team:TEAM)
where team.name = "India"
    return player,team


//players played for particular team
MATCH(player:PLAYER)-[:PLAYS_FOR]-(team:TEAM)
where team.name = "India"
    return player,team


//assigning random height to players as property
MATCH (p:PLAYER)  
SET p.height = 160 + rand() * 40;


//fetching assigned heights of players
MATCH (p:PLAYER)  
RETURN p.name, p.height;
 