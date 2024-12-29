# 🍣 Case Study#1: DANNY'S DINNER

<img src="https://user-images.githubusercontent.com/81607668/127727503-9d9e7a25-93cb-4f95-8bd0-20b87cb4b459.png" alt="Image" width="500" height="520">

The case study is taken from [here](https://8weeksqlchallenge.com/case-study-1/)

Database Engine Used: **PostgreSQL**
Query Language Used: **SQL**
IDE Used: **pgAdmin**

## 🗂️ Contents

- [Overview](#overview)

- [Entity Relationship Diagram](#entity-relationship-diagram)

- [Business Questions with Solutions](#business-questions-with-solutions)

 ***

## Overview
What is the total amount each customer spent at the restaurant?
Check out the problem statement given in the Case Study and find the solutions to the questions so that Danny can decide whether he should expand the existing customer loyalty program or stick with the current plan. In short, we have to analyze the Danny's Dinner business model using SQL queries.

***

## Entity Relationship Diagram

![image](https://github.com/user-attachments/assets/1c85c229-d8a3-436a-95de-d16b3954555e)

***

## Business Questions with Solutions

**All Set!!! Let's Begin**

**1. What is the total amount each customer spent at the restaurant?**

![image](https://github.com/user-attachments/assets/7389e461-a3a0-4fd9-9099-08869975563b)

**Output**

![image](https://github.com/user-attachments/assets/a52dba8c-aa54-4ae3-8424-c1f9b2b28ebb)

Customer 'A' spent the highest $76

Customer 'B' spent $74

Customer 'C' spent $36

***

**2. How many days has each customer visited the restaurant?**

![image](https://github.com/user-attachments/assets/9bd8fc0a-ea59-4b7f-b5e8-91e150839408)

**Output**

![image](https://github.com/user-attachments/assets/63608a13-2b46-4519-ba17-01022eccc481)

Customer 'A' visited 4 times

Customer 'B' visited 6 times

Customer 'C' visited 2 times

***

**3. What was the first item from the menu purchased by each customer?**

![image](https://github.com/user-attachments/assets/809f7148-23a1-48ed-a93a-e8376f05a9d6)

**Output**

![image](https://github.com/user-attachments/assets/77d77b35-fbbe-49b1-a41b-6e18d7a6f76c)

Customer 'A' purchased curry and sushi
Customer 'B' purchased curry
Customer 'C' purchased ramen

***

**4. What is the most purchased item on the menu and how many times was it purchased by all customers?**

![image](https://github.com/user-attachments/assets/4c795957-5a00-44d3-93f3-181075b16823)

**Output**

![image](https://github.com/user-attachments/assets/53ac263b-fe0e-473c-bf40-0cc1b15fb552)

![image](https://github.com/user-attachments/assets/dfad058a-39ec-455c-b4d6-3d7a1c8fac31)

The most purchased item in the menu is ramen.

Customer 'A' ordered ramen 3 times

Customer 'B' ordered ramen 2 times

Customer 'C' ordered ramen 3 times

***

**5. Which item was the most popular for each customer?**

![image](https://github.com/user-attachments/assets/703052cf-a1d6-4a0d-889f-507c81abeb1e)

**Output**

![image](https://github.com/user-attachments/assets/50587cc1-17c4-4d70-808c-367ff0cc76a5)

Customer 'A' favorite is ramen
Customer 'C' favorite is also ramen
Customer 'B' is actually a really foodie, he/she purchased all the products of the menu (sushi, curry and ramen)

***

**6. Which item was purchased first by the customer after they became a member?**

![image](https://github.com/user-attachments/assets/5ca79bd6-1c61-4e34-9aab-7f59b4342ee3)

**Output**

![image](https://github.com/user-attachments/assets/9c0ba0d9-7253-4018-b81e-ea8b3326ef88)

Customer 'A' purchased ramen just after he/she became a member
Customer 'B' purchased sushi just after he/she became a member
Customer 'C' not a member so not included in the output

***

**7. Which item was purchased just before the customer became a member?**

![image](https://github.com/user-attachments/assets/b2b668a4-a2ac-4e81-bf16-def7f092b34d)

**Output**

![image](https://github.com/user-attachments/assets/baf02873-63ba-4b84-8b68-c5e4cf19ef2b)

Customer 'A' purchased sushi just before he/she became a member
Customer 'B' purchased sushi just before he/she became a member
Customer 'C' not a member so not included in the output

***

**8. What is the total items and amount spent for each member before they became a member?**

![image](https://github.com/user-attachments/assets/c20dce1f-819f-4aa2-9f01-fc681b42206b)

**Output**

![image](https://github.com/user-attachments/assets/dcf0f9fe-98f4-4cc5-a878-f582cf0d9f43)

Customer 'A' total purchase count is 2 and amount spent is $25 before he/she became a member
Customer 'B' total purchase count is 3 and amount spent is $40 before he/she became a member

***

**9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?**

![image](https://github.com/user-attachments/assets/4592b3d7-ca75-4979-add1-7c346247049e)

**Output**

![image](https://github.com/user-attachments/assets/42d38ada-e522-4bd2-8304-23afe40ddf60)

Customer 'A' have 860 points
Customer 'B' have 940 points
Customer 'C' have 360 points

***

**10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi 
  how many points do customer A and B have at the end of January?**

![image](https://github.com/user-attachments/assets/dff810fa-85ed-4948-94f4-fe450a250eb7)

**Output

![image](https://github.com/user-attachments/assets/9702e75f-7391-4ab1-927f-4fb0a0bbf24d)

Customer 'A' will have the highest 1370 points at the end of January
Customer 'B' will have 820 points at the end of January

***

**Bonus Questions**

**11. The following questions are related creating basic data tables that Danny and his team can use to quickly derive insights without needing to join the underlying tables using SQL.**

**Recreate the following table output using the available data:Recreate the following table output using the available data:**

![image](https://github.com/user-attachments/assets/a64994e2-7455-4fc1-8034-bb0d1be05a0a)

![image](https://github.com/user-attachments/assets/0921e117-69a1-4b77-b72f-6de8dc36aabe)

**Output**

![image](https://github.com/user-attachments/assets/dec5b152-7f7a-44bf-a364-f32af5aa2c27)

***

**12. Rank All The Things
Danny also requires further information about the ranking of customer products, but he purposely does not need the ranking for non-member 
purchases so he expects null ranking values for the records when customers are not yet part of the loyalty program.**

![image](https://github.com/user-attachments/assets/d2bc6f10-dc5d-4adb-bb3c-cac8e47956f6)

![image](https://github.com/user-attachments/assets/0911b1ef-77d3-45df-ab25-2f4c7fed4d6a)

**Output**

![image](https://github.com/user-attachments/assets/c28a76fc-09a2-4849-a3b6-343e5ed3a091)

***


