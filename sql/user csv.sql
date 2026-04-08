-- create user_csv table

CREATE TABLE user_csv (
    user_id        INT PRIMARY KEY,
    college_id     INT,
    name           VARCHAR(100),
    email          VARCHAR(150),
    phone_number   VARCHAR(15),
    college_name   VARCHAR(150),
    signup_date    DATE,
    updated_at     DATE,
    status         VARCHAR(20)
);


-- insert first 10 record

INSERT INTO user_csv 
(user_id, college_id, name, email, phone_number, college_name, signup_date, updated_at, status)
VALUES
(1,158,'Sneha Singh','sneha1@gmail.com','9967414785','ABC College','2023-01-18','2023-02-03','Inactive'),
(2,153,'Amit Verma','amit2@gmail.com','9632341726','XYZ College','2024-04-04','2024-05-16','Inactive'),
(3,113,'Priya Khan','priya3@gmail.com','9564566906','ABC College','2024-03-28','2024-05-27','Inactive'),
(4,189,'Amit Gupta','amit4@gmail.com','9658340847','PQR Institute','2024-12-23','2025-02-15','Active'),
(5,200,'Anjali Khan','anjali5@gmail.com','9533732985','PQR Institute','2024-05-17','2024-05-20','Active'),
(6,192,'Sneha Joshi','sneha6@gmail.com','9241213851','XYZ College','2024-08-29','2024-10-14','Inactive'),
(7,127,'Sneha Gupta','sneha7@gmail.com','9175883078','LMN University','2023-06-13','2023-07-04','Inactive'),
(8,160,'Sneha Gupta','sneha8@gmail.com','9164146113','PQR Institute','2024-04-26','2024-05-22','Active'),
(9,190,'Neha Joshi','neha9@gmail.com','9680849712','ABC College','2024-02-17','2024-02-20','Inactive'),
(10,176,'Vikram Singh','vikram10@gmail.com','9274137305','XYZ College','2024-09-05','2024-09-07','Inactive');



-- INSERT INTO user_csv / generate data for
SELECT
    generate_series(11,1000) AS user_id,
    (100 + floor(random()*100))::int AS college_id,
    'User_' || generate_series(11,1000) AS name,
    'user' || generate_series(11,1000) || '@gmail.com' AS email,
    '9' || floor(random()*1000000000)::bigint AS phone_number,
    CASE 
        WHEN random() < 0.25 THEN 'ABC College'
        WHEN random() < 0.50 THEN 'XYZ College'
        WHEN random() < 0.75 THEN 'PQR Institute'
        ELSE 'LMN University'
    END AS college_name,
    CURRENT_DATE - (random()*365)::int AS signup_date,
    CURRENT_DATE - (random()*200)::int AS updated_at,
    CASE 
        WHEN random() < 0.5 THEN 'Active'
        ELSE 'Inactive'
    END AS status;






