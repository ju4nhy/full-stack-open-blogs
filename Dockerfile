FROM debian:bullseye as builder

ARG NODE_VERSION=16.13.0

RUN apt-get update; apt install -y curl python-is-python3 pkg-config build-essential
RUN curl https://get.volta.sh | bash
ENV VOLTA_HOME /root/.volta
ENV PATH /usr/local/bin:/root/.volta/bin:$PATH
RUN volta install node@${NODE_VERSION}

#######################################################################

RUN mkdir /app
WORKDIR /app

# NPM will not install any package listed in "devDependencies" when NODE_ENV is set to "production",
# to install all modules: "npm install --production=false".
# Ref: https://docs.npmjs.com/cli/v9/commands/npm-install#description

ENV NODE_ENV production

COPY . .

RUN echo "Current working directory: $(pwd)"
RUN echo "Contents of /app/client/node_modules/.bin/:"
RUN ls -al /app/client/node_modules/.bin/

RUN npm install --production=false --unsafe-perm && npm run build
FROM debian:bullseye

LABEL fly_launch_runtime="nodejs"

COPY --from=builder /root/.volta /root/.volta
COPY --from=builder /app /app

WORKDIR /app
ENV NODE_ENV production
ENV PATH /usr/local/bin:/root/.volta/bin:$PATH
RUN apt-get update; apt install -y curl

CMD [ "npm", "run", "start" ]