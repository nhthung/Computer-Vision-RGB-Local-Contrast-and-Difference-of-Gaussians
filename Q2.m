%illusion = imread('illusion.png')

squareSize = 10
I = illusion(squareSize)
size(I)

int = mean(I,3)
sigmaList = [2,5,10,20,50,100]
lmi = localMeanIntensity(int, sigmaList)
lc = localContrast(int,lmi)

figure
h = []
for i = 1:6
    h(i) = subplot(3,2,i)
    image(lc(:,:,i),'CDataMapping','scaled','Parent',h(i))
    colorbar
end

function lc = localContrast(int,lmi)
    sz = size(lmi)
    h = sz(1)
    w = sz(2)
    n = sz(3)
    lc = zeros(h,w,n)
    for i = 1:n       
        lc(:,:,i) = (int - lmi(:,:,i)) ./ lmi(:,:,i)
    end
end

function I = localMeanIntensity(int, sigmaList)
    n = length(sigmaList)
    sz = size(int)
    h = sz(1)
    w = sz(2)
    I = zeros(h,w,n)
    for i = 1:n
        I(:,:,i) = imgaussfilt(int, sigmaList(i))
    end
end