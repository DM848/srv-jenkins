FROM dm848/cs-jenkins-kubectl:v1

# COPY ContainerPilot configuration
COPY containerpilot.json5 /etc/containerpilot.json5
ENV CONTAINERPILOT=/etc/containerpilot.json5

ENV WEB_SERVER_PORT 8080
EXPOSE 8080
CMD ["/bin/containerpilot"]
