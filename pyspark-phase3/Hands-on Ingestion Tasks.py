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

#find missing values
from pyspark.sql.functions import col,isnull

customers.filter(col("customer_id").isNull()).show()

#check every column seperately
customers.filter(col("city").isNull()).show()

#Remove missing values
customers = customers.dropna()
#Remove NULL only from one column
customers = customers.dropna(subset=["customer_id"])
#Fill Missing Values
customers.fillna("Unknown")
#Filter Invalid Records
from pyspark.sql.functions import col

customers.filter(col("city").isNotNull()).show()
#Reading JSON
json_df = spark.read \
    .option("multiline", "true") \
    .json("/samples/products.json")

json_df.printSchema()
json_df.show()

#Reading Parquet
parquet_df = spark.read.parquet("/samples/titanic.parquet")

parquet_df.show()
