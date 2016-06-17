from __future__ import print_function
import numpy as np
np.random.seed(1337)  # for reproducibility
import scipy.io as scio
import scipy as sp
import os
from keras.preprocessing import sequence
from keras.models import Model
from keras.layers import Dense, Dropout, Embedding, LSTM, Input, merge
from keras.datasets import imdb


## max_features = 20000 # it should be 180 or the length of input sequence
## maxlen = 100  # cut texts after this number of words (among top max_features most common words)  our case 156 
batch_size = 128


#print('Loading data...')
#(X_train, y_train), (X_test, y_test) = imdb.load_data(nb_words=max_features,test_split=0.2)


X_train=scio.loadmat('40_train_3p3m.mat')
y_train=scio.loadmat('40_test_3p3m.mat')
X_test=scio.loadmat('65_train_3p3m.mat');
y_test=scio.loadmat('65_test_3p3m.mat');

X_train=X_train['Input_feature'];
X_test=X_test['Input_feature'];
y_train=y_train['Output_feature'];
y_test=y_test['Output_feature'];

print(len(X_train), 'train sequences')
print(len(X_test), 'test sequences')
print('1.check :X[4][129] ',X_train[3][128])
print("Pad sequences (samples x time)")
## X_train = sequence.pad_sequences(X_train, maxlen=maxlen)
## X_test = sequence.pad_sequences(X_test, maxlen=maxlen)
##X_train = sequence.pad_sequences(X_train,maxlen=156)
##X_test = sequence.pad_sequences(X_test,maxlen=156)
#y_train = sequence.pad_sequences(y_train,maxlen=44)
#y_test = sequence.pad_sequences(y_test,maxlen=44)

print('X_train shape:', X_train.shape)
print('X_test shape:', X_test.shape)
y_train = np.array(y_train)
y_test = np.array(y_test)
print('2.check :X[4][129] ',X_train[3][128])
sequence = Input(shape=(X_train.shape[1],), dtype='int32')  
#embedded = Embedding(max_features, 128, input_length=156)(sequence)
embedded = Embedding(X_train.shape[0], 128, input_length=X_train.shape[1])(sequence)

forwards = LSTM(128)(embedded)
backwards = LSTM(128, go_backwards=True)(embedded)

merged = merge([forwards, backwards], mode='sum', concat_axis=-1)
after_dp = Dropout(0.2)(merged)
output = Dense(y_train.shape[1], activation='tanh')(after_dp)

model = Model(input=sequence, output=output)
model.compile('adam', 'mse', metrics=['accuracy'])

print('Train...')
model.fit(X_train, y_train,
          batch_size=batch_size,
          nb_epoch=50,
          validation_data=[X_test, y_test])

score, acc = model.evaluate(X_test, y_test,batch_size=batch_size)
print('Test score:', score)
print('Test accuracy:', acc)

y_pred = model.predict(X_test)
##changes made
scio.savemat('Result/3p3m.mat', dict(pos=y_pred,loss=score,Accuracy=acc))
temp='/home/sgeadmin/Valli/mats_final/synthesis/code/Result/'
#     enc= rbm_ptr.GetWeights()
os.chdir(temp)
model.save_weights('weight_3p3m',overwrite=True)







