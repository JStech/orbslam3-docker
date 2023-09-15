#!/bin/bash
docker run \
  --gpus all \
  -e DISPLAY=${DISPLAY} \
  -e QT_X11_NO_MITSHM=1 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/.Xauthority:/root/.Xauthority \
  -v $HOME/om/euroc:/root/data \
  -it orbslam3:latest \
  /bin/bash
