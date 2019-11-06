# docker

Download pretrained_models.tar.gz

```bash
docker build -t musegan .
docker run --runtime=nvidia -v $PWD/res:/mnt musegan:latest
```
