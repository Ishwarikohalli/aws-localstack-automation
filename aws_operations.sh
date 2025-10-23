#!/bin/bash

# Disable AWS CLI paging to avoid 'more' errors on Windows
export AWS_PAGER=""

# LocalStack credentials
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1

ENDPOINT_URL="http://localhost:4566"

echo "Creating S3 bucket..."
aws --endpoint-url=$ENDPOINT_URL s3 mb s3://my-test-bucket

echo "Uploading a file to S3..."
echo "Hello, LocalStack!" > test.txt
aws --endpoint-url=$ENDPOINT_URL s3 cp ./test.txt s3://my-test-bucket/test.txt --no-verify-ssl

echo "Launching EC2 instance..."
aws --endpoint-url=$ENDPOINT_URL ec2 run-instances \
  --image-id ami-12345678 \
  --count 1 \
  --instance-type t2.micro \
  --key-name my-key

echo "Creating IAM role..."
aws --endpoint-url=$ENDPOINT_URL iam create-role \
  --role-name MyTestRole \
  --assume-role-policy-document '{
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Principal": { "Service": "ec2.amazonaws.com" },
      "Action": "sts:AssumeRole"
    }]
  }'

echo "✅ All operations completed successfully!"

