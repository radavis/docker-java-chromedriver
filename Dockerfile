FROM openjdk:8-jdk

ENV CHROMEDRIVER_VERSION 2.38

# Allow https sources
RUN apt-get update && apt-get install -y apt-transport-https

# Install Chrome
RUN apt-get update \
&& apt-get install -y libxss1 libappindicator3-1 libindicator7 fonts-liberation lsb-release xdg-utils \
&& wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
&& dpkg -i google-chrome*.deb \
&& apt-get install -f \
&& rm "google-chrome-stable_current_amd64.deb"

# Install xvfb to run headless
RUN apt-get install -y xvfb

# Install Chromedriver 
RUN wget -N http://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip \
&& unzip chromedriver_linux64.zip \
&& chmod +x chromedriver \
&& mv -f chromedriver /usr/local/share/chromedriver \
&& ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver \
&& ln -s /usr/local/share/chromedriver /usr/bin/chromedriver \
&& rm "chromedriver_linux64.zip"
