FROM golang:1.18.0
WORKDIR /app

ADD ./http-server /app
RUN chmod +x ./http-server
RUN ls -alh /app

CMD [ "./http-server" ]
