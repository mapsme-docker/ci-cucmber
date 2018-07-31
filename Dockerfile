FROM ruby:2.5
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /cucumber
WORKDIR /cucumber

RUN mkdir output && chmod a+w output && mkdir output/logs

ADD ./Gemfile /cucumber/Gemfile
ADD ./Gemfile.lock /cucumber/Gemfile.lock

RUN gem install bundler -v 1.13.6

RUN bundle install

RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee -a /etc/apt/sources.list
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN apt-get update && \
    apt-get -qq -y install xvfb iceweasel \
                           libxpm4 libxrender1 libgtk2.0-0 libnss3 libgconf-2-4 \
                           libpango1.0-0 libxss1 libxtst6 fonts-liberation libappindicator1 xdg-utils \
                           google-chrome-stable

RUN apt-get update
RUN apt-get -y install \
               xvfb gtk2-engines-pixbuf \
               xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable \
               imagemagick x11-apps zip

RUN Xvfb -ac :99 -screen 0 1680x1050x24 &
RUN export DISPLAY=:99
