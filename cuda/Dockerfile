FROM nvidia/cuda:12.6.2-devel-ubuntu22.04

# Установка необходимых зависимостей
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    pkg-config \
    git \
    yasm \
    nasm \
    cmake \
    libtool \
    libc6-dev \
    unzip \
    wget \
    libpng-dev \
    zlib1g-dev \
    libfreetype6-dev \
    libfontconfig1-dev \
    && rm -rf /var/lib/apt/lists/*

# Установка nv-codec-headers
RUN mkdir -p /tmp/ffmpeg_sources && \
    cd /tmp/ffmpeg_sources && \
    git clone https://github.com/FFmpeg/nv-codec-headers.git && \
    cd nv-codec-headers && \
    make && \
    make install

# Клонирование исходников FFmpeg и сборка с поддержкой GPU
RUN mkdir -p /tmp/ffmpeg_sources && \
    cd /tmp/ffmpeg_sources && \
    git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg && \
    cd ffmpeg && \
    ./configure \
        --prefix="/usr/local" \
        --pkg-config-flags="--static" \
        --extra-cflags="-I/usr/local/include -I/usr/local/cuda/include" \
        --extra-ldflags="-L/usr/local/lib -L/usr/local/cuda/lib64" \
        --extra-libs="-lpthread -lm" \
        --bindir="/usr/local/bin" \
        --enable-cuda-nvcc \
        --enable-cuvid \
        --enable-nvenc \
        --enable-libnpp \
        --enable-gpl \
        --enable-nonfree  \
        --enable-decoder=png \
        --enable-decoder=png_pipe \
        && \
    make -j$(nproc) && \
    make install && \
    rm -rf /tmp/ffmpeg_sources

WORKDIR /app
