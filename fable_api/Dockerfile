## Plumber Base Image ###########################

FROM rocker/verse

MAINTAINER David Holt (d@tdfd.org)

RUN apt-get update -qq && apt-get install -y \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev \
  libsodium-dev

RUN R -e 'install.packages(c("remotes"))'
RUN R -e 'remotes::install_github("rstudio/plumber")'
RUN install2.r fable future

EXPOSE 8000
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=8000)"]
