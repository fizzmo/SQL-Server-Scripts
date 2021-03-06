USE tempdb
 GO
 CREATE TABLE TestCompression (col1 INT, col2 CHAR(50))
 GO
 INSERT INTO TestCompression VALUES (10, 'compression testing')
 GO 5000
 -- Original
 EXEC sp_spaceused TestCompression
 GO
 -- DATA_COMPRESSION = ROW
 ALTER TABLE TestCompression
 REBUILD WITH (DATA_COMPRESSION = ROW);
 GO
 EXEC sp_spaceused TestCompression
 GO
 -- DATA_COMPRESSION = PAGE
 ALTER TABLE TestCompression
 REBUILD WITH (DATA_COMPRESSION = PAGE);
 GO
 EXEC sp_spaceused TestCompression
 GO
 -- DATA_COMPRESSION = NONE
 ALTER TABLE TestCompression
 REBUILD WITH (DATA_COMPRESSION = NONE);
 GO
 EXEC sp_spaceused TestCompression
 GO
 