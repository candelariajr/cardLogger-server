DROP DATABASE IF EXISTS cardLogger;
CREATE DATABASE IF NOT EXISTS cardLogger;
USE cardLogger;
DROP TABLE IF EXISTS cardLogger.cardLocation;
CREATE TABLE IF NOT EXISTS cardLogger.cardLocation(
	location_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(512),
    active TINYINT(1)
);
DROP TABLE IF EXISTS cardLogger.ip_whitelist;
CREATE TABLE IF NOT EXISTS cardLogger.ip_whitelist(
	ip_index INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ip_address VARCHAR(128),
    ip_name VARCHAR(512)
);
DROP TABLE IF EXISTS cardLogger.checkin;
CREATE TABLE IF NOT EXISTS cardLogger.checkin(
	checkin_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    device_location_index INT NOT NULL REFERENCES cardLogger.location(location_id),
    checkin_ip_address VARCHAR(128)
);
DROP TABLE IF EXISTS cardLogger.logset;
CREATE TABLE IF NOT EXISTS cardLogger.logset(
	log_entry_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    card_number CHAR(9) NOT NULL,
    log_location_index INT NOT NULL REFERENCES cardLogger.location(location_id),
    log_time DATETIME DEFAULT NOW(),
    originating_ip VARCHAR(128),
    offline_transaction TINYINT(1)
);

