from flask import Flask, request, jsonify
from deepface import DeepFace
from tensorflow.keras.applications.inception_v3 import InceptionV3, preprocess_input, decode_predictions
from tensorflow.keras.preprocessing import image
import numpy as np
import cv2
import matplotlib.pyplot as plt
import os

app = Flask(__name__)

@app.route('/process_image', methods=['POST'])
def process_image():
try:
# Receive the image file
image_file = request.files['image']
image_path = 'temp_image.jpg'  # Save the image temporarily

try:
# Save the received image
image_file.save(image_path)

# Background Detection with InceptionV3
model = InceptionV3(weights='imagenet')
img = image.load_img(image_path, target_size=(299, 299))
            x = image.img_to_array(img)
            x = np.expand_dims(x, axis=0)
            x = preprocess_input(x)
            predictions = model.predict(x)
decoded_predictions = decode_predictions(predictions, top=5)[0]
background_object = decoded_predictions[-1]

# Emotion Detection with DeepFace
imag1 = cv2.imread(image_path)
            result = DeepFace.analyze(imag1, actions=['emotion'])
dominant_emotion = result[0]['dominant_emotion']

# Return the results as JSON
return jsonify({
'background_object': {
'label': background_object[1],
'probability': background_object[2]
                },
'emotion_result': {
'result': result,
'dominant_emotion': dominant_emotion
                }
            })

finally:

# Remove the temporary image
os.remove(image_path)

except Exception as e:
return jsonify({'error': str(e)})

if __name__ == '__main__':
app.run(debug=True)


