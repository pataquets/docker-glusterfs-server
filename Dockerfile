FROM pataquets/glusterfs:3.6

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y glusterfs-server \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "glusterd", "--no-daemon", "--log-file=-", "-p", "/var/run/glusterd.pid" ]
