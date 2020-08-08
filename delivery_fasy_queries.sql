1) Display all customers from a specific city:
SELECT * FROM customer
INNER JOIN location
ON customer.fk_location_id = location.location_id
INNER JOIN zip
ON zip.zip_id = location.fk_zip_id
WHERE zip.city = 'Ellesmere Port';



2) Count all customers from a specific city:
SELECT COUNT(customer_id) as NumberOfCustomers FROM customer
INNER JOIN location
ON customer.fk_location_id = location.location_id
INNER JOIN zip
ON zip.zip_id = location.fk_zip_id
WHERE zip.city = 'Baden';



3) How many packages/mail were sent from this specific city:
SELECT COUNT(item_id) as NumberOfSentItems FROM item
INNER JOIN send
ON send.fk_item_id = item.item_id
INNER JOIN customer
ON customer.customer_id = send.fk_customer_id
INNER JOIN location
ON customer.fk_location_id = location.location_id
INNER JOIN zip
ON zip.zip_id = location.fk_zip_id
WHERE zip.city = 'Ellesmere Port';



4)who sent packages/mail on this date
SELECT first_name, last_name FROM customer
INNER JOIN send
ON send.fk_customer_id = customer.customer_id
WHERE send.send_date = '2020-05-30 00:00:00';



5)who sent items between this and that date:
SELECT DISTINCT first_name, last_name FROM customer
INNER JOIN send
ON send.fk_customer_id = customer.customer_id
WHERE send.send_date BETWEEN '2020-06-30 00:00:00' AND '2020-07-30 00:00:00';



6)how many items were sent between this and that date:
SELECT COUNT(item_id) as NumberOfSentItems FROM item
INNER JOIN send
ON send.fk_item_id = item.item_id
WHERE send.send_date BETWEEN '2020-06-30 00:00:00' AND '2020-07-30 00:00:00';



7)how many items needed longer than 6 days to deliver:
SELECT COUNT(item_id) as NumberOfSentItems FROM item
INNER JOIN send
ON send.fk_item_id = item.item_id
INNER JOIN receive
ON receive.fk_item_id = item.item_id
WHERE receive.receive_date - send.send_date > 6000000;



8)who has received (an) item(s) within 5 days which was sent from specific city:
SELECT DISTINCT first_name, last_name FROM customer
INNER JOIN send
ON send.fk_customer_id = customer.customer_id
INNER JOIN receive
ON receive.fk_customer_id = customer.customer_id
INNER JOIN location
ON location.location_id = customer.fk_location_id
INNER JOIN zip
ON location.fk_zip_id = zip.zip_id
WHERE receive.receive_date - send.send_date < 6000000 AND zip.city = 'Ellesmere Port';


