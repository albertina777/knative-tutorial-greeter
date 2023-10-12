FROM registry.fedoraproject.org/fedora-minimal

WORKDIR /work/

#  COPY target/*-runner /work/application
COPY target/* /work/application
RUN chmod 775 /work
EXPOSE 8080

CMD ["./application", "-Dquarkus.http.host=0.0.0.0"]
