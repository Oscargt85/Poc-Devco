#/bin/bash

bucketName=$1
bucketExists=$(aws s3api list-buckets --query "Buckets[?Name == '$bucketName']" --output text)

if [[ $bucketExists ]]; then 
    echo "El bucket $bucketName ya existe" 
    exit 0
else
    echo "Creando bucket $bucketName" 
    aws s3api create-bucket --bucket $bucketName --acl private --region us-east-1
fi