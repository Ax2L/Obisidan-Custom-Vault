#!/bin/bash

# Get the hostname from the environment variable
HOSTNAME_ENV=$HOSTNAME

# Define the directory where the content is stored
DIR=".obsidian/$HOSTNAME_ENV"

# Copy the .json files back to the original directory
cp $DIR/*.json .obsidian/

# Copy the plugins back to the original directory
cp -r $DIR/plugins .obsidian/