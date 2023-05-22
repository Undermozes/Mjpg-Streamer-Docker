# What is mjpg-streamer?

[mjpg-streamer](https://sourceforge.net/projects/mjpg-streamer/) is a command line application that copies JPEG frames from one or more input plugins to multiple output plugins. It can be used to stream JPEG files over an IP-based network from a webcam to various types of viewers such as Chrome, Firefox, Cambozola, VLC, mplayer, and other software capable of receiving MJPG streams.

It was originally written for embedded devices with very limited resources in terms of RAM and CPU. Its predecessor "uvc_streamer" was created because Linux-UVC compatible cameras directly produce JPEG-data, allowing fast and perfomant M-JPEG streams even from an embedded device running OpenWRT. The input module "input_uvc.so" captures such JPG frames from a connected webcam. mjpg-streamer now supports a variety of different input devices.

# How to use this image

## Start a mjpg-streamer instance

```
docker run -d \
  --name mjpg-streamer \
  --privileged \
  -v /dev/video0:/dev/video0 \
  -p 8080:8080 \
  - **`-e RESOLUTION="1280x720" \
  - **`-e BRIGHTNESS="50" \
  - **`-e CONTRAST="70" \
  - **`-e SHARPNESS="80" \
  - **`-e SATURATION="60" \
  - **`-e COLOR_BALANCE="50" \
  - **`-e WHITE_BALANCE="auto" \
  - **`-e EXPOSURE="auto" \
  - **`-e BACKLIGHT_COMPENSATION="on" \
  - **`-e ROTATION="0" \
  - **`-e HORIZONTAL_FLIP="false" \
  - **`-e VERTICAL_FLIP="false" \
  - **`-e POWER_LINE_FILTER="enabled" \
  - **`-e GAIN="auto" \
  - **`-e CHROMA_GAIN_CONTROL="" \
  - **`-e FRAMES_PER_SECOND="30" \
  --restart always \
  undermozes/mjpg-streamer

```

- **`--privileged`**  
  is necessary vor mjpg-streamer to match Container intern user rights to Host user rights
- **`-v /dev/video0:/dev/video0`**  
  mounts a video device from host into this container
- **`-p 8080:8080`**  
  binds the host port '8080' to the coinainers internal port '8080'. mjpg-streamer is listening by default on port '8080' inside the container
- **`-e RESOLUTION="1280x720"`**  
  if present, mjpg-streamer will stream with this resolution. else it will stream with 1920x1080
- **`--restart always`**  
  restarts the container always as long as the user doesn't shut's it down

- **`-e BRIGHTNESS="50"`**  
Sets the brightness level to 50. This parameter adjusts the brightness of the video stream.

- **`-e CONTRAST="70"`**  
Sets the contrast level to 70. This parameter adjusts the contrast of the video stream.

- **`-e SHARPNESS="80"`**  
Sets the sharpness level to 80. This parameter adjusts the sharpness of the video stream.

- **`-e SATURATION="60"`**  
Sets the saturation level to 60. This parameter adjusts the saturation of the video stream.

- **`-e COLOR_BALANCE="50"`**  
Sets the color balance to 50. This parameter adjusts the color balance of the video stream.

- **`-e WHITE_BALANCE="auto"`**  
Sets the white balance mode to "auto". This parameter automatically adjusts the white balance of the video stream.

- **`-e EXPOSURE="auto"`**  
Sets the exposure mode to "auto". This parameter automatically adjusts the exposure of the video stream.

- **`-e BACKLIGHT_COMPENSATION="on"`**  
Enables the backlight compensation feature. This parameter compensates for backlighting in the video stream.

- **`-e ROTATION="0"`**  
Sets the rotation angle to 0 degrees. This parameter rotates the video stream by the specified angle.

- **`-e HORIZONTAL_FLIP="false"`**  
Disables horizontal flipping of the video stream. This parameter prevents the video from being horizontally mirrored.

- **`-e VERTICAL_FLIP="false"`**  
Disables vertical flipping of the video stream. This parameter prevents the video from being vertically mirrored.

- **`-e POWER_LINE_FILTER="enabled"`**  
Enables the power line filter. This parameter filters out power line interference from the video stream.

- **`-e GAIN="auto"`**  
Sets the gain mode to "auto". This parameter automatically adjusts the gain of the video stream.

- **`-e CHROMA_GAIN_CONTROL=""`**  
This parameter controls the chroma gain of the video stream. The value is not specified in the given command.

- **`-e FRAMES_PER_SECOND="30"`**  
Sets the frame rate to 30 frames per second. This parameter determines the number of frames captured and streamed per second.

## Webinterface

mjpg-streamer includes a webinterface that is available under this URL:

```
http://localhost:8080
```

## Raw stream and snapshot URL's

To access the stream open this URL:

```
http://localhost:8080/?action=stream
```

To get a single JPEG just open this URL:

```
http://localhost:8080/?action=snapshot
```
