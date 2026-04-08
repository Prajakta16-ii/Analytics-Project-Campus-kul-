CREATE TABLE notice (
    notice_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    notice_title VARCHAR(255) NOT NULL,
    description TEXT,
    notice_read BOOLEAN DEFAULT FALSE,
    published_date DATE,
    expiry_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_user
    FOREIGN KEY (user_id) 
    REFERENCES user_csv(user_id)
    ON DELETE CASCADE
);



INSERT INTO notice 
(user_id, notice_title, description, notice_read, published_date, expiry_date)
SELECT 
    user_id,
    'Important Notice for User ' || user_id,
    'This is a system generated notice.',
    (random() < 0.5),
    CURRENT_DATE,
    CURRENT_DATE + INTERVAL '30 days'
FROM user_csv;





UPDATE notice
SET notice_title = 
CASE 
    WHEN random() < 0.25 THEN 'Exam Schedule Announcement'
    WHEN random() < 0.50 THEN 'Internship Drive Notice'
    WHEN random() < 0.75 THEN 'Holiday Declaration'
    ELSE 'Placement Training Update'
END;

SELECT * FROM notice;




UPDATE user_csv
SET college_name =
CASE
    WHEN random() < 0.33 THEN 'MIT ADT '
    WHEN random() < 0.66 THEN 'ABC Ins'
    ELSE 'PQR University'
END;














