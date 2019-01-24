I = imread('Lena.bmp'); % Read the Image
I = im2double(I); % Convert to Double
[S,~] = size(I); % Compute the Size of the Image
M = 2^4; % The Number of Bits You Want to Use
I_s = sort(I(:)); % Sorted Vector of the Image
I_v = reshape(I(:),1,S^2); % Reshape the Rmage to a Vector
Edges = zeros(1,M);
for i=1:M
   Edges(i) = I_s(S/M*(i-1)+1); % Calculate the Edges
end
for j = 1:S^2
   for k = 1:M
      if I_v(j) - Edges(k) < 0 % If Less Than a Edge
          I_v(j) = Edges(k); % Set the Vaule to the Value of This Edge 
          break % Only Find the Smallest one that Satisfies the Condition
      end
   end
end
I_q = reshape(I_v,S,S); % Reshape to a Image
imshow(I_q); % Shoe the Image
