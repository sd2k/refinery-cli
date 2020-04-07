FROM clux/muslrust:stable as builder

RUN cargo install refinery_cli
RUN mkdir -p /out && cp /root/.cargo/bin/refinery /out/

FROM alpine:latest
COPY --from=builder /out/refinery /bin/

RUN apk add --no-cache ca-certificates

CMD refinery
