% Q3.a

squareSize = 5
I = illusion(squareSize)

% Intensity image
int = mean(I,3)

% With these sigmas, the on-center is roughly the same size as the square
sigma1 = 2
sigma2 = 4
on = @(x,y) normpdf(x,0,sigma1) * normpdf(y,0,sigma1)
off = @(x,y) normpdf(x,0,sigma2) * normpdf(y,0,sigma2)
dog1 = @(x,y) dog(x,y,on,off)

%{
C = convo(dog1,int)
image(C,'CDataMapping','scaled')
colorbar
%}

% Q3.b
dogR = @(x,y) dog1(x,y)
dogG = @(x,y) dog(x,y,off,on)

% Double-opponent cell on greyscale optical illusion
%{
C2 = convo2(dogR,dogG,I)
C2 = C3(:,:,1) + C3(:,:,2)
image(C2)
colorbar
%}

I2 = zeros(15,30,3)
stripe = rgbStripes(30)
stripe = stripe(3,:,:)
for i = 1:15
    I2(i,:,:) = stripe
end
I2(6:10,6:10,:) = 153/255
I2(6:10,21:25,:) = 153/255

%{
C3 = convo2(dogR,dogG,I2)
C3 = C3(:,:,1) + C3(:,:,2)
imagesc(C3)
colorbar
%}

% Q3.c
N = 30
s = @(x,k) 1/2 * (1 + sin(2*pi/N * k * x))

n = 10
rmsList = zeros(1,n)

I3 = zeros(N/2,N)
x = [1:1:N]
for k = 1:n
    for i = 1:N/2
        I3(i,:) = s(x,k)
    end
    C4 = convo(dog1,I3)
    rmsList(k) = sum(rms(C4))
end

figure
k = [1:1:n]
plot(k,rmsList(k))

function z = dog(x,y,on,off)
    z = on(x,y) - off(x,y)
end

function C = convo(f,I)
    sz = size(I)
    h = sz(1)
    w = sz(2)
    C = zeros(h,w)
    for i = 1:h
        for j = 1:w
            sum = 0
            for y = 1:h
                for x = 1:w
                    sum = sum + f(i-y,j-x)*I(y,x)
                end
            end
            C(i,j) = sum
        end
    end
end

function C = convo2(f1,f2,I)
    sz = size(I)
    h = sz(1)
    w = sz(2)
    C = zeros(h,w,3)
    C(:,:,1) = convo(f1,I(:,:,1))
    C(:,:,2) = convo(f2,I(:,:,2))
end


