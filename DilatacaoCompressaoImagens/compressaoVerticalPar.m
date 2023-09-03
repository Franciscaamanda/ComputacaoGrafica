function compressaoVerticalPar(x,Qv)

x_gray= double(rgb2gray(x))/255;

L = length(x_gray(:,1)); #667
C = length(x_gray(1,:)); #1000

N=Qv;
w = [ [ (1./N):(1./N):1 ] [ ((N-1)./N):(-1./N):(1./N) ] ];

z = conv2(x_gray,w);

tirar_zeros = zeros(int64(L/Qv), C);

d= double(tirar_zeros);

for i=1:L
  for j=1:C
    d(int64(i/Qv)+1,j) = z(i,j);
  end
end

imshow(d/Qv);
