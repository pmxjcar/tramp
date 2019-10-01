FROM <domain>/development
RUN apt install -y apt-transport-https software-properties-common && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' && \
    apt update -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install --yes --force-yes r-base && \
    echo $(R)
