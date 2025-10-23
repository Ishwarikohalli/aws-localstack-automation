import boto3

# LocalStack endpoint and dummy credentials
endpoint = "http://localhost:4566"
aws_access_key_id = "test"
aws_secret_access_key = "test"
region_name = "us-east-1"

# S3 client
s3 = boto3.client(
    "s3",
    endpoint_url=endpoint,
    aws_access_key_id=aws_access_key_id,
    aws_secret_access_key=aws_secret_access_key,
    region_name=region_name
)

# EC2 client
ec2 = boto3.client(
    "ec2",
    endpoint_url=endpoint,
    aws_access_key_id=aws_access_key_id,
    aws_secret_access_key=aws_secret_access_key,
    region_name=region_name
)

# IAM client
iam = boto3.client(
    "iam",
    endpoint_url=endpoint,
    aws_access_key_id=aws_access_key_id,
    aws_secret_access_key=aws_secret_access_key,
    region_name=region_name
)

print("\n S3 Buckets:")
print(s3.list_buckets())

print("\n EC2 Instances:")
print(ec2.describe_instances())

print("\n IAM Roles:")
print(iam.list_roles())


