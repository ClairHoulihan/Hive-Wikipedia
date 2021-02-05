-- This is all initial setup of the main tables
USE project1data;

SHOW TABLES;

DESCRIBE clickstream;

CREATE TABLE CLICKSTREAM (
	prev STRING,
	curr STRING,
	ltype STRING,
	number_of_occurances INT
	)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH 'wikimedia_data/clickstream-enwiki-2020-06.tsv' INTO TABLE CLICKSTREAM;

DROP TABLE CLICKSTREAM;

	
-----------------------------------

DESCRIBE PAGEVIEWS;

CREATE TABLE PAGEVIEWS (
	domain_code STRING,
	page_title STRING,
	count_views INT,
	number_of_occurances INT
	)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ' ';

LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-000000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-010000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-020000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-030000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-040000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-050000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-060000' INTO TABLE CLICKSTREAM;
-----------------------------------------------------------------------------------------
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-070000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-080000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-090000' INTO TABLE CLICKSTREAM;
------
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-100000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-110000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-120000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-130000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-140000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-150000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-160000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-170000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-180000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-190000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-200000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-210000' INTO TABLE CLICKSTREAM;
-----------------------------------------------------------------------------------------
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-220000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20210120-230000' INTO TABLE CLICKSTREAM;

DESCRIBE PAGEVIEWS_DOMAIN;

CREATE TABLE PAGEVIEWS_DOMAIN (
	page_title STRING,
	count_views INT,
	number_of_occurances INT
	)
	PARTITIONED BY (domain_code STRING)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ' ';

INSERT INTO TABLE PAGEVIEWS_DOMAIN PARTITION(domain_code='en')
SELECT page_title, count_views, total_response_size FROM PAGEVIEWS WHERE domain_code='en';

INSERT INTO TABLE PAGEVIEWS_DOMAIN PARTITION(domain_code='en.m')
SELECT page_title, count_views, total_response_size FROM PAGEVIEWS WHERE domain_code='en.m';

CREATE TABLE PAGEVIEWS_DOMAIN_COMBINED
	ROW format delimited 
    fields terminated BY ' ' 
AS SELECT page_title, SUM(count_views) as count_views, number_of_occurances as total_response_size
FROM PAGEVIEWS_DOMAIN	
GROUP BY page_title, number_of_occurances;

SELECT * FROM PAGEVIEWS_DOMAIN_COMBINED LIMIT 50;

DROP TABLE PAGEVIEWS_DOMAIN_COMBINED;

DROP TABLE PAGEVIEWS_DOMAIN;

DROP TABLE PAGEVIEWS;

-----------------------------------------------------------------------------------------------

CREATE TABLE PAGEVIEWS_JUNE (
domain_code STRING,
	page_title STRING,
	count_views INT,
	number_of_occurances INT
	)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ' ';


LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-000000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-010000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-020000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-030000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-040000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-050000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-060000' INTO TABLE CLICKSTREAM;
-----------------------------------------------------------------------------------------
-- This data is unused
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-070000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-080000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-090000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-100000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-110000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-120000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-130000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-140000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-150000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-160000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-170000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-180000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-190000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-200000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-210000' INTO TABLE CLICKSTREAM;
-----------------------------------------------------------------------------------------
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-220000' INTO TABLE CLICKSTREAM;
LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-230000' INTO TABLE CLICKSTREAM;

DESCRIBE PAGEVIEWS_DOMAIN;

CREATE TABLE PAGEVIEWS_JUNE_PARTITIONED (
	page_title STRING,
	count_views INT,
	number_of_occurances INT
	)
	PARTITIONED BY (domain_code STRING)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ' ';

INSERT INTO TABLE PAGEVIEWS_JUNE_PARTITIONED PARTITION(domain_code='en')
SELECT page_title, count_views, total_response_size, domain_code FROM PAGEVIEWS_JUNE WHERE domain_code='en';

INSERT INTO TABLE PAGEVIEWS_JUNE_PARTITIONED PARTITION(domain_code='en.m')
SELECT page_title, count_views, total_response_size, domain_code FROM PAGEVIEWS_JUNE WHERE domain_code='en.m';

CREATE TABLE PAGEVIEWS_JUNE_PARTITIONED_COMBINED
	ROW format delimited 
    fields terminated BY ' ' 
AS SELECT page_title, SUM(count_views), total_response_size, domain_code
FROM PAGEVIEWS_DOMAIN	
GROUP BY page_title, total_response_size, domain_code;

SELECT * FROM pageviews_june_partitioned_sum LIMIT 50;

--------------------------------------------------------------------------------------------------

