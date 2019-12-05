FROM openjdk:8-jdk

ENV CHROMEDRIVER_VERSION 78.0.3904.105

RUN apt-get update

# Allow https sources
RUN apt-get install -y apt-transport-https

# Install Chrome and dependencies
RUN apt-get install -y \
      libxss1 \
      libappindicator3-1 \
      libasound2 \
      libindicator7 \
      libnspr4 \
      libnss3 \
      fonts-liberation \
      lsb-release \
      xdg-utils \
      xvfb && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome*.deb && \
    apt-get install -f && \
    rm "google-chrome-stable_current_amd64.deb" && \
    rm -rf /var/lib/apt/lists/*

# Install Chromedriver
RUN wget -N https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    chmod +x chromedriver && \
    mv -f chromedriver /usr/local/share/chromedriver && \
    ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver && \
    ln -s /usr/local/share/chromedriver /usr/bin/chromedriver && \
    rm "chromedriver_linux64.zip"
