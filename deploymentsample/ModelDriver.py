from tensorflow.keras.preprocessing.text import Tokenizer
import pickle
# loading
with open('models/tokenizer.pickle', 'rb') as handle:
    tokenizer = pickle.load(handle)

# later...
from tensorflow import keras
from keras.models import model_from_json
from tensorflow.keras.preprocessing.sequence import pad_sequences
 
loaded_model = keras.models.load_model('models/modeltrained3.h5')

def generate_text_seq(model, tokenizer, text_seq_length, seed_text, n_words):
    text = []
    for _ in range(n_words):
        encoded = tokenizer.texts_to_sequences([seed_text])[0]
        encoded = pad_sequences([encoded], maxlen=text_seq_length, truncating='pre')
        y_pred = model.predict_classes(encoded)
        predicted_word = ''
        for word, index in tokenizer.word_index.items():
            if index == y_pred:
                predicted_word = word
                break
        seed_text = seed_text + ' ' + predicted_word
        text.append(predicted_word)
    return ' '.join(text)

def generate(inputStory):
    #seed_text = "he boy had dreamed of the treasure he had no idea where the treasure is but he was sure it was somewhere hidden in the mountains"
    seed_text=inputStory
    seq_length=50
    output=generate_text_seq(loaded_model, tokenizer, seq_length, seed_text, 200)
    return inputStory+" "+output
