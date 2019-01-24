MATLAB CODE
These codes implement all the tasks in the project1

Proj1----The main file that use the following function to implement the task.
AnaBank_2Ch----A function implements the analysis filters in QMF.
                             I_res = AnaBank_2Ch(I,H_0,H_1)

	            I - Original image to be filtered(a matrix)
                             H_0 - A row vector containing the coefficients of he first filter 
                                       in the anslysis filterbank
                             H_1 - A row vector containing the coefficients of he first filter 
                                       in the anslysis filterbank
                             I_res - The resulting image after the filtering(a matrix with the same size of the imput image)
SynBank_2Ch----A function implements the analysis filters in QMF.
                             I_res = SynBank_2Ch(I,F_0,F_1)

                             I - Original image to be filtered(a matrix)
                             F_0 - A row vector containing the coefficients of he first filter 
                                      in the synthesis filterbank
                             F_1 - A row vector containing the coefficients of he first filter 
                                      in the synthesis filterbank
                             I_res - The resulting image after the filtering(a matrix)
FIR----A function which designes all the four filters in QMF bank.
           [H_0,H_1,F_0,F_1] = FIR(Ws,Wp)

           Ws - Stopband frequency(Between 0 and pi)
           Wp - passband frequency(Between 0 and pi)
           H_0 - A row vector containing the coefficients of filter H_0
           H_1 - A row vector containing the coefficients of filter H_1
           F_0 - A row vector containing the coefficients of filter F_0
           F_1 - A row vector containing the coefficients of filter F_1
NonuniformQ----A simple implementation of nonuniform quantization.


REPORT
This report contains all the image results, discussion and procedures.

CHAPTER1----A general introduction on the sub-band coding.
CHAPTER2----Presents different methods of analysis and synthesis filter bank designs, with simulated results for a set of 1-D inputs, followed by a discussion on their performance.
CHAPTER3---- An application of the filters designed in chapter 2 on a 2-D image along with a discussion on its results. 
CHAPTER4----Discusses the the nonuniform quantizer and effects of aliasing. 