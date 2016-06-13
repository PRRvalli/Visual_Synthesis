from __future__ import print_function
import numpy as np
np.random.seed(1337)  # for reproducibility
import scipy as sp
from keras.preprocessing import sequence
from keras.utils import np_utils
from keras.models import Sequential
from keras.layers import Dense, Dropout, Activation, Embedding
from keras.layers import LSTM, SimpleRNN, GRU

from numpy import linalg as LA
import scipy.io as scio

import theano
import cPickle
import gzip
import os
import sys
import timeit
import time

batch_size = 128        # data preparation
print('Loading data...')
X_train=scio.loadmat('1.mat')
y_train=scio.loadmat('3.mat')
X_test=scio.loadmat('2.mat');
y_test=scio.loadmat('4.mat');

X_train=X_train['input_train'];
X_test=X_test['input_test'];
y_train=y_train['out_train'];
y_test=y_test['out_test'];



print(len(X_train), 'train sequences')
print(len(X_test), 'test sequences')

# print('Pad sequences (samples x time)')                      ### what is sequence pad 
# X_train = sequence.pad_sequences(X_train, maxlen=maxlen)    
# X_test = sequence.pad_sequences(X_test, maxlen=maxlen)
print('X_train shape:', X_train.shape)
print('X_test shape:', X_test.shape) 

# LSTM set up for trainning

print('Build model...')
model = Sequential()
model.add(Embedding(687135, 128, input_length=180, dropout=0.2))
model.add(LSTM(128, dropout_W=0.2, dropout_U=0.2))  # try using a GRU instead, for fun
model.add(Dense(36))
model.add(Activation('sigmoid'))

# try using different optimizers and different optimizer configs
model.compile(loss='binary_crossentropy',optimizer='adam',metrics=['accuracy'])

print('Train...')
print(X_train.shape)
print(y_train.shape)
model.fit(X_train, y_train, batch_size=batch_size, nb_epoch=5,
          validation_data=(X_test, y_test))
score, acc = model.evaluate(X_test, y_test,batch_size=batch_size)
print('Test score:', score)
print('Test accuracy:', acc)

# Testing
y_pred = model.predict(X_test) # works well
temp='/home/pghosh/mats_final/synthesis/code'
#     enc= rbm_ptr.GetWeights()
os.chdir(temp)
model.save_weights('keras_w',overwrite=True)
