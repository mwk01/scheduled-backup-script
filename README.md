# Historical Weather Forecast Accuracy

## Overview

A Bash-based ETL proof-of-concept that collects daily weather data for Casablanca, Morocco, compares forecasted temperatures with actual temperatures, and reports historical forecasting accuracy.

## Project Objectives

- Extract weather data using `curl` from wttr.in
- Extract observed and forecasted temperatures
- Transform the data into a tab-delimited format
- Load daily results into log files
- Calculate historical forecast accuracy
- Classify forecast accuracy as excellent, good, fair, or poor
- Calculate weekly minimum and maximum absolute forecasting errors
- Schedule the weather collection process using `cron`

## Project Structure

| File | Description |
|---|---|
| `rx_poc.sh` | Downloads and extracts Casablanca weather data |
| `rx_poc.log` | Stores daily weather observations and forecasts |
| `fc_accuracy.sh` | Calculates forecast accuracy |
| `historical_fc_accuracy.tsv` | Stores historical forecast accuracy |
| `weekly_stats.sh` | Calculates weekly minimum and maximum errors |
| `scratch.txt` | Temporary file used during weekly analysis |

## ETL Workflow

```text
Weather Data (wttr.in)
        |
        v
      curl
        |
        v
Extract weather data
        |
        v
Transform into tab-delimited records
        |
        v
     rx_poc.log
        |
        v
Calculate forecast accuracy
        |
        v
historical_fc_accuracy.tsv
        |
        v
Weekly statistics
