FROM alpine:3.9.2
MAINTAINER Jayme Anchante <jayme.anchante@disroot.org>

RUN apk update\
 && apk add git py3-pip mpv\
 && pip3 install --upgrade pip\
 && pip3 install youtube-dl\
 && pip3 install -U git+https://github.com/mps-youtube/mps-youtube.git
ENTRYPOINT ["mpsyt"]
