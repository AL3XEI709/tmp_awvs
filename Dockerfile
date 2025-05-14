FROM debian:stable-slim
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install libxdamage1 libgtk-3-0 libasound2 libnss3 libxss1 -y
RUN mkdir /app
WORKDIR /app
COPY acunetix_trial.sh .
COPY patch_awvs .
CMD ["/bin/sh", "-c", "reuseaddr EXEC:'echo hello', stderr"]