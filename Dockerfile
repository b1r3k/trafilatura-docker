FROM debian:bullseye-slim

ARG USER=isolated
ARG GROUP=isolated
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl python3-pip
RUN addgroup $GROUP && adduser \
    --disabled-password \
    --gecos "" \
    --ingroup $GROUP \
    --uid 1000 \
    $USER
RUN pip install trafilatura[all]
USER $USER
ENTRYPOINT ["trafilatura"]
