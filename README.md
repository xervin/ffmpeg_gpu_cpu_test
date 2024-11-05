## CPU/GPU ffmpeg тест

Для тестирования конвертации видео

### git pull ...
#### Native

1. cd native
2. docker compose build && docker compose up
3. Информация о времени в консоли

#### Cuda
1. cd cuda
2. docker compose build && docker compose up
3. Информация о времени в консоли

### Возможно потребуется наличие на хосте драйверов CUDA

* https://docs.nvidia.com/cuda/wsl-user-guide/index.html#getting-started-with-cuda-on-wsl
* https://docs.nvidia.com/video-technologies/video-codec-sdk/12.1/ffmpeg-with-nvidia-gpu/index.html

### ! Образ занимает ~ 12 Гб