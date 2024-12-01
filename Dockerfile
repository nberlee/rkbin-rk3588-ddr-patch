FROM debian:bookworm-slim AS builder

ARG COMMIT

ADD https://github.com/rockchip-linux/rkbin/archive/$COMMIT.tar.gz /tmp/rkbin.tar.gz

RUN mkdir rkbin && \
    tar xvf /tmp/rkbin.tar.gz --strip-components=1 -C rkbin

WORKDIR /rkbin/tools

RUN chmod +x ddrbin_tool

ADD ddrbin_param.txt /tmp

RUN ./ddrbin_tool rk3588 /tmp/ddrbin_param.txt ../bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin


FROM scratch
COPY --from=builder /rkbin/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin .
