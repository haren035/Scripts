# Shell Scripting Project: Automating User Creation

## Overview
Managing users on a Linux system can be a daunting task, especially in environments where multiple users need to be created, assigned to specific groups, and given secure passwords.

## Problem Statement
Your company has recently hired several new developers, and there is a need to automate the creation of user accounts and passwords for each of them on a designated server.

### Task
As a DevOps engineer, you are required to write a Bash script that automates the user creation process based on a given text file containing employees' usernames and group names. The script should:

- Read a text file containing usernames and group names, formatted as:
  ```
  username; group1, group2
  ```
  where each line represents a user and their assigned groups (multiple groups are comma-separated).
- Create users and groups as specified in the file.
- Set up home directories with appropriate permissions and ownership.
- Generate random passwords for each user.
- Store the generated passwords securely in `/var/secure/user_passwords.csv`.
- Log all actions to `/var/log/user_management.log`.

## Solution
The workflow for this automation will involve:
1. Parsing the input text file.
2. Creating the specified groups if they do not already exist.
3. Creating users and assigning them to the specified groups.
4. Setting up home directories with correct permissions.
5. Generating and securely storing user passwords.
6. Logging all actions to facilitate auditing.

This project demonstrates effective automation using Bash scripting, improving efficiency and security in user management.

## Setting Up the Project
Before diving into creating the script itself, let's define what it needs to automate. The script should:
- Identify users and groups from the input file.
- Ensure necessary groups exist before assigning users to them.
- Create new user accounts with properly configured home directories.
- Generate and securely store random passwords.
- Maintain logs for auditing and troubleshooting.

## Usage
To execute the script, simply provide the path to the input file:
$()$(
          bash
          ./user_creation.sh employees.txt
)$()
Ensure the script has the necessary execution permissions:
$()$(
          bash
          chmod +x user_creation.sh
)$()

## Requirements
- Linux-based OS
- Root or sudo privileges
- Bash shell

## Logs & Security
- Passwords are securely stored in $(/var/secure/user_passwords.csv).
- All actions are logged in $(/var/log/user_management.log) for tracking and auditing.

## Contributions
Feel free to contribute by submitting issues or pull requests.
