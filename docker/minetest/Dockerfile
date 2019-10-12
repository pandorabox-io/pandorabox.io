FROM ubuntu:19.10


ENV ENGINE_BRANCH=pandorabox
ENV ENGINE_REPO=https://github.com/pandorabox-io/minetest.git
ENV GAME_BRANCH=5.1.0
ENV GAME_REPO=https://github.com/minetest/minetest_game.git


# https://github.com/minetest/minetest
RUN apt-get update &&\
 apt-get install -y build-essential libirrlicht-dev cmake libbz2-dev libpng-dev libjpeg-dev libsqlite3-dev libcurl4-openssl-dev \
	zlib1g-dev libgmp-dev libjsoncpp-dev git libluajit-5.1-dev lua5.1 \
	libjsoncpp-dev libgmp-dev postgresql-server-dev-all postgresql-client libspatialindex5 libspatialindex-dev

RUN mkdir /git

# prometheus stuff
RUN cd /git && git clone https://github.com/jupp0r/prometheus-cpp -b v0.7.0 &&\
 cd prometheus-cpp &&\
 git submodule init &&\
 git submodule update &&\
 mkdir _build && cd _build &&\
 cmake .. -DBUILD_SHARED_LIBS=ON &&\
 make -j4 &&\
 make install &&\
 cp /usr/local/lib/libprometheus-cpp-*.so /lib/x86_64-linux-gnu &&\
 cp /usr/local/lib/libprometheus-cpp-*.so /lib/x86_64-linux-gnu/

# minetest
RUN cd /git && git clone ${ENGINE_REPO} -b ${ENGINE_BRANCH} &&\
 cd /git/minetest/ && git clone --depth 1 ${GAME_REPO} games/minetest_game -b ${GAME_BRANCH} &&\
 cmake . \
	-DCMAKE_INSTALL_PREFIX=/usr/local\
	-DCMAKE_BUILD_TYPE=Release\
	-DRUN_IN_PLACE=FALSE\
	-DBUILD_SERVER=TRUE\
	-DBUILD_CLIENT=FALSE\
	-DENABLE_SPATIAL=TRUE\
	-DENABLE_LUAJIT=TRUE\
	-DENABLE_CURSES=TRUE\
	-DENABLE_POSTGRESQL=TRUE\
	-DENABLE_SYSTEM_GMP=TRUE \
	-DENABLE_SYSTEM_JSONCPP=TRUE \
	-DVERSION_EXTRA=docker &&\
 make -j4 &&\
 make install


FROM ubuntu:19.10

RUN groupadd minetest && useradd -m -g minetest -d /var/lib/minetest minetest && \
    apt-get update -y && \
    apt-get -y install libcurl4 libjsoncpp1 liblua5.1-0 libluajit-5.1-2 libpq5 libsqlite3-0 \
        libstdc++6 zlib1g libc6 libspatialindex5 libpq5 postgresql-client

WORKDIR /var/lib/minetest

COPY --from=0 /usr/local/share/minetest /usr/local/share/minetest
COPY --from=0 /usr/local/bin/minetestserver /usr/local/bin/minetestserver
COPY --from=0 /usr/local/lib/libprometheus-cpp-*.so /lib/x86_64-linux-gnu/

EXPOSE 30000/udp

CMD ["/usr/local/bin/minetestserver", "--config", "/etc/minetest/minetest.conf"]

