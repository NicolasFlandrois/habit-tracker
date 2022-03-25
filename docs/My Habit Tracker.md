Fri 25 March 2022 16:55:48 CET

To date latest version of database relations and table's organisation.

This config works well for me... For now.

# List of relations

| Schema |  Name   | Type  | Owner |
|--------|---------|-------|-------|
| public | habits  | table | user  |
| public | tracker | table | user  |

# Table "habits"

|      Column       |          Type          | Collation | Nullable |                 Default                  |
|-------------------|------------------------|-----------|----------|------------------------------------------|
| habit_id          | integer                |           | not null | nextval('habits_habit_id_seq'::regclass) |
| name              | character varying(255) |           | not null |                                          |
| description       | character varying(255) |           |          |                                          |
| what_do_i_measure | character varying      |           |          |                                          |
| units             | character varying      |           |          |                                          |
| default_val       | integer                |           |          |                                          |

Indexes:

- "habits_pkey" PRIMARY KEY, btree (habit_id)

Referenced by:

- TABLE "tracker" CONSTRAINT "tracker_habit_id_fkey" FOREIGN KEY (habit_id) REFERENCES habits(habit_id)

# Table "tracker"

|  Column  |           Type           | Collation | Nullable |                  Default                  |
|----------|--------------------------|-----------|----------|-------------------------------------------|
| track_id | integer                  |           | not null | nextval('tracker_track_id_seq'::regclass) |
| habit_id | integer                  |           | not null |                                           |
| date     | timestamp with time zone |           | not null | CURRENT_TIMESTAMP                         |
| quantity | integer                  |           |          |                                           |
| comments | character varying        |           |          |                                           |

Indexes:

- "tracker_pkey" PRIMARY KEY, btree (track_id)

Foreign-key constraints:

- "tracker_habit_id_fkey" FOREIGN KEY (habit_id) REFERENCES habits(habit_id)
