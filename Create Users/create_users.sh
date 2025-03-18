#!/bin/bash

####################################################################################################
# Author: Haren Sah
# Version: v0.0.1
#
#
#
#
#
#
####################################################################################################

# Define the file paths for the logfile, and the password file
INPUT_FILE="$1"
LOG_FILE="/var/log/user_management.log"
PASSWORD_FILE="/var/secure/user_passwords.csv"

# Ensure script is run with root privileges
if [ "$EUID" -ne 0 ]; then
          echo "Please run this script as root or sudo privileges "
          exit 1
fi

# Check if user list file path is provided as argument
if [ $# -ne 1 ]; then
          echo "Usage: $0 <input_file>"
          exit 1
fi

# Check if user list file exists
if [ ! -f "$INPUT_FILE" ]; then
          echo "User list file '$INPUT_FILE' not found. Please check the path."
          exit 1
fi

# Function to generate logs
log_message() {
          echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >>$LOG_FILE
}

# Create the log file if it doesn't exist
if [ ! -f "$LOG_FILE" ]; then
          touch "$LOG_FILE"
          chmod 0600 "$LOG_FILE"
          log_message "Log file created: $LOG_FILE"
fi

# Create the password file if it doesn't exist
if [ ! PASSWORD_FILE ]; then
          mkdir -p /var/secure
          touch "$PASSWORD_FILE"
          chmod 0600 "$PASSWORD_FILE"
          log_message "Password file created: PASSWORD_FILE"
fi

# Function to generate a random Psuedo password
generate_password() {
          openssl rand -base64
}
