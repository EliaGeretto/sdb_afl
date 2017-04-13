#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

EXECUTABLE=sdb_asan
MINIMIZED_PATH=minimized

COUNT=0
for CRASH in $MINIMIZED_PATH/id*
do
	./$EXECUTABLE - < $CRASH &> /dev/null
	EXIT=$?

	echo -n "$CRASH: "
	if [ $EXIT == 1 ]
	then
		COUNT=$((COUNT + 1))
		echo -e "${RED}fail${NC}"
	else
		echo -e "${GREEN}pass${NC}"
	fi
done

echo
echo "$COUNT errors found."
