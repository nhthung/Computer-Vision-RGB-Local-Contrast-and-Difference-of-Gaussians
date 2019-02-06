function I = illusion(squareSize)
%ILLUSION Summary of this function goes here
%   Detailed explanation goes here
    n = squareSize
    h = 7*n
    w = 6*n
    I = zeros(h,w)
    I(:,1:w/2) = 102
    I(:,w/2+1:w) = 204
    I( n*3+1:n*3+n , n+1:2*n ) = 153
    I( n*3+1:n*3+n , 4*n+1:5*n) = 153
    I = cat(3,I,I,I)
end