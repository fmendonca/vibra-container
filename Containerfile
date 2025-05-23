FROM registry.access.redhat.com/ubi9/ubi

# Instala o Apache
RUN dnf install -y httpd && \
    dnf clean all

# Cria uma página simples
RUN echo "health ok" > /var/www/html/index.html

# Expõe a porta padrão do Apache
EXPOSE 80

# Comando para iniciar o Apache em foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
