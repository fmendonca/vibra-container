FROM registry.access.redhat.com/ubi9/ubi

# Instala o Apache
RUN dnf install -y httpd && \
    dnf clean all

# Altera a porta padrão do Apache de 80 para 8080
RUN sed -i 's/^Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf

# Cria uma página simples
RUN echo "health ok" > /var/www/html/index.html

# Expõe a porta 8080
EXPOSE 8080

# Comando para iniciar o Apache em foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
