#!/bin/sh

echo "Starting deployment to staging..."

# Assign command line arguments to variables
SERVER_USERNAME=$1
SERVER_PASSWORD=$2
SERVER_HOST=$3
SERVER_PORT=$4
SSH_PRIVATE_KEY=$5

# Write the private key to a file and secure it
echo "$SSH_PRIVATE_KEY" > private_key
chmod 600 private_key

echo "SERVER_USERNAME: $SSH_PRIVATE_KEY"

# Use rsync to deploy the files
rsync -avz --delete -e "ssh -i private_key -o StrictHostKeyChecking=no -p $SERVER_PORT" ./ $SERVER_USERNAME@$SERVER_HOST:/path/to/deployment

# Clean up the private key file
rm private_key

echo "Deployment to staging completed."
