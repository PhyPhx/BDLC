#!/usr/bin/env bash

year=2021

mkdir -p ./$year
hdfs dfs -mkdir -p /taxi/raw/$year

for month in {05..12}; do
    year_date=$year-$month
    file=yellow_tripdata_${year_date}.parquet
    url=https://d37ci6vzurychx.cloudfront.net/trip-data/${file}

    echo "Downloading $file"

    curl -L --fail \
        -A "Mozilla/5.0" \
        "$url" \
        -o ./$year/$file

    if [ $? -eq 0 ] && [ -s ./$year/$file ]; then
        echo "Upload to HDFS: $file"
        hdfs dfs -Ddfs.replication=1 -put -f ./$year/$file /taxi/raw/$year/
    else
        echo "FAILED or empty: $file"
        rm -f ./$year/$file
    fi

    echo "----------------------------------------"
done
