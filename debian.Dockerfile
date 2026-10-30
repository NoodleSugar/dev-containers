FROM debian:trixie

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN	apt update -y \
&&	apt upgrade -y --no-install-recommends \
&&	apt install -y --no-install-recommends \
		sudo ca-certificates \
		ssh git bash-completion \
&&	groupadd --gid 1000 devgroup \
&&	useradd --uid 1000 --gid devgroup --shell /bin/bash --create-home devuser \
&&	ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
&&	echo $TZ > /etc/timezone
