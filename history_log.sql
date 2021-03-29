CREATE TABLE history_log_new (LIKE history_log INCLUDING DEFAULTS INCLUDING CONSTRAINTS EXCLUDING INDEXES);
SELECT create_hypertable('history_log_new', 'clock', chunk_time_interval => 86400);
INSERT INTO history_log_new SELECT * FROM history_log;
DROP TABLE IF EXISTS history_log;
ALTER TABLE IF EXISTS history_log_new RENAME TO history_log;
CREATE INDEX history_log_1 on history_log (itemid,clock);
