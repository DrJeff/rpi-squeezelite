FROM resin/rpi-raspbian:jessie

MAINTAINER drjeff

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    usbutils \
    libflac-dev \
    libfaad2  \
    libmad0 \
    libasound2-dev \
    libasound2 \
    libasound2-data \
    wget

RUN wget -O squeezelite-armv6hf http://ralph_irving.users.sourceforge.net/pico/squeezelite-armv6hf-noffmpeg

RUN chmod a+x squeezelite-armv6hf-noffmpeg

CMD /squeezelite-armv6hf-noffmpeg -o $SOUNDDEVICE -s $SERVER -n $CLIENTNAME -m $CLIENTMAC
