CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    post_name VARCHAR(150) NOT NULL,
    module VARCHAR(50),
    post_description TEXT NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_likes INT DEFAULT 0,

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES user_csv(user_id)
        ON DELETE CASCADE
);



INSERT INTO posts 
(user_id, post_name, module, post_description, created_date, updated_date, total_likes)

SELECT
    (RANDOM()*50)::INT + 1 AS user_id,   -- Make sure these user_ids exist in user_csv
    
    'Post Title #' || gs AS post_name,
    
    CASE 
        WHEN gs % 6 = 0 THEN 'Campus Feed'
        WHEN gs % 6 = 1 THEN 'Placements'
        WHEN gs % 6 = 2 THEN 'Events'
        WHEN gs % 6 = 3 THEN 'News'
        WHEN gs % 6 = 4 THEN 'Resources'
        ELSE 'Achievements'
    END AS module,
    
    'Detailed post description for post #' || gs AS post_description,
    
    CURRENT_TIMESTAMP - (RANDOM()*30 || ' days')::INTERVAL AS created_date,
    
    CURRENT_TIMESTAMP AS updated_date,
    
    (RANDOM()*100)::INT AS total_likes

FROM generate_series(1,1000) AS gs;




CREATE TABLE comment (
    comment_id SERIAL PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_post
        FOREIGN KEY (post_id)
        REFERENCES posts(post_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_comment_user
        FOREIGN KEY (user_id)
        REFERENCES user_csv(user_id)
        ON DELETE CASCADE
);






INSERT INTO comment (post_id, user_id, comment_text, created_date)
SELECT
    (RANDOM()*999)::INT + 1,     -- Random post (1–1000)
    (RANDOM()*50)::INT + 1,      -- Adjust to your actual user range
    'Sample comment #' || gs,
    CURRENT_TIMESTAMP - (RANDOM()*15 || ' days')::INTERVAL
FROM generate_series(1,2000) AS gs;






ALTER TABLE posts
ADD COLUMN category VARCHAR(50);





select * from comment;
