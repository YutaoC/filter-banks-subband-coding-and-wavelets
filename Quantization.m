function I_q = Quantization(I,bits)
%
% This function calculate the quantized image using linear quantization.
%
% I_q = Quantization(I)
%
% I - The image to be quantized(a matrix)
% bits - The number of bits you want to allocate to each subimages(a vector of length 4)
%        bits(1) -> the top left corner subimage
%        bits(2) -> the top right corner subimage
%        bits(3) -> the lower left corner subimage
%        bits(4) -> the lower right corner subimage
% I_q - Quantized image(a matrix)
%
% Sajani Pallegoda Vithana & Yutao Chen
% 01/11/2018
%

    % The Size of Input Image
    [S,~] = size(I);
    % The Size of Output Image
    I_q = ones(S,S);
    
    %for every subimage
    for i = 1:4
        % Take Different Part of the Image to Do Quantization
        bi = de2bi(i-1,2);
        m = (S/2)*bi(1);
        n = (S/2)*bi(2);
        I_tmp = I(1+m:S/2+m,1+n:S/2+n);
        
        % Reshape to a Vector
        I_vec_tmp = reshape(I_tmp,[(S/2)^2,1]);
        % Allocate Space
        data_new = ones(1,(S/2)^2);
        
        % Compute the Maximun Value of the Image
        maxx = max(I_vec_tmp);
        % Compute the Minimum Value of the Image
        minn = min(I_vec_tmp);
        % Computer the Range and the Step Size
        range = maxx-minn;
        b=2^bits(i);
        step=range/b;
        
        % Compute ALL the Posssible Value
        Q = ones(1,b);
        for j=1:b
            Q(j)=minn+(j-1)*step;
        end
        
        for k=1:(S/2)^2
            % For every Pixel in the Image
            e = abs(Q-(I_vec_tmp(k)));
            % Compute the Nearest Value's Indice
            [~,q_id] = min(e);
            % New Quantized Value
            data_new(k) = (q_id-1)*step+minn;
        end
        
            % Reshape and Update
            data=reshape(data_new,[S/2,S/2]);
            I_q(1+m:S/2+m,1+n:S/2+n) = data;
    end
end