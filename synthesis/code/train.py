from __future__ import print_function
import numpy as np
np.random.seed(1337)  # for reproducibility
import scipy.io as scio
import scipy as sp

from keras.preprocessing import sequence
from keras.models import Model
from keras.layers import Dense, Dropout, Embedding, LSTM, Input, merge
from keras.datasets import imdb


## max_features = 20000 # it should be 180 or the length of input sequence
## maxlen = 100  # cut texts after this number of words (among top max_features most common words)  our case 156 
batch_size = 32


#print('Loading data...')
#(X_train, y_train), (X_test, y_test) = imdb.load_data(nb_words=max_features,test_split=0.2)


X_train=scio.loadmat('1.mat')
y_train=Scio.loadmat('3.mat')
X_test=scio.loadmat('2.mat');
y_test=scio.loadmat('4.mat');

X_train=X_train['input_train'];
X_test=X_test['input_test'];
y_train=y_train['out_train'];
y_test=y_test['out_test'];

print(len(X_train), 'train sequences')
print(len(X_test), 'test sequences')

print("Pad sequences (samples x time)")
## X_train = sequence.pad_sequences(X_train, maxlen=maxlen)
## X_test = sequence.pad_sequences(X_test, maxlen=maxlen)
X_train = sequence.pad_sequences(X_train,maxlen=156)
X_test = sequence.pad_sequences(X_test,maxlen =156)

print('X_train shape:', X_train.shape)
print('X_test shape:', X_test.shape)
y_train = np.array(y_train)
y_test = np.array(y_test)


# this is the placeholder tensor for the input sequences
sequence = Input(shape=(156,), dtype='float64')
# this embedding layer will transform the sequences of integers
# into vectors of size 128
embedded = Embedding(max_features, 128, input_length=maxlen)(sequence)

# apply forwards LSTM
forwards = LSTM(64)(embedded)
# apply backwards LSTM
backwards = LSTM(64, go_backwards=True)(embedded)

# concatenate the outputs of the 2 LSTMs
merged = merge([forwards, backwards], mode='concat', concat_axis=-1)
after_dp = Dropout(0.5)(merged)
output = Dense(1, activation='sigmoid')(after_dp)

model = Model(input=sequence, output=output)

# try using different optimizers and different optimizer configs
model.compile('adam', 'binary_crossentropy', metrics=['accuracy'])

print('Train...')
model.fit(X_train, y_train,
          batch_size=batch_size,
          nb_epoch=4,
          validation_data=[X_test, y_test])
