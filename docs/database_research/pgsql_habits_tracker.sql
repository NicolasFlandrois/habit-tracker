-- Initialy based for postgresql SQL database & tables creation
-- Author: NFL
-- Created on: Tue, 25 Jan 2022 15:25:18 +0100
-- Single user habit tracking, minimalist database.
DROP TABLE IF EXISTS habits;
        CREATE TABLE habits (
        habit_id serial PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        description VARCHAR(255),
        what_do_i_measure VARCHAR,
        units VARCHAR
    );

DROP TABLE IF EXISTS tracker;
        CREATE TABLE tracker (
        track_id SERIAL PRIMARY KEY,
        habit_id INT NOT NULL REFERENCES habits (habit_id),
        date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
        quantity INT,
        comments VARCHAR(255)
    );

-- habit_tracker=# 
-- \d habits
--                                             Table "public.habits"
--       Column       |          Type          | Collation | Nullable |                 Default                  
-- -------------------+------------------------+-----------+----------+------------------------------------------
--  habit_id          | integer                |           | not null | nextval('habits_habit_id_seq'::regclass)
--  name              | character varying(255) |           | not null | 
--  description       | character varying(255) |           |          | 
--  what_do_i_measure | character varying      |           |          | 
--  units             | character varying      |           |          | 
-- Indexes:
--     "habits_pkey" PRIMARY KEY, btree (habit_id)
-- Referenced by:
--     TABLE "tracker" CONSTRAINT "tracker_habit_id_fkey" FOREIGN KEY (habit_id) REFERENCES habits(habit_id)
-- 
-- habit_tracker=# \d tracker
--                                          Table "public.tracker"
--   Column  |           Type           | Collation | Nullable |                  Default                  
-- ----------+--------------------------+-----------+----------+-------------------------------------------
--  track_id | integer                  |           | not null | nextval('tracker_track_id_seq'::regclass)
--  habit_id | integer                  |           | not null | 
--  date     | timestamp with time zone |           | not null | CURRENT_TIMESTAMP
--  quantity | integer                  |           |          | 
--  comments | character varying        |           |          | 
-- Indexes:
--     "tracker_pkey" PRIMARY KEY, btree (track_id)
-- Foreign-key constraints:
--     "tracker_habit_id_fkey" FOREIGN KEY (habit_id) REFERENCES habits(habit_id)
