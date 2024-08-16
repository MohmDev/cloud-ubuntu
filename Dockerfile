FROM scratch
ADD photon-rootfs-5.0-d14ace1ec.x86_64.tar.gz /

LABEL name="Photon OS x86_64/5.0 Base Image" \
    vendor="VMware" \
    build-date="20240811"

CMD ["/bin/bash"]



RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install wget

RUN wget -qO /bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 && \
    chmod +x /bin/ttyd

EXPOSE $PORT
RUN echo $CREDENTIAL > /tmp/debug

CMD ["/bin/bash", "-c", "/bin/ttyd -p $PORT -c $USERNAME:$PASSWORD /bin/bash"]