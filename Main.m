%% Filter Bank Design
Wp = 0.425*pi; % Passband
Ws = 0.612*pi; % Stopband
[H_0,H_1,F_0,F_1] = FIR(Ws,Wp); %Design the Filters
%% Read the Image and Computer the size
I = imread('Lena.bmp'); % Read the Image
I = im2double(I); % Convert to Double
[S,~] = size(I); % Compute the Size of the Image
%% 2-Ch Analysis Filter Bank
I_tmp = AnaBank_2Ch(I,H_0,H_1); % 1st Filtering

%%%%%Decomposing the Already Decomposed Sub-bands Further%%%%%
I_LL = I_tmp(1:S/2,1:S/2); % Take the Low-Low Part
DR = max(I_LL(:)) - min(I_LL(:)); % Compute the Dynamic Range
I_ana_2 = AnaBank_2Ch(I_LL,H_0,H_1); % 2nd Filtering
I_tmp(1:S/2,1:S/2) = I_ana_2; %Combine the result
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Quantization

%%%%%%%%%Quantization for the Further Decompased part%%%%%%%%%
bits = [8 4 4 2]; % The Bits Allocated to Each Subimage
I_q_tmp = Quantization(I_tmp(1:S/2,1:S/2),bits); % 1st Quantization
I_tmp(1:S/2,1:S/2) = I_q_tmp; %Update the Value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bits = [8 4 4 2]; % The Bits Allocated to Each Subimage
I_q = Quantization(I_tmp,bits); % 2nd Quantization
%% 2-Ch Synthesis Filter Bank

%%%%%%%%%Synthesis the Further Decompased part%%%%%%%%%
I_LL = I_q(1:S/2,1:S/2); % Take the Low_Low Part
I_syn_1 = SynBank_2Ch(I_LL,F_0,F_1); % First Filtering
I_q(1:S/2,1:S/2) = I_syn_1; % Combine the Result
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I_1 = SynBank_2Ch(I_q,F_0,F_1); % Second Filtering
%% Show the result
figure;imshow(I_1,[]); % Show the Image