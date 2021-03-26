FROM bckmd/docker-ubuntu-vnc:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt update -y
RUN apt upgrade -y
RUN apt install rxvt-unicode i3 dmenu -y
RUN apt-get autoclean && apt-get autoremove

RUN mkdir -p /home/${DESKTOP_USERNAME}/.config/i3/
RUN cp /etc/i3/config.keycodes /home/${DESKTOP_USERNAME}/.config/i3/config

COPY supervisord-i3.conf /etc/supervisor/conf.d/supervisord-i3.conf