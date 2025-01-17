FROM registry.access.redhat.com/ubi9/openjdk-17:1.16

ENV LANGUAGE='en_US:en'


# We make four distinct layers so if there are application changes the library layers can be re-used

COPY --chown=18588 target/lib/ /deployments/lib/
COPY --chown=18588 target/*-runner.jar /deployments/quarkus-run.jar

#COPY --chown=185 target/lib/ /deployments/lib/
#COPY --chown=185 target/*-runner.jar /deployments/quarkus-run.jar

EXPOSE 8080
USER 18588
ENV JAVA_OPTS="-Dquarkus.http.host=0.0.0.0 -Djava.util.logging.manager=org.jboss.logmanager.LogManager"
ENV JAVA_APP_JAR="/deployments/quarkus-run.jar"

ENTRYPOINT [ "/opt/jboss/container/java/run/run-java.sh" ]