CREATE TABLE REVISION (
	wiki_db STRING,
	event_entity STRING,
	event_type STRING,
	event_timestamp STRING,
	event_comment STRING,
	event_user_id INT,
	event_user_text_historical STRING,
	event_user_text STRING,
	event_user_blocks_historical STRING,
	event_user_blocks STRING,
	event_user_groups_historical STRING,
	event_user_groups STRING,
	event_user_is_bot_by_historical STRING,
	event_user_is_bot_by STRING,
	event_user_is_created_by_self BOOLEAN,
	event_user_is_created_by_system BOOLEAN,
	event_user_is_created_by_peer BOOLEAN,
	event_user_is_anonymous BOOLEAN, 
	event_user_registration_timestamp STRING,
	event_user_creation_timestamp STRING,
	event_user_first_edit_timestamp STRING,
	event_user_revision_count INT,
	event_user_seconds_since_previous_revision INT,
	page_id INT,
	page_title_historical  STRING,
	page_title  STRING,
	page_namespace_historical INT,
	page_namespace_is_content_historical BOOLEAN,
	page_namespace INT,
	page_namespace_is_content BOOLEAN,
	page_is_redirect BOOLEAN,
	page_is_deleted BOOLEAN,
	page_creation_timestamp STRING,
	page_first_edit_timestamp STRING,
	page_revision_count INT,
	page_seconds_since_previous_revision INT,
	user_id INT,
	user_text_historical string,	
	user_text	string,
	user_blocks_historical string,
	user_blocks	string,	
	user_groups_historical	string,	
	user_groups	string,
	user_is_bot_by_historical string,	
	user_is_bot_by	string,	
	user_is_created_by_self boolean,	
	user_is_created_by_system boolean,
	user_is_created_by_peer boolean,
	user_is_anonymous boolean,
	user_registration_timestamp	string,
	user_creation_timestamp	string,
	user_first_edit_timestamp	string,
	revision_id INT,
	revision_parent_id INT, 
	revision_minor_edit boolean, 
	revision_deleted_parts	string,
	revision_deleted_parts_are_suppressed boolean,
	revision_text_bytes INT, 
	revision_text_bytes_diff INT, 
	revision_text_sha1	string,
	revision_content_model	string, 
	revision_content_format	string, 
	revision_is_deleted_by_page_deletion boolean,	
	revision_deleted_by_page_deletion_timestamp	string, 
	revision_is_identity_reverted boolean,
	revision_first_identity_reverting_revision_id INT,
	revision_seconds_to_identity_revert INT,
	revision_is_identity_revert boolean,
	revision_is_from_before_page_creation boolean,
	revision_tags	string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH 'wikimedia_data/2020-12.enwiki.2020-06.tsv' INTO TABLE REVISION;

SELECT * FROM REVISION ORDER BY page_title_historical LIMIT 50;

CREATE TABLE REVISION_SIMPLIFIED
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY '\t'
AS SELECT wiki_db, event_entity, event_type, event_timestamp, page_title_historical, page_seconds_since_previous_revision, event_comment
FROM REVISION
WHERE event_timestamp LIKE '2020-06-01%' AND wiki_db = 'enwiki';

SELECT * FROM REVISION_SIMPLIFIED LIMIT 50;

CREATE TABLE PAGEVIEWS_JUNE_HOUR (
	domain_code STRING,
	page_title STRING,
	count_views INT,
	number_of_occurances INT
	)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ' ';

LOAD DATA LOCAL INPATH 'wikimedia_data/pageviews-20200601-080000' INTO TABLE PAGEVIEWS_JUNE_HOUR;

CREATE TABLE PAGEVIEWS_JUNE_HOUR_SUM
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ' '
AS SELECT page_title, SUM(count_views) as count_views
FROM PAGEVIEWS_JUNE_HOUR
WHERE domain_code = 'en' OR domain_code = 'en.m'
GROUP BY page_title;

SELECT * FROM PAGEVIEWS_JUNE_HOUR_SUM WHERE page_title='A.C.A.B.'LIMIT 50;

DROP TABLE PAGEVIEWS_JUNE_HOUR_SUM;

DROP TABLE PAGEVIEWS_JUNE_HOUR;

DROP TABLE REVISION_SIMPLIFIED;

DROP TABLE REVISION;



-- Question 1

SELECT page_title, count_views, total_response_size
FROM pageviews_domain_combined 
ORDER BY count_views DESC;

-- Question 2

CREATE TABLE pageviews_june_partitioned_sum
	ROW format delimited 
    fields terminated BY ' ' 
AS SELECT page_title, (3 * 30 * count_views) as all_sum
FROM pageviews_june_partitioned_combined;

CREATE TABLE FRACTION
      row format delimited
         fields terminated by '\t'
AS SELECT cs.prev, cs.curr, cs.number_of_occurances
FROM CLICKSTREAM_SUM as cs
WHERE number_of_occurances > 10
INNER JOIN pageviews_june_partitioned_sum;

CREATE TABLE fraction_add_by_prev
      row format delimited
      fields terminated by '\t'
AS SELECT prev, SUM()
FROM fraction_prev_curr
GROUP BY prev;

CREATE TABLE fraction_removed_duplicates 
      row format delimited
         fields terminated by '\t'
AS SELECT cs.prev, cs.curr, number_of_occurances, 
FROM fraction_add_by_prev as cs
WHERE number_of_occurances > 10
INNER JOIN pageviews_june_partitioned_sum as pjps
ON cs.prev = pjps.page_title;



CREATE TABLE fraction_prev_curr
      row format delimited
         fields terminated by '\t'
AS SELECT prev, (CAST(number_of_occurances AS DECIMAL) / CAST(page_views AS DECIMAL)) as fractions
FROM fraction_add_by_prev;



SHOW TABLES;

SELECT * FROM fraction_removed_duplicates LIMIT 50;
SELECT * FROM fraction_prev_curr LIMIT 50;
SELECT * FROM clickstream_sum LIMIT 50;
SELECT * FROM fraction LIMIT 50;
SELECT * FROM fraction_add_by_prev LIMIT 50;
SELECT * FROM pageviews_june_partitioned_sum LIMIT 50;

-- Question 3

CREATE TABLE hotel_california_prev 
		row format delimited
        fields terminated by '\t'
AS SELECT *
FROM clickstream 
WHERE prev='Hotel_California';

CREATE TABLE past_hotel_california 
		row format delimited
        fields terminated by '\t'
AS SELECT hcp.prev as hotel_prev, hcp.curr as prev_c, hcp.number_of_occurances as prev_num_occurances, cs.curr as curr, cs.number_of_occurances as number_of_occurances
FROM hotel_california_prev as hcp
INNER JOIN clickstream as cs
ON hcp.curr = cs.past;

CREATE TABLE fraction_hotel_first 
		row format delimited
        fields terminated by '\t'
AS SELECT phc.hotel_prev, phc.prev_c, phc.curr, fpc.fractions
FROM fraction_prev_curr as fpc
INNER JOIN past_hotel_california as phc
ON fpc.prev = phc.hotel_prev;

CREATE TABLE fraction_hotel_second
		row format delimited
        fields terminated by '\t'
AS SELECT phc.hotel_prev, phc.prev_c, phc.curr, phc.fractions, fpc.fractions as prev_c_fractions
FROM fraction_prev_curr as fpc
INNER JOIN fraction_hotel_first as fhf
ON fpc.prev = fhf.prev_c;

CREATE TABLE fraction_hotel_third
		row format delimited
        fields terminated by '\t'
AS SELECT fht.hotel_prev, fht.prev_c, fht.curr, fht.fractions, fht.prev_c_fractions, fpc.fractions as curr_fractions
FROM fraction_prev_curr as fpc
INNER JOIN fraction_hotel_second as fhs
ON frd.prev = phc.past;

CREATE TABLE total_fractions_hotel 
	ROW format delimited
	fields terminated by '\t'
AS SELECT hotel_prev, prev_c, curr, (hotel_fractions * prev_c_fractions * curr_fractions) as total_frac
FROM fraction_hotel_third;

SELECT hotel_prev, prev_c, curr, MAX(total_frac) as total_frac 
FROM total_fractions_hotel 
GROUP BY hotel_prev, prev_c, curr
ORDER BY total_frac DESC
LIMIT 50;

        
SHOW TABLES;


SELECT * FROM hotel_california_prev LIMIT 50;
SELECT * FROM past_hotel_california LIMIT 50;
SELECT * FROM fraction_hotel_first LIMIT 50;
SELECT * FROM fraction_hotel_second LIMIT 50;
SELECT * FROM fraction_hotel_third LIMIT 50;
SELECT * FROM total_fractions_hotel LIMIT 50;


-- Question 4
-- Assume NA users use Wikipedia between 22:00 UPC to 6:00 UTC (This starts at 5:00pm EST to 10:00pm PST)

SELECT page_title, SUM(count_views) as count_views
FROM PAGEVIEWS_JUNE_PARTITIONED_COMBINED 
GROUP BY page_title
ORDER BY count_views DESC;

-- Question 5
-- Lots of assumptions here, main one here is that all pageviews during that hour were spread out during the hour of viewing

CREATE TABLE REVISION_PAGEVIEWS
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY '\t'
AS SELECT pjh.page_title, pjh.count_views, rs.event_entity, rs.event_type, rs.event_timestamp, rs.page_seconds_since_previous_revision, rs.event_comment
FROM PAGEVIEWS_JUNE_HOUR_SUM as pjh
INNER JOIN REVISION_SIMPLIFIED as rs
ON rs.page_title_historical = pjh.page_title;

CREATE TABLE LOCALIZED_REVISION_PAGEVIEWS
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY '\t'
AS SELECT * 
FROM REVISION_PAGEVIEWS 
WHERE event_comment LIKE '%vandal%' AND event_timestamp LIKE '% 08:%';

SELECT * FROM localized_revision_pageviews LIMIT 50;

SELECT (SUM(CAST(page_seconds_since_previous_revision AS DECIMAL) / CAST(count_views AS DECIMAL)) / COUNT(page_seconds_since_previous_revision)) as average_viewers_of_vandalized_pages
FROM LOCALIZED_REVISION_PAGEVIEWS;

DROP TABLE LOCALIZED_REVISION_PAGEVIEWS;

DROP TABLE REVISION_PAGEVIEWS;

-- Question 6
-- Check the number of revisions on pages in June

SELECT page_title_historical, COUNT(*) as num_revisions
FROM revision_simplified 
GROUP BY page_title_historical 
ORDER BY num_revisions DESC
LIMIT 50
OFFSET 1;
