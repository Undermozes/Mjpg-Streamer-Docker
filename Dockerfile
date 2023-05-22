FROM alpine:3.13

# install build tools
RUN apk update
RUN apk add git make cmake g++ linux-headers libjpeg-turbo-dev imagemagick v4l-utils-dev

# checkout mjpg-streamer
RUN git clone https://github.com/ArduCAM/mjpg-streamer.git

WORKDIR mjpg-streamer/mjpg-streamer-experimental

# build mjpg-streamer
RUN make USE_LIBV4L2=true

ENTRYPOINT ./mjpg_streamer -i "./input_uvc.so -r ${RESOLUTION:-1920x1080} -f 12 -e 5  -br ${BRIGHTNESS:-auto} -co ${CONTRAST:-50} -sh ${SHARPNESS:-60} -sa ${SATURATION:-70} -wb ${WHITE_BALANCE:-auto} -ex ${EXPOSURE:-auto}" -o "./output_http.so -w ./www"
