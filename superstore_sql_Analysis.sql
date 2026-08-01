--Business Question 1:
--Which category generates the highest profits?
select Category ,sum(Profit) as Total_profit from superstore
group by Category order by Total_profit DESC

--Business Question 2:
--Do large discounts lead to increased profits?
select Discount ,sum(Profit) as Total_profit,
avg(profit) as avg_profit,count(*) as Number_of_orders
from superstore
group by Discount order by Discount;

--Business Question 3:
--What Sub_Category achieve high sales but low profits?
select Sub_category , sum(sales) as Total_sales ,
sum(Profit) as Total_profit
from superstore
group by Sub_category order by Total_sales DESC,Total_profit ASC;

--Business Question 4:
--Which Ship Mode achieves the highest profit?
select Ship_Mode , sum(Profit) as Total_profit
from superstore
group by Ship_Mode order by Total_Profit DESC;

--Business Question 5:
-- Which categories have total sales greater than 500000?
select category,sum(sales) as Total_sales
from superstore
group by category 
Having sum(sales)>500000
order by Total_sales DESC;

--Business Question 6:
--Which state is the most profitable?
select Top 10
State ,sum(profit) as Total_profit
from superstore
group by state order by Total_profit DESC;

--Business Question 7:
--Which Segment is the best in terms of profitability?
select Top 1
segment,sum(profit) as Total_profit
from superstore
group by segment order by Total_profit DESC;

--Besiness Question 8:
-- What is the Sub_category classification based on profitability?
select
  Sub_category , sum(profit) as Total_profit,
  case
    when sum(profit)>1000 then 'High profit'
    when sum(profit)>0 then 'Medium profit'
    else 'Loss'
  end as profit_category
from superstore
group by Sub_category order by Total_profit DESC;
