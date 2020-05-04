from tensorflow import keras
#from keras.models import load_model

keras.backend.clear_session()

model= keras.models.load_model("test.h5")
model.summary()