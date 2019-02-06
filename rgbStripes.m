function C = rgbStripes(width)
    C = zeros(3,width,3);
    
    topFun = @(x) (width-x)/(width-1)
    midFunR = @(x) (2*width - x - 1)/(2*width - 2)
    midFunGB = @(x) (x-1)/(2*width - 2)
    botFunR = @(x) topFun(x)
    botFunG = @(x) (x-1)/(width-1)
    
    for i = 1:width
        C(1,i,1) = topFun(i)
        C(2,i,1) = midFunR(i)
        C(2,i,2) = midFunGB(i)
        C(2,i,3) = midFunGB(i)
        C(3,i,1) = botFunR(i)
        C(3,i,2) = botFunG(i)
    end
end