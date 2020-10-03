%--------------------------------------------------------------------------
%                 IMAGE COMPRESSION ON JPG FORMAT
%
% Author: Daniel Lapido Martínez
% 
% This function reads an image on jpg format that must be in the working
% directory. It displays on screen the compressed image and it returns the 
% matrices U sigma and V in the most reduced format for its posterior
% manipulation.

% The inputs of the function are the following:
%  
%      1 - Name of the jpg file that contains the image between simple
%      quotation marks.
%      2 - Number of singular values (p) that want to be taken into account
% 
% The function reads the image and converts it into an array of dimensions
% mxnx3, that is three matrices of order m x n, each one with the pixels'
% information in an RGB color (red, green & blue) in int8 format.
%
% Integers are converted into double-precision for the svd decomposition
% of each one of the matrices. The necesary columns are chosen acording
% with the selected number of singular values
%
% Afterwards, the m x n x 3 matrix is rebuilt with the matrices of the
% decomposition. They are converted into int8 format and the compressed
% image is shown. It is returned:
%
%
%       1- Matrix UC of order m x p with the p first left singular vectors.
%
%       2- Matrix sigmaC of dimension p x 3 whose rows are the p largest 
%           singular values of the matrices of each color to build the 
%           three diagonal matrices p x p with the diag comand.
%
%       3- Matrix VC of order n x p with the first p right singular
%       vectors.
% 
%
%--------------------------------------------------------------------------


function [UC, sigmaC, VC] = compress(imjpg, p)

%Checking that the input arguments are appropiate. imjpg must be a string
% and p must be a positive real number
        
    if not (isreal(p) & (p > 0))
        disp('THE NUMBER OF SINGULAR VALUES MUST BE POSITIVE');
        UC = '???';
        sigmaC = '???';
        VC = '???';
        return;
    end;
    
    p = int16(p);
    
    photo = imread(imjpg,'jpg');
    res = size(photo);
    resmin = min(res(1:2));
    
    if res < p
        disp('THE NUMBER OF SINGULAR VALUES MUST BE');
        disp('COMPATIBLE WITH THE IMAGE RESOLUTION');
        UC = '???';
        sigmaC = '???';
        VC = '???';
        return;
    end;

% For the singular value decomposition, the array must contain integers 

   %f2 = double(photo) + 1; 
   f2 = double(photo); 
   
   for k = 1:3
   
        [U(:,:,k), sigma(:,:,k), V(:,:,k)] = svd(f2(:,:,k));
        
   end;
   
   for k = 1:3
   
        f2r(:, :, k) = U(:, 1:p, k) * sigma(1:p, 1:p, k) * V(:, 1:p, k)';
        
   end;
   
   %image(uint8(round(f2r - 1)))
   image(uint8(round(f2r)))
   
   for j = 1:3
       
        for k = 1:p
       
            sigmaC(k, j) = sigma(k, k, j);
       
        end;
        
   end;
   
   UC = U;
   
   VC = V;
   
   clear k j f2r U V sigma f2; 
    
end