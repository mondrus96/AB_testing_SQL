--Use the https://thumbtack.github.io/abba/demo/abba.html to compute the lifts in metrics and the p-values for the binary metrics ( 30 day order binary and 30 day view binary) using a interval 95% confidence. 

SELECT test_assignment,
  test_number,
  COUNT(DISTINCT item) AS number_of_items,
  SUM(view_binary_30d) AS view_binary_30d
FROM
  (SELECT final_assignments.item_id AS item,
    test_assignment,
    test_number,
    test_start_date,
    MAX((CASE
             WHEN date(event_time) - date(test_start_date) BETWEEN 0 AND 30 THEN 1
             ELSE 0
         END)) view_binary_30d
   FROM dsv1069.final_assignments
   LEFT JOIN dsv1069.view_item_events
     ON final_assignments.item_id = view_item_events.item_id
   WHERE test_number = 'item_test_2'
   GROUP BY final_assignments.item_id,
    test_assignment,
    test_number,
    test_start_date) view_binary
GROUP BY test_assignment,
  test_number,
  test_start_date;