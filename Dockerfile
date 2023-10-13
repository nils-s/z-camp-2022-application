FROM eclipse-temurin:20.0.2_9-jre-alpine

# addgroup / adduser options:
# -S - create system group / user
# -D - don't assign a password
# -H - don't assign home directory
# -s - select shell
# -G - set group
RUN mkdir /app && \
    addgroup -S appuser && \
    adduser -S -D -H -s /bin/false -G appuser appuser

COPY target/app.jar /app/app.jar

RUN chown -R appuser:appuser /app

WORKDIR /app

EXPOSE 8080

USER appuser

CMD "java" "-jar" "app.jar"