# FROM alpine:3.14
# RUN apk --no-cache add python3
# ADD repositories /etc/apk/repositories
# RUN apk --no-cache add py3-numpy@community
# RUN apk add --no-cache bash
# CMD /bin/sleep infinity


# FROM alpine:3.14
# ADD repositories /etc/apk/repositories
# RUN apk --no-cache add python3 \
#     && apk --no-cache add py3-numpy@community \
#     && apk add --no-cache bash
# CMD /bin/sleep infinity

# FROM alpine:3.14

# RUN apk add --no-cache python3
# ADD repositories /etc/apk/repositories
# # RUN apk update && apk upgrade --no-cache && apk add --no-cache py3-numpy@community
# # RUN apk update && apk upgrade --no-cache   py3-numpy@community
# RUN apk --no-cache add py3-numpy@community
# RUN apk add --no-cache bash

# CMD /bin/sleep infinity


# FROM alpine:3.2
# ADD repositories /etc/apk/repositories
# RUN apk update && apk upgrade --no-cache   py3-numpy@community

# works but its big 
# FROM python:3.7
# WORKDIR /TF_2.x
# COPY . /TF_2.x/
# RUN python -m pip install tensorflow
# RUN python -m pip install numpy
# RUN python -m pip install opencv-python-headless
# RUN python -m pip install matplotlib

# works 
# FROM python:3.6-alpine3.7
# RUN apk --no-cache add --virtual .builddeps gcc gfortran musl-dev     && pip install numpy    && apk del .builddeps     && rm -rf /root/.cache

# FROM alpine:3.14.0
# RUN apk --no-cache add python3
# # ADD repositories /etc/apk/repositories
# RUN mkdir /digitRecognition
# WORKDIR /digitRecognition 
# COPY . .
# RUN apk --update add --no-cache python3 py3-pip
# RUN apk --no-cache add py3-numpy
# RUN apk --no-cache add py3-flask
# RUN apk --no-cache add opencv

# # RUN apk --no-cache add py3-keras
# # RUN pip3 install numpy
# # RUN pip3 install flask
# RUN pip3 install keras
# RUN pip3 install tensorflow
# # RUN pip3 install opencv-python
# # RUN apk --no-cache add py3-tensorflow
# # RUN pip3 install tensorflow

# RUN apk add --no-cache bash
# EXPOSE 5001
# CMD ["python3", "cnn_kerasPredict.py","run","--host=0.0.0.0"]





# FROM alpine:3.14.0
# RUN apk update && apk add python3 py3-pip python3-dev build-base 
# # RUN apk --no-cache add \
# #     python3 \
# #     py3-pip \
# #     build-base \
# #     python3-dev \
# #     libffi-dev \
# #     openssl-dev \
# #     cargo \
# #     linux-headers

# RUN pip3 install --no-cache-dir tensorflow

# CMD ["python3"]


# work but only with out tenserflow
# FROM alpine:3.14.0
# RUN apk --no-cache add python3
# # ADD repositories /etc/apk/repositories
# RUN mkdir /digitRecognition
# WORKDIR /digitRecognition 
# COPY . .
# RUN apk --update add --no-cache python3 py3-pip
# RUN apk --no-cache add py3-numpy
# RUN apk --no-cache add py3-flask
# RUN apk --no-cache add opencv

# RUN pip3 install keras
# RUN pip3 install tensorflow

# RUN apk add --no-cache bash
# EXPOSE 5001
# CMD ["python3", "cnn_kerasPredict.py","run","--host=0.0.0.0"]


# FROM alpine:latest
# RUN apk update && apk upgrade && apk add --no-cache bash git openblas-dev python3-dev py3-pip gcc g++ musl-dev linux-headers
# RUN pip3 install --no-cache-dir tensorflow
# RUN git clone https://github.com/tensorflow/tensorflow.git 


# dosen't work
# FROM alpine:latest
# RUN apk update && apk upgrade && \
#     apk add --no-cache bash git openblas-dev python3-dev py3-pip gcc g++ musl-dev linux-headers python3 python3-dev libffi-dev openssl-dev
# RUN git clone https://github.com/tensorflow/tensorflow.git
# WORKDIR /tensorflow
# RUN ./configure
# RUN bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package
# RUN bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
# RUN pip3 install --no-cache-dir /tmp/tensorflow_pkg/tensorflow-*.whl
# RUN rm -rf /tensorflow /tmp/tensorflow_pkg



# FROM alpine:3.14.0
# RUN apk --no-cache add python3
# # ADD repositories /etc/apk/repositories
# RUN mkdir /digitRecognition
# WORKDIR /digitRecognition 
# COPY . .
# RUN apk --update add --no-cache python3 py3-pip
# RUN apk --no-cache add py3-numpy
# RUN apk --no-cache add py3-flask
# RUN apk --no-cache add opencv

# RUN pip3 install keras
# RUN pip3 install tensorflow

# RUN apk add --no-cache bash
# EXPOSE 5001
# CMD ["python3", "cnn_kerasPredict.py","run","--host=0.0.0.0"]


FROM python:3.8

# Set working directory
RUN mkdir /digitRecognition
WORKDIR /digitRecognition 
COPY . .
# Install dependencies

RUN pip install flask
RUN pip install numpy
RUN pip install  keras
RUN apt update && \
    apt install -y libgl1-mesa-glx    
RUN pip install  opencv-python
RUN pip install Flask-Cors
RUN pip install tensorflow
# RUN apk add --no-cache bash
EXPOSE 5001
CMD ["python3", "cnn_kerasPredict.py","run","--host=0.0.0.0"]