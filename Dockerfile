FROM alpine:3.13

# install build tools
RUN apk update
RUN apk add git make cmake g++ linux-headers libjpeg-turbo-dev imagemagick v4l-utils-dev

# checkout mjpg-streamer
RUN git clone https://github.com/ArduCAM/mjpg-streamer.git

WORKDIR mjpg-streamer/mjpg-streamer-experimental

# build mjpg-streamer
RUN make USE_LIBV4L2=true

ENTRYPOINT ./mjpg_streamer -i "./input_uvc.so -r ${RESOLUTION:-1920x1080}" -o "./output_http.so -w ./www" -br ${BRIGHTNESS:-auto} -co ${CONTRAST:-} -sh ${SHARPNESS:-} -sa ${SATURATION:-} -cb ${COLOR_BALANCE:-} -wb ${WHITE_BALANCE:-} -ex ${EXPOSURE:-} -bk ${BACKLIGHT_COMPENSATION:-} -rot ${ROTATION:-} -hf ${HORIZONTAL_FLIP:-false} -vf ${VERTICAL_FLIP:-false} -pl ${POWER_LINE_FILTER:-disabled} -gain ${GAIN:-auto} -cagc ${CHROMA_GAIN_CONTROL:-} --fps ${FRAMES_PER_SECOND:-}
