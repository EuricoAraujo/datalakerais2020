from pyspark.sql import SparkSession 

spark = SparkSession.builder.getOrCreate()

# Leitura de dados
rais = (
    spark.read.format("csv")
    .option("inferSchema", True)
    .option("header", True)
    .option("delimiter", ";")
    .load("s3://datalake-eurico-atv1/rawdata/")
)

# Escreve a tabela em staging em formato parquet
print("Writing delta table...")
(
    rais
    .write
    .mode("overwrite")
    .format("parquet")
    .partitionBy("year")
    .save("s3://datalake-eurico-atv1/prata/")
)
