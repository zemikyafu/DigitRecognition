
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
# RUN apk --no-cache add keras
# RUN apk --no-cache add tensorflow

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