# digitRecognition
Python-based CNN keras  digit recognition microservice with flask implementation.

These microservices were developed using Python and include a pre-trained CNN Keras model. The model was generated using a dataset of fifty thousand MNIST handprinted character images for training purposes. The locally saved model is utilized within the microservice for predicting handwritten digits. The service employs the Flask web application framework to create an endpoint that accepts POST requests with image data as the payload. The Flask application within this service listens for POST requests on port 5001, and the endpoint route is set as "/api/cnn_keras/predict". The resulting predicted number from the model will then be converted into the textual format and included as part of the response message data sent back to the Frontend.

Minikube deployment steps 

1.	Start Minikube using the command: Minikube start --driver=docker 
2.	Copy the microservice file to Minikube using the command. The Minikube ip can be found using the command “Minikube ip”
scp digitRecognition/ -r  docker@<minikube_node_ip>:/home/docker 
3.	Minikube ssh
4.	cd digitRecognition
5.	Build the docker: build --tag digitrecognition .
6.	Generate deployment file using bellow command 
kubectl create deployment digitrecognition-deplyoment --image=docker.io/library/digitrecognition -o yaml --dry-run=client > deployment.yaml
7.	Add  “imagePullPolicy: Never” to the generated deployment yaml file  at the end 
8.	Excute the deployment yaml to create the pods: kubectl apply -f deployment.yaml
9.	Excute service yaml file to generate service: kubectl apply -f service.yaml
10.	To get the service we use this command: minikube service digitrecognition-service --url
11.	 CNN_kerasPrediction python microservice will be accessed from the front end using 
 "URL_Digit_Recognition_Service= 'http://xxx.xxx.xxx.xxx:30000/api/cnn_keras/predict'"

