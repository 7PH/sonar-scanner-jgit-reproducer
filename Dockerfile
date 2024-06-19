FROM debian:12.5-slim
ENTRYPOINT ["/app/run.sh"]


# Use default scanner version using environment variable
ARG SCANNER_VERSION

# Install java
RUN apt-get update \
    && apt-get install -y openjdk-17-jre \
    && apt-get clean

# Install git and clone sonar-scanner-azdo
RUN apt-get install -y git wget unzip \
    && apt-get clean

# Copy dummy repository
RUN git clone https://github.com/SonarSource/sonar-scanner-azdo /app

# Create run file
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

WORKDIR /opt

# Install sonar-scanner-cli
RUN wget -q "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SCANNER_VERSION-linux.zip" \
    && unzip "sonar-scanner-cli-$SCANNER_VERSION-linux.zip" \
    && rm "sonar-scanner-cli-$SCANNER_VERSION-linux.zip"

# Add sonar-scanner-cli to PATH
ENV PATH="/opt/sonar-scanner-$SCANNER_VERSION-linux/bin:${PATH}"

# Uninstall git
RUN apt-get remove -y git

COPY sonar-project.properties /app/sonar-project.properties

WORKDIR /app
