FROM davidtedfordholt/plumber-verse

MAINTAINER David Holt (d@tdfd.org)

RUN install2.r fable

RUN R -e "remotes::install_github('rstudio/plumber', force = TRUE, upgrade = TRUE, type = 'source')"

COPY . /

CMD ["fable_main.R"]