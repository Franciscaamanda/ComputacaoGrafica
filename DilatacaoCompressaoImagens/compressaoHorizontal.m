function compressaoHorizontal(x,Qh)

x_gray= double(rgb2gray(x))/255;

L = length(x_gray(:,1)); #667
C = length(x_gray(1,:)); #1000

N=Qh;
w = [ [ (1./N):(1./N):1 ] [ ((N-1)./N):(-1./N):(1./N) ] ];

z = conv2(x_gray,w);

tirar_zeros = zeros(L, int64(C/Qh));

d= double(tirar_zeros);

for i=1:L
  for j=1:C
    d(i,int64(j/Qh)+1) = z(i,j);
  end
end
imshow(d/Qh);