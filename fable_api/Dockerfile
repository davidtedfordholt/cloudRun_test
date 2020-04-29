## Plumber Base Image ###########################

FROM rocker/verse

MAINTAINER David Holt (d@tdfd.org)

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev \
  libsodium-dev

RUN R -e 'install.packages(c("remotes"))'
RUN R -e "remotes::install_github('rstudio/plumber', force = TRUE, upgrade = TRUE, type = 'source')"
RUN install2.r future
