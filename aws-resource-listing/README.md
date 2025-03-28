# AWS Resource Listing Script

## About

This script provides a **quick and automated way** to list AWS resources such as:

✅ EC2 Instances\
✅ S3 Buckets\
✅ IAM Users\
✅ Lambda Functions

It verifies **AWS CLI installation, configuration, and authentication** before executing.

---

## Features

✔️ Supports multiple AWS services (`ec2`, `s3`, `iam`, `lambda`)\
✔️ Ensures AWS CLI is installed & authenticated before execution\
✔️ Displays AWS Account ID before execution\
✔️ Handles invalid inputs gracefully\
✔️ Structured output using AWS CLI `--query`

---

## Prerequisites

Before using this script, ensure the following:

1️⃣ **AWS CLI Installed** → [Install AWS CLI](https://aws.amazon.com/cli/)\
2️⃣ **AWS CLI Configured** → Run:

```sh
aws configure
```

3️⃣ **Bash Installed** (For Windows users, use Git Bash or WSL)

---

## Installation: Clone This Repository

To clone this repository to your local machine, run:

```sh
git clone https://github.com/your-username/aws-resource-listing.git
cd aws-resource-listing
```

---

## How to Run the Script

### 1️⃣ Give Execute Permission (First-Time Only)

```sh
chmod +x aws_resource_list.sh
```

### 2️⃣ Run the Script

The script requires two arguments:

- **AWS Region** (e.g., `us-east-1`)
- **AWS Service** (`ec2`, `s3`, `iam`, `lambda`)

🔹 **Example: List EC2 Instances**

```sh
./aws_resource_list.sh us-east-1 ec2
```

🔹 **Example: List S3 Buckets**

```sh
./aws_resource_list.sh ap-southeast-2 s3
```

---

## Expected Output

### ✅ EC2 Example Output

```
Running script under AWS Account: 123456789012
Listing EC2 Instances in us-east-1
```

| InstanceId          | State   |
| ------------------- | ------- |
| i-0abcd1234efgh5678 | running |
| i-09xyz9876lmn5432  | stopped |

---

### ✅ S3 Example Output

```
Running script under AWS Account: 123456789012
Listing S3 Buckets
```

| Bucket Name             |
| ----------------------- |
| my-company-logs         |
| dev-environment-storage |
| backup-2024             |

---
