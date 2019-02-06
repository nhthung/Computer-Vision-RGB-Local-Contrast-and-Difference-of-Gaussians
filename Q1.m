% Q1.a
%{
C = rgbStripes(256)
image(C)
%}

% Q1.b
numSquares = 4
C = anal(numSquares)
image(C)

function C = anal(numSquares)
    n = numSquares
    squareContainer = 2*n + 7
    imgHeight = 2 * squareContainer
    imgWidth = n * squareContainer
    C = zeros(imgHeight,imgWidth,3)
    
    % Top half white background
    for i = 1:imgHeight/2
        for j = 1:imgWidth
            C(i,j,:) = 1
        end
    end
    
    % Top half squares
    for i = 1:n
        containerStart = (i-1)*squareContainer + 1
        offset = n - i + 3
        squareStart = containerStart + offset - 1
        squareWidth = 2*i + 3
        squareEnd = squareStart + squareWidth - 1
        
        % Red
        C(offset:offset+squareWidth-2,squareStart,2:3) = 0
        C(offset,squareStart:squareEnd-1,2:3) = 0
        
        % Black
        C(offset+1:offset+squareWidth-2,squareStart+1:squareEnd-1,:) = 0
        
        % Cyan
        C(offset+squareWidth-1,squareStart:squareEnd,1) = 0
        C(offset:offset+squareWidth-1,squareEnd,1) = 0
    end
    
    % Bottom half squares
    for i = 1:n
        containerStart = (i-1)*squareContainer + 1
        j = n - i + 1
        offset = n - j + 4
        vertOffset = squareContainer + offset
        squareStart = containerStart + offset - 1
        squareWidth = 2*j + 1
        squareEnd = squareStart + squareWidth - 1
        
        % Red
        C(vertOffset,squareStart:squareEnd,1) = 1
        C(vertOffset:vertOffset+squareWidth-1,squareStart,1) = 1
        
        % White
        C(vertOffset+1:vertOffset+squareWidth-2,squareStart+1:squareEnd-1,:) = 1
        
        % Cyan
        C(vertOffset+squareWidth-1,squareStart+1:squareEnd,2:3) = 1
        C(vertOffset+1:vertOffset+squareWidth-1,squareEnd,2:3) = 1
    end
end