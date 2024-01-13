import numpy as np
from keras.models import Sequential
from keras.layers import Conv2D, MaxPooling2D, Dense, Flatten
from keras.utils import to_categorical
from keras.optimizers import SGD
import keras.models as models
# import mnist
from keras.models import Sequential
from keras.layers import Conv2D, MaxPooling2D, Dense, Flatten
from keras.utils import to_categorical
from keras.optimizers import SGD
import keras.models as models
import keras.utils as image
# import keras_cv
# import matplotlib.pyplot as plt
import cv2
import flask
from flask_cors import CORS

# initialize the  flask application and the Keras model
app = flask.Flask(__name__)
CORS(app)
#load the model
model = None

model = models.load_model('mymodel')

'''
Epoch 1
46s 760us/step - loss: 0.2433 - acc: 0.9276 - val_loss: 0.1176 - val_acc: 0.9634
Epoch 2
46s 771us/step - loss: 0.1184 - acc: 0.9648 - val_loss: 0.0936 - val_acc: 0.9721
Epoch 3
48s 797us/step - loss: 0.0930 - acc: 0.9721 - val_loss: 0.0778 - val_acc: 0.9744
'''

# prepair image for keras predition 
def prepare_image(imagePath):

   img = cv2.imread(imagePath, 0)
   img = cv2.resize(img, (28,28)) # Resize - important! 
   img = cv2.bitwise_not(img)
   img = (img / 255) - 0.5  
   return img
   

# load trained keras model
def load_model():
    global model
    model = models.load_model('mymodel')

# convert number to word
def number2word(Number):
    num2words = {1: 'One', 2: 'Two', 3: 'Three', 4: 'Four', 5: 'Five', \
            6: 'Six', 7: 'Seven', 8: 'Eight', 9: 'Nine'}
    return (num2words[Number])


@app.route("/api/cnn_keras/predict", methods=["POST"])
def predict():
    # initialize the data dictionary that will be returned from the
    # view
    data = {"success": False}

    # ensure an image was properly uploaded to our endpoint
    if flask.request.method == "POST":
        
         if flask.request.files.get("image"):
            img_file = flask.request.files['image']
            # Save the image file to a temporary directory
            img_path = 'predictImage/' + img_file.filename
            img_file.save(img_path)
            # preprocess the image and prepare it for classification
            image = prepare_image(img_path)

            # classify the input image 
            #return predition result
            img_tensor = np.expand_dims(image, axis=0)
            prediction = model.predict(img_tensor)
   
            classes=np.argmax(prediction,axis=1)
            predictResult=number2word(classes.item(0))

            # indicate that the request was a success
            data["predictResult"] = predictResult
            data["success"] = True
            
    # return the data dictionary as a JSON response
    return flask.jsonify(data)
    # return flask.render_template('index.html', predictResult=predictResult, image=img_file.filename)
    
    

if __name__ == "__main__":
    print(("* Loading Keras model and Flask starting server..."
        "please wait until server has fully started"))
    load_model()
    app.run(host= '0.0.0.0', port=5001)
