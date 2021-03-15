FROM openjdk:8-jre-alpine
ENV APP_FILE hcm-1.0.0.jar
ENV APP_HOME /usr/apps
COPY ./target/$APP_FILE $APP_HOME/
WORKDIR $APP_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec java -jar $APP_FILE"]