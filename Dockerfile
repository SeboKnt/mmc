FROM alpine:latest

RUN apk update && apk add \
    git make cmake libstdc++ gcc g++ libuv-dev openssl-dev hwloc-dev && \
    rm -rf /var/cache/apk/*
RUN git clone https://github.com/xmrig/xmrig
RUN chmod -R 777 /xmrig
RUN adduser -D miner
USER miner
WORKDIR /xmrig
RUN mkdir build
RUN cmake build/.. && make -j$(nproc)
#CMD .xmrig/build/xmrig -o gulf.moneroocean.stream:10128 -u 42oBjqSdYUzgRVSj3SZrXF6vUCi1hrG8sNZ3ZA24QbVCS4VQwAmY6TFinzbw1ybyrRUa59zRhcLPfa3B8rLwuybA3CZi39B
CMD /bin/sh -c "while true; do sleep 60; done"