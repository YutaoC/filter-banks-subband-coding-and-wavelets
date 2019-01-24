function [H_0,H_1,F_0,F_1] = FIR(Ws,Wp)
%
% This function calculate four FIR filters in 2-ch filterbank based on the
% passband and stopband frequency of lowpass filter(H_0).
%
% [H_0,H_1,F_0,F_1] = FIR(Ws,Wp)
%
% Ws - Stopband frequency(Between 0 and pi)
% Wp - passband frequency(Between 0 and pi)
% H_0 - A row vector containing the coefficients of filter H_0
% H_1 - A row vector containing the coefficients of filter H_1
% F_0 - A row vector containing the coefficients of filter F_0
% F_1 - A row vector containing the coefficients of filter F_1
%
% Yutao Chen & Sajani Pallegoda Vithana
% 01/11/2018
%

    % Calculate the Order for Window-based Filter Design
    width = Ws -Wp;
    N = ceil(8*pi/width);
    % If the Order is Even, Make it Odd
    if mod(N,2)==0 
        N = N + 1;
    end
    
    % Design the Filter Using "fir1"
    Wn = (Ws+Wp)/2;
    H_0 = sqrt(2)*fir1(N,Wn/pi);
    
    % Compute H_1
    H_1 = H_0;
    for i = 1:2:N
        H_1(i) = -H_1(i);
    end
    
    % Compute F_0 and F_1
    F_0 = H_0;
    F_1 = -H_1;
end