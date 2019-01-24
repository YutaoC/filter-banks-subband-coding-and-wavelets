function I_res = AnaBank_2Ch(I,H_0,H_1)
%
% This function implement the 2-ch analysis filterbank on a image.
%
% I_res = AnaBank_2Ch(I,H_0,H_1)
%
% I - Original image to be filtered(a matrix)
% H_0 - A row vector containing the coefficients of he first filter 
%       in the anslysis filterbank
% H_1 - A row vector containing the coefficients of he first filter 
%       in the anslysis filterbank
% I_res - The resulting image after the filtering(a matrix with the same size of the imput image)
%
% Yutao Chen & Sajani Pallegoda Vithana
% 01/11/2018
%

    % Order of the Filter and Size of the Input Image
    N = length(H_0) - 1;
    [row,col] = size(I); 
    
    % Pad the Image to be able to Avoid Delay
    I_pad = [I fliplr(I)]; 
    
    % Allocate Space for the Filtered Image
    I_L_1 = ones(row,col/2);
    I_H_1 = ones(row,col/2);
    
    for k = 1:row 
        % For Each Row
        x = I_pad(k,:);
        % Filtering
        V_0 = conv(H_0,x);
        V_1 = conv(H_1,x);
        % Throw Away Zeros Caused by Delay
        % Take Only the First Part of the Image
        V_0_new = V_0((N-1)/2+2:row+1+(N-1)/2);
        V_1_new = V_1((N-1)/2+2:row+1+(N-1)/2);
        % Decimate by 2
        I_L_1(k,:) = downsample(V_0_new,2);
        I_H_1(k,:) = downsample(V_1_new,2);
    end
    % Combine the Two Results
    I_first = [I_L_1 I_H_1];

    % Pad the Image to be able to Avoid Delay
    I_first_pad = [I_first; fliplr(I_first')']; 
    
    % Allocate Space for the Filtered Image
    I_L_2 = ones(row/2,col);
    I_H_2 = ones(row/2,col);

    for j = 1:col
        % For Each Column
        x = I_first_pad(:,j);
        % Filtering
        V_0 = conv(H_0,x);
        V_1 = conv(H_1,x);
        % Throw Away Zeros Caused by Delay
        % Take Only the First Part of the Image
        V_0_new = V_0((N-1)/2+2:col+1+(N-1)/2);
        V_1_new = V_1((N-1)/2+2:col+1+(N-1)/2);
        % Decimate by 2
        I_L_2(:,j) = downsample(V_0_new,2);
        I_H_2(:,j) = downsample(V_1_new,2);
    end
    % Combine the Two Results
    I_res = [I_L_2;I_H_2];
end