FROM ubuntu 
RUN apt-get update -qq
RUN apt-get install -y \
  curl \
  nginx
COPY start.sh /
RUN chmod +x /start.sh
ENV TITLE=Welcome
EXPOSE 80
CMD [ "/start.sh" ]