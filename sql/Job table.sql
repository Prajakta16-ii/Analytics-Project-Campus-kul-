CREATE TABLE job_events (
    event_id SERIAL PRIMARY KEY,
    
    user_id INTEGER REFERENCES user_c(user_id),
    job_id INTEGER REFERENCES jobs(job_id),
    
    event_type VARCHAR(50) CHECK (event_type IN (
        'job_view',
        'job_click',
        'apply_start',
        'apply_submit'
    )),
    
    event_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    college VARCHAR(100),
    role VARCHAR(100)
);