FROM alexenge/r_eeg:4.1.2

USER root

COPY template/ template/
COPY .gitignore .
COPY Dockerfile .
COPY LICENSE .
COPY Makefile .
COPY README.md .
COPY slides.Rmd .
COPY slides.pdf .

ENV PIPELINE_DATA_DIR=$HOME/project/data
RUN python3 -c "from pipeline.datasets import ucap; ucap.get_paths(1)" \
    && chown -R $NB_USER $HOME

USER $NB_USER
