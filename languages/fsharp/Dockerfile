FROM <domain>/development

RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt install -y apt-transport-https && \
    apt update && \
    apt install dotnet-sdk-2.2 && \
    echo $(dotnet --info) 

RUN dotnet new -i Expecto.Template::* && \
    dotnet tool install fake-cli -g && \
    dotnet new -i "fake-template::*"
