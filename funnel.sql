WITH home_count AS (
    SELECT 
	    COUNT (DISTINCT user_id) AS cnt1
	FROM home_page	
), search_count AS (
    SELECT 
	    COUNT (DISTINCT user_id) AS cnt2
	FROM search_page
), payment_count AS (
    SELECT 
	    COUNT (DISTINCT user_id) AS cnt3
	FROM payment_page
), confirmation_count AS (
    SELECT 
	    COUNT (DISTINCT user_id) AS cnt4
	FROM payment_confirmation
)
SELECT 
    cnt1 AS home,
	cnt2 AS search,
	cnt3 AS payment,
	cnt4 AS confirmation,
	ROUND(100.0 * cnt2/cnt1,2) AS home_to_search_conversion,
	ROUND(100.0 * cnt3/cnt2,2) AS search_to_payment_conversion,
	ROUND(100.0 * cnt4/cnt3,2) AS payment_to_confirmation_conversion,
	ROUND(100.0 * cnt4/cnt1,2) AS total_conversion
FROM home_count,search_count,payment_count,confirmation_count;
