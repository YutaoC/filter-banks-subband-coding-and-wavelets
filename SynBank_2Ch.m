function I_res = SynBank_2Ch(I,F_0,F_1)
%
% This function implement the 2-ch synthesis filterbank on a image.
%
% I_res = SynBank_2Ch(I,F_0,F_1)
%
% I - Original image to be filtered(a matrix)
% F_0 - A row vector containing the coefficients of he first filter 
%       in the synthesis filterbank
% F_1 - A row vector containing the coefficients of he first filter 
%       in the synthesis filterbank
% I_res - The resulting image after the filtering(a matrix)
%
% Sajani Pallegoda Vithana & Yutao Chen 
% 01/11/2018
%

    % Order of the Filter and Size of the Input Image
    N = length(F_0) - 1;
    [row,col] = size(I);
    
    % Allocate Space for the Filtered Image
    I_L_1 = ones(row,col);
    I_H_1 = ones(row,col);
    
    % Pad the Image to be able to Avoid Delay
    x_1 = [I(:,1:col/2) fliplr(I(:,1:col/2))];
    x_2 = [I(:,col/2+1:end) fliplr(I(:,col/2+1:end))];
    
    for j = 1:row
        % For Each Row
        x_pad_1 = x_1(j,:);
        x_pad_2 = x_2(j,:);
        % Expand the Signal by 2
        x_e_1 = upsample(x_pad_1,2);
        x_e_2 = upsample(x_pad_2,2);
        % Filtering
        V_0 = conv(F_0,x_e_1);
        V_1 = conv(F_1,x_e_2);
        % Throw Away Zeros Caused by Delay
        % Take Only the First Part of the Image
        I_L_1(j,:) = V_0((N-1)/2+1:(N-1)/2+row);
        I_H_1(j,:) = V_1((N-1)/2+1:(N-1)/2+row); 
    end
    % Combine the Results
    I_first = I_L_1 + I_H_1;
    
    % Allocate Space for the Filtered Image
    I_L_2 = ones(row,col);
    I_H_2 = ones(row,col);
    
    % Pad the Image to be able to Avoid Delay
    x_1 = [I_first((1:row/2),:); fliplr(I_first((1:row/2),:)')'];
    x_2 = [I_first(row/2+1:end,:); fliplr(I_first(row/2+1:end,:)')'];
    
    for j = 1:col
        % For Each Column
        x_pad_1 = x_1(:,j);
        x_pad_2 = x_2(:,j);
        % Expand the Signal by 2
        x_e_1 = upsample(x_pad_1,2);
        x_e_2 = upsample(x_pad_2,2);
        % Filtering
        V_0 = conv(F_0,x_e_1);
        V_1 = conv(F_1,x_e_2);
        % Throw Away Zeros Caused by Delay
        % Take Only the First Part of the Image
        I_L_2(:,j) = V_0((N-1)/2+1:(N-1)/2+row);
        I_H_2(:,j) = V_1((N-1)/2+1:(N-1)/2+row);
    end
    % Combine the Result
    I_res = I_L_2 + I_H_2;
end