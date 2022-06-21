FROM debian:latest
RUN apt-get update && apt-get install curl gnupg2 -y && \
curl https://mega.nz/linux/MEGAsync/Debian_11/amd64/megacmd_1.5.1-1.1_amd64.deb --output megacmd.deb && \
echo path-include /usr/share/doc/megacmd/* > /etc/dpkg/dpkg.cfg.d/docker && \
apt install ./megacmd.deb -y && \
apt remove -y curl && \
apt clean

COPY entrypoint.sh entrypoint.sh

ENV USERNAME NOBODY
ENV PASSWORD CHANGEME
ENV MEGACMD mega-put

ENTRYPOINT bash ./entrypoint.sh
CMD /bin/bash
