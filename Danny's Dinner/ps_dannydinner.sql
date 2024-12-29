/* DANNY'S DINNER CASE STUDY USING POSTGRESQL

CREATING TABLE */

CREATE TABLE members (customer_id VARCHAR(1),
join_date DATE);

CREATE TABLE menu (product_id INT,
product_name VARCHAR(25),
price INT);

CREATE TABLE sales (customer_id VARCHAR(1),
order_date DATE,
product_id INT);

/* INSERTING RECORDS IN THE TABLE */

INSERT INTO members (customer_id,join_date)
VALUES ('A','2021-01-07'),
('B','2021-01-09');

INSERT INTO menu (product_id,product_name,price)
VALUES (1,'sushi',10),
(2,'curry',15),
(3,'ramen',12);

INSERT INTO sales (customer_id,order_date,product_id)
VALUES ('A', '2021-01-01', 1),
  ('A', '2021-01-01', 2),
  ('A', '2021-01-07', 2),
  ('A', '2021-01-10', 3),
  ('A', '2021-01-11', 3),
  ('A', '2021-01-11', 3),
  ('B', '2021-01-01', 2),
  ('B', '2021-01-02', 2),
  ('B', '2021-01-04', 1),
  ('B', '2021-01-11', 1),
  ('B', '2021-01-16', 3),
  ('B', '2021-02-01', 3),
  ('C', '2021-01-01', 3),
  ('C', '2021-01-01', 3),
  ('C', '2021-01-07', 3);

  /* DISPLAY ALL THE TABLES */

  SELECT * FROM members;
  SELECT * FROM menu;
  SELECT * FROM sales;
  

  /* CASE STUDY QUESTIONS */
  
  -- 1. What is the total amount each customer spent at the restaurant?
  SELECT s.customer_id, SUM(m.price) FROM sales s
  INNER JOIN menu m ON s.product_id = m.product_id
  group by s.customer_id
  order by customer_id;

  -- 2. How many days has each customer visited the restaurant?
  SELECT customer_id, count(distinct(order_date)) as days_visited
  FROM sales GROUP BY customer_id;

  --3. What was the first item from the menu purchased by each customer?
  SELECT customer_id, product_name FROM 
  (SELECT s.customer_id, s.order_date, m.product_name,
  DENSE_RANK() OVER(PARTITION BY s.customer_id ORDER BY s.order_date ASC)
  AS order_rank FROM sales s INNER JOIN menu m
  ON s.product_id = m.product_id) AS a
  WHERE order_rank = 1
  GROUP BY customer_id, product_name;

  
  --4. What is the most purchased item on the menu and 
  -- how many times was it purchased by all customers?
  SELECT product_name from menu where product_id = (SELECT product_id FROM
  sales GROUP BY product_id
  ORDER BY COUNT(*) DESC
  LIMIT 1);
  
  SELECT customer_id, product_id, count(*) as order_count
  FROM sales GROUP BY customer_id, product_id
  HAVING product_id = (SELECT product_id FROM
  sales GROUP BY product_id
  ORDER BY COUNT(*) DESC
  LIMIT 1);

  

  --5. Which item was the most popular for each customer?
  SELECT customer_id, product_name FROM 
  (SELECT s.customer_id, m.product_name, COUNT(*) AS order_count,
  DENSE_RANK() OVER(PARTITION BY s.customer_id ORDER BY COUNT(*) DESC)
  AS order_rank
  FROM sales s INNER JOIN menu m ON s.product_id = m.product_id
  GROUP BY s.customer_id, m.product_name
  ORDER BY s.customer_id) AS a
  WHERE order_rank = 1;

  --6. Which item was purchased first by the customer after they became a member?
  SELECT customer_id, product_name FROM
  (SELECT s.customer_id, s.order_date, m.product_name, 
  ROW_NUMBER() OVER(PARTITION BY s.customer_id ORDER BY order_date ASC) AS order_rank 
  FROM sales s
  INNER JOIN menu m ON s.product_id = m.product_id
  INNER JOIN members mb ON s.customer_id = mb.customer_id
  WHERE s.order_date > mb.join_date
  ORDER BY customer_id, order_date) AS a
  WHERE order_rank = 1;

  

  --7. Which item was purchased just before the customer became a member?
  SELECT customer_id, product_name FROM
  (SELECT s.customer_id, s.order_date, m.product_name,
  ROW_NUMBER() OVER(PARTITION BY s.customer_id ORDER BY s.order_date DESC)
  AS order_rank FROM sales s INNER JOIN menu m ON s.product_id = m.product_id
  INNER JOIN members mb ON s.customer_id = mb.customer_id
  WHERE s.order_date < mb.join_date) AS a
  WHERE order_rank = 1;

  --8. What is the total items and amount spent for each member 
  -- before they became a member?
  SELECT s.customer_id,count(s.product_id),SUM(m.price) FROM
  sales s INNER JOIN menu m ON s.product_id = m.product_id
  INNER JOIN members mb ON s.customer_id = mb.customer_id 
  WHERE s.order_date < mb.join_date
  GROUP BY s.customer_id ORDER BY customer_id;

  

  --9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier
  -- how many points would each customer have?
  SELECT customer_id, SUM(points) FROM 
  (SELECT s.customer_id, m.product_name, m.price,
  CASE WHEN m.product_name = 'sushi' THEN (2*10*m.price)
  ELSE (10*m.price) END AS points 
  FROM sales s INNER JOIN menu m ON s.product_id = m.product_id) AS a
  GROUP BY customer_id ORDER BY customer_id;

  

  --10. In the first week after a customer joins the program (including their join date) 
  -- they earn 2x points on all items, not just sushi 
  -- how many points do customer A and B have at the end of January?
  SELECT customer_id, SUM(points) FROM (SELECT s.customer_id, s.order_date,
  m.product_name, m.price,
  CASE WHEN (s.order_date BETWEEN mb.join_date AND mb.join_date + INTERVAL '6 DAY') OR  
  (m.product_name = 'sushi') THEN (2*10*m.price)
  ELSE (10*m.price) END AS points
  FROM sales s INNER JOIN menu m ON s.product_id = m.product_id
  INNER JOIN members mb ON s.customer_id = mb.customer_id) AS a
  WHERE order_date <='2021-01-31'
  GROUP BY customer_id;

  SELECT * FROM members;
  SELECT * FROM menu;
  SELECT * FROM sales;

  /* BONUS QUESTIONS */
  -- 11. 
  SELECT s.customer_id, s.order_date, m.product_name, m.price, 
  CASE WHEN mb.join_date IS NULL OR s.order_date < mb.join_date THEN 'N' 
  ELSE 'Y' END AS member FROM sales s INNER JOIN menu m ON s.product_id = m.product_id
  LEFT JOIN members mb ON s.customer_id = mb.customer_id
  ORDER BY customer_id, order_date;

  --12. 
  SELECT *, CASE WHEN member = 'N' then null
  ELSE DENSE_RANK() OVER(PARTITION BY customer_id, member ORDER BY order_date) END AS ranking
  FROM (SELECT s.customer_id, s.order_date, m.product_name, m.price, 
  CASE WHEN mb.join_date IS NULL OR s.order_date < mb.join_date THEN 'N' 
  ELSE 'Y' END AS member FROM sales s INNER JOIN menu m ON s.product_id = m.product_id
  LEFT JOIN members mb ON s.customer_id = mb.customer_id
  ORDER BY customer_id, order_date);
  