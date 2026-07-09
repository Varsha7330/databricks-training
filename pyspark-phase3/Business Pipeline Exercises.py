
#Business Pipeline Exercises
#1. Read sales data -> clean nulls -> calculate daily sales

from pyspark.sql.functions import sum, round

clean_sales = sales.dropna(subset=["customer_id"])

clean_sales.groupBy("sale_date") \
    .agg(round(sum("total_amount"),2).alias("daily_sales")) \
    .show()

#2. Read customer data -> clean invalid rows -> city-wise revenue
from pyspark.sql.functions import sum, round

customers.dropna(subset=["customer_id"]) \
    .join(sales,"customer_id") \
    .groupBy("city") \
    .agg(round(sum("total_amount"),2).alias("total_revenue")) \
    .show()

#3. Find repeat customers (>2 orders)
from pyspark.sql.functions import count

sales.groupBy("customer_id") \
    .agg(count("*").alias("order_count")) \
    .filter("order_count > 2") \
    .show()

#4. Find highest spending customer in each city
from pyspark.sql.functions import sum, row_number
from pyspark.sql.window import Window

customer_spend = customers.join(sales, "customer_id") \
    .groupBy("city", "customer_id", "first_name") \
    .agg(sum("total_amount").alias("total_spend"))

windowSpec = Window.partitionBy("city").orderBy(customer_spend.total_spend.desc())

customer_spend.withColumn("rank", row_number().over(windowSpec)) \
    .filter("rank = 1") \
    .show()

#5. Build final reporting table with customer, city, total spend, order count
from pyspark.sql.functions import sum, count, round

customers.join(sales, "customer_id") \
    .groupBy("customer_id", "first_name", "city") \
    .agg(
        round(sum("total_amount"),2).alias("total_spend"),
        count("sale_id").alias("order_count")
    ) \
    .show()
