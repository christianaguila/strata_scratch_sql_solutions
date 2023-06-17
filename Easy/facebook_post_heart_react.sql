-- Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.

SELECT DISTINCT posts.*
FROM facebook_reactions AS reacts
    JOIN facebook_posts AS posts
    ON reacts.post_id = posts.post_id
WHERE reacts.reaction = 'heart'

