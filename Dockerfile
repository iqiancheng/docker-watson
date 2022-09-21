FROM node:16-alpine as builder

RUN \
	apk add --no-cache --virtual .temp \
		make \
		g++ \
		git \
		&&\
	rm -rf /app &&\
	git clone --recursive https://github.com/drauf/watson.git /app &&\
	cd /app &&\
	yarn install &&\
	rm -rf .git /tmp/* /var/tmp/* &&\
	apk del --no-cache .temp

EXPOSE 3000
WORKDIR /app
CMD ["yarn", "start"]