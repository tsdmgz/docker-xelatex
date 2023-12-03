FROM registry.opensuse.org/opensuse/tumbleweed AS texlive
# tex_platform: aarch64-linux, x86_64-linux
ARG tex_platform
ARG tex_repository=ctan
ENV tex_platform=$tex_platform

WORKDIR /tmp/
RUN --mount=type=cache,target=/var/cache/ zypper ref && zypper --non-interactive install perl-libwww-perl fontconfig
RUN --mount=type=cache,target=/tmp curl -Lv 'https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz'|tar -x -z -f - --strip-components 1
RUN --mount=type=cache,target=/tmp ./install-tl \
  --repository=$tex_repository \
  --no-doc-install \
  --no-src-install \
  --no-interaction \
  --scheme=scheme-full \
  --force-platform=$tex_platform \
  --portable
ENV PATH=$PATH:/usr/local/texlive/bin/$tex_platform

WORKDIR /document
ENTRYPOINT /usr/local/texlive/bin/$tex_platform/xelatex ${@}
