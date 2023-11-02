#!/bin/bash

EXPECTED=$(cat "expected.txt")
URLCOUNT=$(wc -l "urls.txt")

cat <<EOF
    __  ______   __________    ________  ______  __ 
   /  |/  /   | / ___/ ___/   / ____/ / / / __ \/ / 
  / /|_/ / /| | \__ \\__ \   / /   / / / / /_/ / /  
 / /  / / ___ |___/ /__/ /  / /___/ /_/ / _, _/ /___
/_/  /_/_/  |_/____/____/   \____/\____/_/ |_/_____/
                                                    
EOF
echo "Contact Ben Zhang for questions."
echo "__________________________"
echo "EXPECTED IS: $EXPECTED"
echo "URLS TO TEST: $URLCOUNT"
echo "__________________________"
LINETESTCOUNT=0
ERRORCOUNT=0
FAILEDURLS=""

while IFS="" read -r p || [ -n "$p" ]
do
	URLTOTEST="$p"
	RESULT=$(curl $URLTOTEST)
	LINETESTCOUNT=$((LINETESTCOUNT+1))

	if  [[ "$RESULT" != "$EXPECTED" ]]
	then
	echo "__________________________"
	echo 'MISMATCH:'
	echo "URL: $p"
	echo "RESULT: $RESULT"
	echo "__________________________"
	ERRORCOUNT=$((ERRORCOUNT+1))
	FAILEDURLS=("$FAILEDURLS, $p")
	fi
done < urls.txt

echo "__________________________"
echo "MASS CURL RESULTS"
echo "__________________________"
echo "Lines Tested: $LINETESTCOUNT"
echo "Non-matching responses: $ERRORCOUNT"
if [[ $ERRORCOUNT > 0 ]]
then
	echo "Failed URLs: $FAILEDURLS"
fi