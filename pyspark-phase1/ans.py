#testing the playground
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("Assignment") \
    .getOrCreate()

customers = spark.read.format("csv") \
    .option("header", "true") \
    .load("/samples/customers.csv")

customers.show(5)
#loading the sales dataset
sales = spark.read.format("csv") \
    .option("header", "true") \
    .load("/samples/sales.csv")

sales.show(5)
#Show the columns
customers.printSchema()

sales.printSchema()

customers.show(5)
sales.show(5)
customers.printSchema()
sales.printSchema()

#converting them to the correct data types
from pyspark.sql.functions import col

sales = sales.withColumn("customer_id", col("customer_id").cast("int")) \
             .withColumn("product_id", col("product_id").cast("int")) \
             .withColumn("quantity", col("quantity").cast("int")) \
             .withColumn("total_amount", col("total_amount").cast("double"))

customers = customers.withColumn("customer_id", col("customer_id").cast("int"))

sales.printSchema()

#1. Total order amount for each customer
from pyspark.sql.functions import sum

sales.groupBy("customer_id") \
     .agg(sum("total_amount").alias("total_spend")) \
     .show()

#2. Top 3 customers by total spend
from pyspark.sql.functions import sum

sales.groupBy("customer_id") \
     .agg(sum("total_amount").alias("total_spend")) \
     .orderBy("total_spend", ascending=False) \
     .show(3)

#3. Customers with no orders
customers.join(
    sales,
    on="customer_id",
    how="left"
).filter(
    sales.customer_id.isNull()
).select(
    customers.customer_id,
    customers.first_name,
    customers.last_name
).show()

#4. City-wise total revenue
from pyspark.sql.functions import sum, round

customers.join(sales, on="customer_id") \
         .groupBy("city") \
         .agg(round(sum("total_amount"), 2).alias("total_revenue")) \
         .show()

#5. Average order amount per customer
from pyspark.sql.functions import avg, round

sales.groupBy("customer_id") \
     .agg(round(avg("total_amount"), 2).alias("average_spend")) \
     .show()

#6. Customers with more than one order
from pyspark.sql.functions import count

sales.groupBy("customer_id") \
     .agg(count("*").alias("order_count")) \
     .filter("order_count > 1") \
     .show()

#7. Sort customers by total spend descending
from pyspark.sql.functions import sum, round

sales.groupBy("customer_id") \
     .agg(round(sum("total_amount"),2).alias("total_spend")) \
     .orderBy("total_spend", ascending=False) \
     .show()
