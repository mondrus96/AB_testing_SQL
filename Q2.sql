--Reformat the final_assignments_qa to look like the final_assignments table, filling in any missing values with a placeholder of the appropriate data type.

--STRATEGY is to use union to put together the different data by joining row-wise, then append any repeating columns to the subquery (ie., date)
SELECT
  *,
  '2016-01-07 00:00:00'::TIMESTAMP AS test_start_date
FROM
  (
  --TEST 1
  SELECT 
    item_id,
    test_a AS test_assignment,
    'item_test_1' AS test_number
  FROM 
    dsv1069.final_assignments_qa
  UNION
  --TEST 2
  SELECT 
    item_id,
    test_b AS test_assignment,
    'item_test_2' AS test_number
  FROM 
    dsv1069.final_assignments_qa
  UNION
  --TEST 3
  SELECT 
    item_id,
    test_b AS test_assignment,
    'item_test_3' AS test_number
  FROM 
    dsv1069.final_assignments_qa
  UNION
  --TEST 4
  SELECT 
    item_id,
    test_b AS test_assignment,
    'item_test_4' AS test_number
  FROM 
    dsv1069.final_assignments_qa
  UNION
  --TEST 5
  SELECT
    item_id,
    test_b AS test_assignment,
    'item_test_5' AS test_number
  FROM 
    dsv1069.final_assignments_qa
  UNION
  --TEST 6
  SELECT
    item_id,
    test_b AS test_assignment,
    'item_test_5' AS test_number
  FROM 
    dsv1069.final_assignments_qa
  ) subq