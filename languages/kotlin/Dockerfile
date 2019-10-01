FROM <domain>/javajdk
RUN curl -s https://get.sdkman.io | bash && \
     /bin/bash -c 'source $HOME/.bashrc' && \
    echo $(sdk version)  && \
    echo $(kotlin -version)