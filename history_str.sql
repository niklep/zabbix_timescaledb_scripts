CREATE TABLE history_str_new (LIKE history_str INCLUDING DEFAULTS INCLUDING CONSTRAINTS EXCLUDING INDEXES);
SELECT create_hypertable('history_str_new', 'clock', chunk_time_interval => 86400);
INSERT INTO history_str_new SELECT * FROM history_str;
DROP TABLE IF EXISTS history_str;
ALTER TABLE IF EXISTS history_str_new RENAME TO history_str;
CREATE INDEX history_str_1 on history_str (itemid,clock);
