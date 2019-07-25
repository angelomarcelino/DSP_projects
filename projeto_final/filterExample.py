import matplotlib.pyplot as plt #For plotting
from math import sin, pi #For generating input signals
import sys #For reading command line arguments
import numpy as np
from numpy.fft import fft, fftfreq, ifft

def filtro(x):
    y = [0]*48000
    for n in range(4, len(x)):
        y[n] = 0.0104*x[n] - 0.0207*x[n-2] + 0.0104*x[n-4] + 2.4954*y[n-1] - 3.1312*y[n-2] + 2.1320*y[n-3] - 0.7328*y[n-4] 
    return y

frequencia = int(sys.argv[1])	

input = [0]*48000
output = [0]*48000

for i in range(48000):
    input[i] = sin(2 * pi * frequencia * i / 48000) + sin(2 * pi * 70 * i / 48000)

output = filtro(input)

output_amostrado = output[0:480]  
input_amostrado = input[0:480] 

plt.figure(1)                
plt.subplot(211)   
plt.ylabel('Magnitude')
plt.xlabel('Amostras') 
plt.title('Sinal não filtrado')      
plt.plot(input_amostrado)
plt.subplot(212)             
plt.ylabel('Magnitude')
plt.xlabel('Amostras') 
plt.title('Sinal filtrado')
plt.plot(output_amostrado)
plt.show()

