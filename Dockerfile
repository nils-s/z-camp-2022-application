FROM eclipse-temurin:18.0.1_10-jre-alpine

# addgroup / adduser options:
# -S - create system group / user
# -D - don't assign a password
# -H - don't assign home directory
# -s - select shell
# -G - set group
RUN mkdir /app && \
    addgroup -S appuser && \
    adduser -S -D -H -s /bin/false -G appuser appuser

COPY app.jar /app/app.jar

RUN chown -R appuser:appuser /app

WORKDIR /app

EXPOSE 8080

USER appuser

CMD "java" "-jar" "app.jar"