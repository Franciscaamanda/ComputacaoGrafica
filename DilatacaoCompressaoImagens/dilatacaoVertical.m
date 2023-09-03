function dilatacaoVertical(x,Pv)
  
x_gray= double(rgb2gray(x))/255;

L = length(x_gray(:,1)); #667
C = length(x_gray(1,:)); #1000

z = zeros((L*Pv),1);
s=length(L*Pv);

N=Pv;

w = ones(N,1)/N;
for i=1:L
  for j=1:C
      z((i*Pv),j)=x_gray(i,j);
  end
end

y = conv2(z,w,'same');
imshow(y);