from __future__ import print_function
import numpy as np
np.random.seed(1337)  # for reproducibility

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

X_test=scio.loadmat('65_train_3p1m.mat');
model = Sequential()
model.load_weights('weight_3p3m')
model.compile(optimizer='adagrad', loss='mse')
y_pred = model.predict(X_test) 
scio.savemat('Result/3p1m.mat', dict(pos=y_pred,loss=score,Accuracy=acc))


#from keras.callbacks import EarlyStopping
#early_stopping = EarlyStopping(monitor='val_loss', patience=2)
#model.fit(X, y, validation_split=0.2, callbacks=[early_stopping])

