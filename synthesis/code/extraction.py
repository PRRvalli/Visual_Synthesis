import numpy as np
import scipy as sp
import scipy.io as scio
def one_hot(num):
   a=np.zeros(39)
   a[num-1]=1
   return a;

#here is where you have to give your mat file 
Output=scio.loadmat('/home/prr/intern/1.mat');
Output=Output['finalstruct'];
Phonemes=Output['Phonemes'];
MFCC=Output['MFCC'];
AAM_all=Output['AAM_all'];
AAM_all=AAM_all[0][0];
Phonemes=Phonemes[0][0];
n=len(Phonemes);
Input_feature=np.array([]);
Output_feature=np.array([]);
i=1;
Triphones=np.zeros((n-2,117)) # its 117 because it phonemes are encoded in one_hot format
for i in range(1,n-1):
	Triphones[i-1][:]=np.r_[one_hot(Phonemes[i-1][0]),one_hot(Phonemes[i][0]),one_hot(Phonemes[i+1][0])]
        

print('Triphone shape:', Triphones.shape)
MFCC=MFCC[0][0];
print('MFCC shape:',MFCC.shape)
k=MFCC[1:len(MFCC)-1][:]
print('k shape:',k.shape)
print('Input shape :',Input_feature.shape)
Input_feature=np.c_[k,Triphones]
Output_feature=np.c_[AAM_all[1:len(MFCC)-1][:]]
print('input feature size',Input_feature.shape)
print('output feature size',Output_feature.shape)
