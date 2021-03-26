FROM alpine:edge

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add \
      hugo \
      nodejs \
      npm \
      yarn

ENV NODE_ENV=development

RUN mkdir /app
WORKDIR /app

COPY .yarnrc package.json yarn.lock ./
RUN yarn install --ignore-engines && yarn cache clean
ENV PATH=/node_modules/.bin:$PATH

EXPOSE 1313

COPY . .

CMD [ "hugo", "server", "--bind", "0.0.0.0" ]
