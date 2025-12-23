-- Query 1: JOIN Requirement: Retrieve booking information along with Customer name and Vehicle name.
SELECT
  b.booking_id,
  u.name AS customer_name,
  v.name AS vehicle_name,
  b.start_date,
  b.end_date,
  b.status
FROM
  bookings AS b
  INNER JOIN users AS u ON b.user_id = u.user_id
  INNER JOIN vehicles AS v ON b.vehicle_id = v.vehicle_id;


-- Query 2: EXISTS Requirement: Find all vehicles that have never been booked.
SELECT
  *
FROM
  vehicles v
WHERE
  NOT EXISTS (
    SELECT
      *
    FROM
      bookings b
    WHERE
      b.vehicle_id = v.vehicle_id
  );


-- Query 3: WHERE Requirement: Retrieve all available vehicles of a specific type (e.g. cars).
CREATE FUNCTION retrieve_by_type (vehicle_type varchar(15)) RETURNS TABLE (
  vehicle_id int,
  name varchar(50),
  type varchar(15),
  model int,
  registration_number text,
  rental_price int,
  status varchar(15)
) language sql AS $$
  SELECT
  *
FROM
  vehicles
WHERE
  type = vehicle_type
  AND status = 'available';
$$;


SELECT
  *
FROM
  retrieve_by_type ('car');


-- Query 4: GROUP BY and HAVING Requirement: Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.
SELECT
  v.name AS vehicle_name,
  count(b.booking_id) AS total_bookings
FROM
  bookings AS b
  INNER JOIN vehicles AS v ON b.vehicle_id = v.vehicle_id
GROUP BY
  v.name
HAVING
  count(b.booking_id) > 2;