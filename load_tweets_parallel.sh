#!/bin/sh

files=$(find data/*)

echo '================================================================================'
echo 'load pg_denormalized'
echo '================================================================================'
echo "$files" | time parallel ./load_denormalized.sh

echo '================================================================================'
echo 'load pg_normalized'
echo '================================================================================'
echo "$files" | time parallel python3 load_tweets.py --db=postgresql://postgres:pass@localhost:1447 --inputs "$file"

echo '================================================================================'
echo 'load pg_normalized_batch'
echo '================================================================================'
# time echo "$files" | parallel python3 -u load_tweets_batch.py --db=postgresql://postgres:pass@localhost:1457/ --inputs $file
