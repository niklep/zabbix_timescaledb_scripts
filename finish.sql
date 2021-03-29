UPDATE config SET db_extension='timescaledb',hk_history_global=1,hk_trends_global=1;
UPDATE config SET compression_status=1,compress_older='7d';
