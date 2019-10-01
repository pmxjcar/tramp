FROM <domain>/development
RUN apt-get install -y haskell-stack \
    && stack upgrade --binary-only

RUN git clone --recursive https://github.com/unisonweb/unison.git \
    && cd unison \
    && stack --version \
    && stack build \
    && stack exec tests \
    && stack exec unison