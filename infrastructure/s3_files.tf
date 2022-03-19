resource "aws_s3_bucket_object" "etl" {
  bucket = aws_s3_bucket.datalake-eurico-atv1.id
  key = "emr-code/pyspark/etl.py"
  source = "../etl/etl.py"
  etag = filemd5("../etl/etl.py")
}

resource "aws_s3_bucket_object" "lambda" {
  bucket = aws_s3_bucket.datalake-eurico-atv1.id
  key = "emr-code/lambdafunctions/lambda_function.py"
  source ="../etl/lambda_function.py"
  etag = filemd5("../etl/lambda_function.py")
}