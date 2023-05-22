#!/bin/bash

# Check if the required arguments are provided
if [ $# -eq 0 ]; then
    echo "Usage: ./checkpoint-friewall-enum.sh <ip_list_file>"
    exit 1
fi

# Read the IP list file
ip_list_file="$1"
if [ ! -f "$ip_list_file" ]; then
    echo "IP list file not found: $ip_list_file"
    exit 1
fi

# Loop over each IP address in the list
while IFS= read -r ip; do
    timeout 3s bash -c "printf '\x51\x00\x00\x00\x00\x00\x00\x21\x00\x00\x00\x0bsecuremote\x00' | nc -q 1 "$ip" 2>
done < "$ip_list_file"

