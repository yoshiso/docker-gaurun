FROM golang:1.4.2-wheezy

RUN git clone https://github.com/yss44/gaurun.git; \
    cd gaurun; \
    make gom; \
    make bundle; \
    make; \
    mv bin/* /bin

RUN mkdir /workspace

WORKDIR /workspace

ADD gaurun.toml /workspace/gaurun.toml

CMD /bin/gaurun -c gaurun.toml
