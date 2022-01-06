FROM jupyter/datascience-notebook:latest

USER root

RUN apt-get update && \
    apt-get install -y libpq-dev && \
    apt-get clean && rm -rf var/lib/lists/*

USER $NB_UID

RUN conda install --quiet --yes \
    'r-rpostgresql' \
    'r-getpass' \
    'r-lme4' && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
