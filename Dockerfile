FROM debian:11.3-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y install \
    lilypond \
    texlive-base \
    texlive-lang-german \
    texlive-lang-cyrillic \
    texlive-latex-extra \
    texlive-music \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
