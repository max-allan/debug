# debug

A collection of useful tools

## docker
If you want the docker daemon:
```
dockerd --host=unix:///var/run/docker.sock > /var/log/docker.log 2>&1 &
```

## ssh and s3fs

If you want to use it, change the ssh key and bucket name.

Create an ECS role for "Elastic container service task" with permissions to read/write to your s3 bucket.

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::your-bucket-name"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject",
                "s3:AbortMultipartUpload",
                "s3:ListMultipartUploadParts",
                "s3:ListBucketMultipartUploads"
            ],
            "Resource": "arn:aws:s3:::your-bucket-name/*"
        }
    ]
}
```

Create an ECS task with one container.
Use the role you created as task role, 4gb ram
Add container port 22, app protocol:none

image uri: ghcr.io/your-name/your-fork

Create a cluster.
Create a service, 
- select the task you created
- pick a VPC (maybe the one with your EKS) and public subnets
- create a security group, allow port 22 from your ip

wait for it to deploy.
click it, click config and networking tab and grab the IP