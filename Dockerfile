# Build stage
FROM alpine:latest AS build

RUN apk update && apk add \
    git make cmake libstdc++ gcc g++ libuv-dev openssl-dev hwloc-dev
RUN git clone https://github.com/xmrig/xmrig
RUN chmod -R 777 /xmrig
WORKDIR /xmrig
RUN cmake . && make -j$(nproc)

# Final stage
FROM alpine:latest

RUN apk add --no-cache libuv hwloc
RUN adduser -D miner
USER miner
WORKDIR /home/miner
COPY --from=build /xmrig/xmrig .
CMD ./xmrig -o ${POOL_ADDRESS} -u ${USER_ADDRESS}