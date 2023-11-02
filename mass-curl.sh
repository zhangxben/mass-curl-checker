#!/bin/sh

EXPECTED=$(cat "expected.txt")
URLCOUNT=$(wc -l "expected.txt")

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
echo "__________________________ \n"
LINETESTCOUNT=0
ERRORCOUNT=0
FAILEDURLS=""

while IFS="" read -r p || [ -n "$p" ]
do
	URLTOTEST="$p"
	RESULT=$(curl "$URLTOTEST")
	LINETESTCOUNT=$((LINETESTCOUNT+1))

	if [[ "$RESULT" != "$EXPECTED" ]] 
	then
	echo "__________________________"
	echo "\nMISMATCH:\n"
	echo "URL: $p"
	echo "RESULT: $RESULT"
	echo "__________________________\n"
	ERRORCOUNT=$((ERRORCOUNT+1))
	FAILEDURLS="$FAILEDURLS\n$p"
	fi
done < urls.txt

echo "\n\n__________________________"
echo "\nMASS CURL RESULTS"
echo "__________________________\n"
echo "Lines Tested: $LINETESTCOUNT"
echo "Non-matching responses: $ERRORCOUNT"
echo "Failed URLS:\n$FAILEDURLS"
