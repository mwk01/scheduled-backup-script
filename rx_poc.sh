#! /bin/bash

# Assign city name as Casablanca
city=Casablanca

# Obtain the weather report for Casablanca
curl -s wttr.in/$city?T --output weather_report

# Extract current temperature
obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')
echo "The current Temperature of $city: $obs_temp"

# Extract forecast temperature for noon tomorrow
fc_temp=$(curl -s wttr.in/$city?T | head -23 | tail -1 | grep -oE '[0-9]+\([0-9]+\) °F' | sed -n '2p' | grep -oE '^[0-9]+')
echo "The forecasted temperature for noon tomorrow for $city : $fc_temp F"

# Assign Country and City to variable TZ
TZ='Morocco/Casablanca'

# Store current day, month, and year
day=$(TZ='Morocco/Casablanca' date -u +%d)
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y)

# Create record and append it to the log
record=$(echo -e "$year\t$month\t$day\t$obs_temp\t$fc_temp F")
echo "$record" >> rx_poc.log
