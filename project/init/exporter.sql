CREATE USER 'exporter'@'mysql-exporter' IDENTIFIED BY 'exporter' WITH MAX_USER_CONNECTIONS 3;
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'user_wp'@'%';
GRANT PROCESS, REPLICATION CLIENT ON *.* TO 'exporter'@'mysql-exporter';
GRANT SELECT ON performance_schema.* TO 'user_wp'@'%';
GRANT SELECT ON performance_schema.* TO 'exporter'@'mysql-exporter';
FLUSH PRIVILEGES;
EXIT;
