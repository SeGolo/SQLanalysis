--a. Calculate a “funnel” per campaign (General summary);
SELECT (campaign_id),
	COUNT(user_id) AS [Users],
	COUNT(date_sent) AS [Sent],
	SUM(opened_email) AS [Opened],
	SUM(opened_email) * 100 / COUNT(opened_email) AS [% Opened],-- in %
	SUM(clicked_on_link) AS [Click],
	SUM(clicked_on_link) * 100 / COUNT(clicked_on_link) AS [% Click], -- in %
	SUM(visited_landing_page) AS [VLP],
	SUM(visited_landing_page) * 100 / COUNT(visited_landing_page) AS [% VLP],-- in %
	SUM(converted) AS [Conversion],
	SUM(converted) * 100 / COUNT(converted) AS [% Conversion]-- in %
FROM campaign_user
GROUP BY campaign_id
ORDER BY 'Conversion' DESC;

-- b. Find the most successful campaign in terms of;
    -- i. proportion of opened (among sent) emails;
SELECT (campaign_id),
	COUNT(date_sent) AS [Sent]
FROM campaign_user
GROUP BY campaign_id
ORDER BY 'Sent' DESC;
    -- ii. proportion of conversions among emails opened. 
SELECT (campaign_id),
	SUM(converted) AS [Conversion]
FROM campaign_user
GROUP BY campaign_id
ORDER BY 'Conversion' DESC;

--2. 1. c.	Find all users who were contacted with at least 5 campaigns;
SELECT user_id, COUNT(*) AS [User]
FROM campaign_user
GROUP BY user_id
HAVING COUNT(*) >= 5
     -- i. converted in more than 75% of cases; 
SELECT campaign_id, converted
FROM campaign_user
WHERE converted >= 0.75
     -- ii. never converted.
SELECT campaign_id, converted
FROM campaign_user
WHERE converted = 0