FROM trestletech/plumber

RUN apt-get update && apt-get install -y libsodium-dev 

RUN install2.r \
    fable \
    devtools \
    future
    
RUN R -e 'install.packages("remotes")'
RUN R -e 'remotes::install_github("rstudio/plumber")'
    
COPY [".", "./"]

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=as.numeric(Sys.getenv('PORT')))"]
# EXPOSE 9999

CMD ["fable_main.R"]