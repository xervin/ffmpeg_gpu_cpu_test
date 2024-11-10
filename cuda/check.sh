#!/bin/bash

# Без вотермарки
START_TIME=$(date +%s)

ffmpeg -hwaccel cuda -i ./data/test.flv -codec:v h264_nvenc -preset p4 -codec:a aac -strict -2 -f mp4 -movflags faststart -y ./wm_disable_$(date +%s).mp4

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
echo -e "\n==========================\n"
echo -e "Время выполнения без вотермарки: ${DURATION} секунд \n"
echo -e "\n==========================\n"

# С вотермаркой
START_TIME=$(date +%s)

ffmpeg -hwaccel cuda -i ./data/test.flv -loop 1 -i ./data/logo.png \
  -filter_complex_script ./data/filter_cuda.txt \
  -map "[outv]" -map "0:a?" \
  -codec:v h264_nvenc -preset p4 -codec:a aac -strict -2 -f mp4 -movflags faststart -y ./wm_enable_$(date +%s).mp4

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
echo -e "\n==========================\n"
echo -e "Время выполнения с вотермаркой: ${DURATION} секунд"
echo -e "\n==========================\n"
