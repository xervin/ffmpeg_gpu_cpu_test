#!/bin/bash

# Без вотермарки
START_TIME=$(date +%s)

ffmpeg -i ./data/test.flv -codec:v h264 -codec:a aac -strict -2 -f mp4 -movflags faststart -y ./$(date +%s).mp4

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
echo -e "\n==========================\n"
echo -e "Время выполнения без вотермарки: ${DURATION} секунд \n"
echo -e "\n==========================\n"

START_TIME=$(date +%s)

# С вотермаркой
START_TIME=$(date +%s)
ffmpeg -i ./data/test.flv -loop 1 -i ./data/logo.png -filter_complex_script ./data/filter_script.txt -codec:v h264 -codec:a aac -strict -2 -f mp4 -movflags faststart -y ./$(date +%s).mp4

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
echo -e "\n==========================\n"
echo -e "Время выполнения с вотермаркой: ${DURATION} секунд"
echo -e "\n==========================\n"
