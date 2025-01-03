# 🍕 Case Study#2: PIZZA RUNNER

<img src="https://8weeksqlchallenge.com/images/case-study-designs/2.png" alt="Image" width="500" height="520">

The case study is taken from [here](https://8weeksqlchallenge.com/case-study-2/)

Database Engine Used: **Postgre SQL**

Query Language Used: **SQL**

IDE Used: **pgAdmin**

## 🗂️ Contents
- Introduction
- Entity Relationship Diagram
- Business Questions with Solutions
   - Data Cleaning and Transformation
   - A. Pizza Metrics
   - B. Runner and Customer Experience
   - C. Ingredient Optimisation
   - D. Pricing and Ratings.

***

## Introduction

This time Danny has put his eyes on a new business model with pizza as the new item. Danny was scrolling through his Instagram feed when something really caught his eye - “80s Retro Styling and Pizza Is The Future!”. Danny decided that he is going to sell pizzas from now on, but he wanted a change. So he decided that he would uberize his pizza - that's what makes it Pizza Runner. This case study would involve business questions asked by Danny that requires solutions so tha he can better direct his runners and optimise Pizza Runner’s operations.

***

## Entity Relationship Diagram

The dataset consists of 6 tables - runner_orders, runners, customer_orders, pizza_names, pizza_recipes and pizza_toppings.

![image](https://github.com/user-attachments/assets/0f47259c-a2ba-47d8-b0d6-b475ef2d5676)

***

## 🧹 Data Cleaning and Transformation

**Table: customer_orders**

Looking at the `customer_orders` table we can see that there are some changes that need to be done.
- the column `exclusions` have blank values or contains 'null' (in string form) entered in them.
- the column `extras` also have blank values or contains 'null' (in string form) entered in them.

![image](https://github.com/user-attachments/assets/c8c0ccc8-2a1e-484e-861b-2aa47bbe4f30)

We can clean both of these columns. The steps involved in this process are as follows:
- Create a temporary table so that original table remains retained. It is considered as a best pratice to make changes in a temporary table rather than making changes in the original table.
- Remove null values in exlusions and extras columns and replace them with blank space ' '.

````sql
CREATE TEMP TABLE customer_orders_temp AS
  SELECT order_id, customer_id, pizza_id,
  CASE WHEN exclusions IS NULL OR exclusions LIKE 'null' THEN ' '
  ELSE exclusions END AS exclusions,
  CASE WHEN extras IS NULL OR extras LIKE 'null' THEN ' '
  ELSE extras END AS extras,
  order_time FROM customer_orders;
````

This is what the temporary table will look like. Moving forward, we will using this table in queries.

![image](https://github.com/user-attachments/assets/e86c5590-f598-4cb9-b1bb-c8331cc6f5db)

**Table: runner_orders**

Looking at the `runner_orders` table we can see that there are some changes that need to be done.
- In `pickup_time` column, there are 'null' values present in it. Repalce them.
- In `distance` column, keep only the numeric value. Trim the rest and replace the null values.
- In `duration` column, keep only the numeric value. Trim the rest and replace the null values.
- In `cancellation` column, replace 'null' values and blank values or missing values.
