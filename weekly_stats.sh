#!/bin/bash

echo $(tail -7 synthetic_historical_fc_accuracy.tsv | cut -f6) > scratch.txt

week_fc=($(echo $(cat scratch.txt)))

# Validate result
for i in {0..6}; do
    echo ${week_fc[$i]}
done

# Convert negative values to positive
for i in {0..6}
do
    if [[ ${week_fc[$i]} -lt 0 ]]
    then
        week_fc[$i]=$(((-1)*week_fc[$i]))
    fi
done

# Find minimum and maximum
minimum=${week_fc[0]}
maximum=${week_fc[0]}

for item in ${week_fc[@]}
do
    if [[ $minimum -gt $item ]]
    then
        minimum=$item
    fi

    if [[ $maximum -lt $item ]]
    then
        maximum=$item
    fi
done

echo "minimum absolute error = $minimum"
echo "maximum absolute error = $maximum"

