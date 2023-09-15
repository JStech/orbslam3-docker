FROM ubuntu:18.04
RUN mkdir /tmp/runtime-orbslam &&\
  apt update &&\
  apt install -y \
  build-essential \
  cmake \
  freeglut3-dev \
  g++ \
  libavcodec-dev \
  libavdevice-dev \
  libavformat-dev \
  libavutil-dev \
  libboost-dev \
  libboost-serialization-dev \
  libc++-dev \
  libegl1-mesa-dev \
  libeigen3-dev \
  libgl1-mesa-dev \
  libglew-dev \
  libglvnd-dev \
  libgtk2.0-dev \
  libjpeg-dev \
  libpng-dev \
  libssl-dev \
  libswscale-dev \
  libwayland-dev \
  libx11-6 \
  libxext6 \
  libxkbcommon-dev \
  mesa-common-dev \
  mesa-utils\
  ninja-build \
  unzip \
  vim \
  wayland-protocols \
  libglu1-mesa-dev \
  wget

RUN wget -O opencv.zip https://github.com/opencv/opencv/archive/4.4.0.zip &&\
  wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.4.0.zip &&\
  wget -O pangolin.zip https://github.com/stevenlovegrove/Pangolin/archive/refs/tags/v0.8.zip &&\
  wget -O orb_slam3.zip https://github.com/UZ-SLAMLab/ORB_SLAM3/archive/refs/tags/v1.0-release.zip
RUN unzip opencv.zip &&\
  unzip opencv_contrib.zip &&\
  mkdir opencv-4.4.0/build && cd opencv-4.4.0/build &&\
  cmake .. -DCMAKE_BUILD_TYPE=RELEASE &&\
  make && make install
RUN unzip pangolin.zip &&\
  mkdir Pangolin-0.8/build && cd Pangolin-0.8/build &&\
  cmake .. -DCMAKE_BUILD_TYPE=RELEASE &&\
  make && make install
RUN unzip orb_slam3.zip &&\
  cd ORB_SLAM3-1.0-release &&\
  chmod +x build.sh &&\
  ./build.sh
ENV XDG_RUNTIME_DIR /tmp/runtime-orbslam
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute
