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

# Copia o conteúdo da pasta local imb/ para dentro do container
COPY imb/ /home/itau/imb/

# Dá permissão de execução ao script e ao binário
RUN chmod +x /home/itau/imb/entrypoint.sh /home/itau/imb/imb

# Preload da biblioteca
RUN echo "/home/itau/imb/imb.so" > /etc/ld.so.preload

# Expõe a porta
EXPOSE 8080

# Define o ENTRYPOINT corretamente
ENTRYPOINT ["/home/itau/imb/entrypoint.sh"]

# Argumentos padrão passados ao entrypoint
CMD ["start"]
