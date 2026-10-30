FROM noodle/debian

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN	apt install -y --no-install-recommends \
		cmake clang lld rustup libclang-dev

USER devuser
RUN	rustup default nightly \
&&	rustup target add x86_64-pc-windows-gnu \
&&	cargo install cargo-nextest \
&&	cargo install cargo-audit \
&&	cargo install cargo-machete

USER root
