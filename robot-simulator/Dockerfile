FROM elixir:1.11.3

# elixir expects utf8.
# ENV ELIXIR_VERSION="v1.11.3" \
# 	LANG=C.UTF-8

# RUN set -xe \
# 	&& ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/archive/${ELIXIR_VERSION}.tar.gz" \
# 	&& ELIXIR_DOWNLOAD_SHA256="d961305e893f4fe1a177fa00233762c34598bc62ff88b32dcee8af27e36f0564" \
# 	&& buildDeps=' \
# 		ca-certificates \
# 		curl \
# 		make \
# 	' \
# 	&& apk add --no-cache --virtual .build-deps $buildDeps \
# 	&& curl -fSL -o elixir-src.tar.gz $ELIXIR_DOWNLOAD_URL \
# 	&& echo "$ELIXIR_DOWNLOAD_SHA256  elixir-src.tar.gz" | sha256sum -c - \
# 	&& mkdir -p /usr/local/src/elixir \
# 	&& tar -xzC /usr/local/src/elixir --strip-components=1 -f elixir-src.tar.gz \
# 	&& rm elixir-src.tar.gz \
# 	&& cd /usr/local/src/elixir \
# 	&& make install clean \
# 	&& apk del .build-deps



#  RUN apk add --no-cache build-base git python

WORKDIR /app

# sudo docker run -it -d -v /home/tarta/workspace/exercism/elixir/robot-simulator/:/app fifthimage sh
# VOLUME /home/tarta/workspace/exercism/elixir/robot-simulator/:/app

# VOLUME . .
COPY . .

# RUN mix test
CMD ["iex", "-S", "mix"]