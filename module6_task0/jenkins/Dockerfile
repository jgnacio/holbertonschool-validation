FROM jenkins/jenkins:lts-jdk11

USER root

# Skip initial setup
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

ENV JENKINS_USER jgit
ENV JENKINS_PASS supersecurepasswd

# Creating a default admin user
COPY default-admin-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# hadolint ignore=DL3008
RUN apt-get update && apt-get install --no-install-recommends -y \
    lsb-release && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
    https://download.docker.com/linux/debian/gpg && \
    echo "deb [arch=$(dpkg --print-architecture) \
    signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# hadolint ignore=DL3008
RUN apt-get update && apt-get install --no-install-recommends -y docker-ce-cli \
    lsb-release && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 && \
    chmod +x container-structure-test-linux-amd64 && \
    mv container-structure-test-linux-amd64 /usr/bin/container-structure-test

# Copy the plugins from plugins.txt
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt

# Return to user jenkins (Good practice)
USER jenkins

# Install plugins from plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
