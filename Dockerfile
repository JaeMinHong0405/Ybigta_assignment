FROM ubuntu:20.04
RUN mkdir /ybigta_homework
RUN apt-get update && apt-get install -y python3 vim
CMD [ "/bin/bash" ]