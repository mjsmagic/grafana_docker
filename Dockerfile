FROM continuumio/miniconda3

ADD pure-exporter-stack.yml /tmp/pure-exporter-stack.yml
RUN conda env create -f /tmp/pure-exporter-stack.yml

RUN echo "conda activate $(head -1 /tmp/pure-exporter-stack.yml | cut -d' ' -f2)" >> ~/.bashrc
ENV PATH /opt/conda/envs/$(head -1 /tmp/pure-exporter-stack.yml | cut -d' ' -f2)/bin:$PATH

ENV CONDA_DEFAULT_ENV $(head -1 /tmp/pure-exporter-stack.yml | cut -d' ' -f2)


