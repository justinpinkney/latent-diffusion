FROM nvcr.io/nvidia/pytorch:20.09-py3

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN apt-get update

COPY environment.yaml /tmp/environment.yaml
RUN conda env create -f /tmp/environment.yaml

WORKDIR /workspace