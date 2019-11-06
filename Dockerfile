FROM nvidia/cuda:9.0-cudnn7-runtime

COPY pretrained_models.tar.gz /

RUN apt update && \
    apt install -y git python3 python3-pip && \
    git clone https://github.com/salu133445/musegan.git && \
    mv pretrained_models.tar.gz /musegan/exp && \
    cd /musegan/exp && \
    tar xf pretrained_models.tar.gz && \
    cd /musegan && \
    pip3 install -r requirements.txt

WORKDIR /musegan

CMD ./scripts/run_inference.sh "./exp/default/" "0" ; mv /musegan/exp/default/results/inference/pianorolls /mnt
