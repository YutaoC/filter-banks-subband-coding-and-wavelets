# filter-banks-subband-coding-and-wavelets
implement  2-channel analysis and synthesis filter bank along with quantization

## The main file that use the following function to implement the task.  
### AnaBank_2Ch----A function implements the analysis filters in QMF.  
                   I_res = AnaBank_2Ch(I,H_0,H_1)  
                   I - Original image to be filtered(a matrix)  
                   H_0 - A row vector containing the coefficients of he first filter in the anslysis filterbank  
                   H_1 - A row vector containing the coefficients of he first filter in the anslysis filterbank  
                   I_res - The resulting image after the filtering(a matrix with the same size of the imput image) 
                   
### SynBank_2Ch----A function implements the analysis filters in QMF.
                   I_res = SynBank_2Ch(I,F_0,F_1)   
                   I - Original image to be filtered(a matrix)   
                   F_0 - A row vector containing the coefficients of he first filter in the synthesis filterbank   
                   F_1 - A row vector containing the coefficients of he first filter in the synthesis filterbank   
                   I_res - The resulting image after the filtering(a matrix) 
                   
### FIR----A function which designes all the four filters in QMF bank.
           [H_0,H_1,F_0,F_1] = FIR(Ws,Wp)  
           Ws - Stopband frequency(Between 0 and pi)   
           Wp - passband frequency(Between 0 and pi)   
           H_0 - A row vector containing the coefficients of filter H_0  
           H_1 - A row vector containing the coefficients of filter H_1  
           F_0 - A row vector containing the coefficients of filter F_0  
           F_1 - A row vector containing the coefficients of filter F_1  
### NonuniformQ----A simple implementation of nonuniform quantization.
