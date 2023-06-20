# 🍕 Pizza Sales Exploratory Data Analysis

The complete project can be viewed at [Link](https://github.com/AlexanderEvanW/PortfolioProjects/blob/main/Pizza%20Sales/Pizza%20Sales%20EDA.ipynb)

This project is based on the Maven Pizza Challenge, and all the datasets are downloadable from their [website](https://www.mavenanalytics.io/blog/maven-pizza-challenge)

## Objective
For the Maven Pizza Challenge, you’ll be playing the role of a BI Consultant hired by Plato's Pizza, a Greek-inspired pizza place in New Jersey. You've been hired to help the restaurant use data to improve operations, and just received the following note:

Welcome aboard, we're glad you're here to help!

Things are going OK here at Plato's, but there's room for improvement. We've been collecting transactional data for the past year, but really haven't been able to put it to good use. Hoping you can analyze the data and put together a report to help us find opportunities to drive more sales and work more efficiently.

Here are some questions that we'd like to be able to answer:

- What days and times do we tend to be busiest?
- How many pizzas are we making during peak periods?
- What are our best and worst selling pizzas?
- What's our average order value?
- How well are we utilizing our seating capacity? (we have 15 tables and 60 seats)
- How much money did we make this year? Can we indentify any seasonality in the sales?
- That's all I can think of for now, but if you have any other ideas I'd love to hear them – you're the expert!

Thanks in advance,

Mario Maven (Manager, Plato's Pizza)

## Tools
- PostgreSQL is used to combine datasets and modify column names.
- Python is used for data preprocessing and exploratory data analysis (EDA).
- Tableau will be used to create a dashboard (coming soon).

## Dataset
The dataset is available for download at [Link](https://www.mavenanalytics.io/data-playground)

The dataset consists of 4 CSV files
- Orders
- Order details
- Pizzas
- Pizza Types

Next, I combined the datasets and selected the specific columns that I want to include for analysis
```sql
SELECT 	order_details.order_details_id, order_details.order_id, order_details.pizza_id, order_details.quantity, 
		orders.order_date, orders.order_time, 
		pizza_types.pizza_name, pizza_types.pizza_category, pizza_types.pizza_ingredients,
		pizzas.pizza_size, pizzas.pizza_price
FROM order_details
FULL JOIN orders ON order_details.order_id = orders.order_id
FULL JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
FULL JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
```

## Summary
- Friday is the busiest day.
- July has the highest number of orders.
- Although the pizza store opens at 9, the orders spike between 12 and 13 due to it being lunchtime. After 13, the number of orders gradually declines, only to spike again between 17 and 18 during dinner hours.
- We are making a total of 23,817 pizzas during peak periods (12-13, 17-18).
- On average, we make 36 pizzas between 12 and 13.
- On average, we make 29 pizzas between 17 and 18.
- Based on pizza_id, our best selling pizza is 'big_meat_s', while our worst selling pizza is 'the_greek_xxl'.
- Based on pizza_name, our best selling pizza is 'The Classic Deluxe Pizza', while our worst selling pizza is 'The Brie Carre Pizza'.
- Based on pizza_category, our best selling pizza is 'Classic', while our worst selling pizza is 'Chicken', although the difference is not significant.
- Based on pizza_size, our best selling pizza is 'L', while our worst selling pizza is 'XXL'.
- Our average order value is 38 USD.
- Overall, Plato's Pizza is doing a good job at utilizing their tables, especially during peak hours. However, it appears that their capacity was overloaded on June 24 at 6pm.
- We made a total of 817,860.05 USD in 2015.
- It's hard to identify any clear seasonality patterns with only one year of data. However, we can observe sales spikes in early July, mid-October, and late November. These spikes in sales are potentially due to the holiday season or promotions like Black Friday.
- Top 5 ingredients that most commonly appear in pizza are garlic, tomatoes, red onions, red peppers, and mozzarella.
- There were no orders placed for The Big Meat Pizza in M and L sizes, The Five Cheese Pizza in S and M sizes, and The Four Cheese Pizza in S size.

## Dashboard
