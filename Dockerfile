FROM debian:jessie
MAINTAINER  Blackleg

# Install dependencies
RUN apt-get update && apt-get -y install cron libwww-perl && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
