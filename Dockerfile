FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# Instala bibliotecas 32-bit necessárias
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y \
    libc6:i386 libstdc++6:i386 libgtk2.0-0:i386 libnss3:i386 libxss1:i386 \
    libasound2:i386 libx11-xcb1:i386 libxcomposite1:i386 libxcursor1:i386 \
    libxdamage1:i386 libxrandr2:i386 libxinerama1:i386 libxi6:i386 ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /home/itau/imb

# Copia os arquivos locais da pasta imb/ para o container
COPY imb/ ./home/itau/imb/
COPY entrypoint.sh /entrypoint.sh

# Dá permissão de execução ao binário
RUN chmod +x /entrypoint.sh ./home/itau/imb/

# Preload da biblioteca .so (caminho absoluto no container!)
RUN echo "/home/itau/imb/imb createkey"
RUN echo "/home/itau/imb/imb.so" > /etc/ld.so.preload

# Expõe a porta (caso necessário)
EXPOSE 8080

# Comando padrão
CMD ["./imb", "start"]
