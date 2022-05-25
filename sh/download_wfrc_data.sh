#!/bin/bash

### Downloads wfrc input csvs from box repository ###

# Remove old files, if present
if [[ -d "data/wfrc" ]]; then
	echo "Files already found. Deleting old files..."
	rm -rf data/wfrc
	echo "Old files deleted. Downloading new files..."
else
	echo "No local data files found. Downloading files..."
fi

# Gets wfrc data from box repository
wget https://byu.box.com/shared/static/8652xtqi4i4zxj0xjrw0k40kstog45hw.zip
mv 8652xtqi4i4zxj0xjrw0k40kstog45hw.zip wfrc.zip

# Unzip and put in the right spot
unzip -d data wfrc.zip
mv wfrc.zip data/wfrc/wfrc.zip
