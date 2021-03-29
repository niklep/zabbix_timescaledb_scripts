CREATE TABLE history_new (LIKE history INCLUDING DEFAULTS INCLUDING CONSTRAINTS EXCLUDING INDEXES);
SELECT create_hypertable('history_new', 'clock', chunk_time_interval => 86400);
INSERT INTO history_new SELECT * FROM history;
DROP TABLE IF EXISTS history;
ALTER TABLE IF EXISTS history_new RENAME TO history;
CREATE INDEX history_1 on history (itemid,clock);
