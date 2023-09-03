function atividade2(x,Ph,Pv,Qh,Qv)
#Compressão e Dilatação de imagens na horizontal e na vertical
#x: imagem
#Ph: fator de dilatação na horizontal
#Pv: fator de dilatação na vertical
#Qh: fator de compressão na horizontal
#Qv: fator de compressão na horizontal
x_gray= double(rgb2gray(x))/255;

L = length(x_gray(:,1)); #667
C = length(x_gray(1,:)); #1000

z = zeros(1,Ph*C);

N=Ph;
w = [ [ (1./N):(1./N):1 ] [ ((N-1)./N):(-1./N):(1./N) ] ];

for i=1:L
  for j=1:C
    z((i),(j*Ph))=x_gray(i,j);
  end
end

y = conv2(z,w,'same');

L = length(y(:,1)); #667
C = length(y(1,:)); #3000

N=Qh;
w = [ [ (1./N):(1./N):1 ] [ ((N-1)./N):(-1./N):(1./N) ] ];

z = conv2(y,w);

tirar_zeros = zeros(L, int64(C/Qh));

d= double(tirar_zeros);

for i=1:L
  for j=1:C
    d(i,int64(j/Qh)+1) = z(i,j);
  end
end

img = d/Qh;

L = length(img(:,1)); #667
C = length(img(1,:)); #1500

z = zeros((L*Pv),1);

N=Pv;

w = ones(N,1)/N;
for i=1:L
  for j=1:C
      z((i*Pv),j)=img(i,j);
  end
end

y = conv2(z,w,'same');

L = length(y(:,1)); #2668
C = length(y(1,:)); #1500

N=Qv;
w = [ [ (1./N):(1./N):1 ] [ ((N-1)./N):(-1./N):(1./N) ] ];

z = conv2(y,w);

tirar_zeros = zeros(int64(L/Qv), C);

d= double(tirar_zeros);

for i=1:L
  for j=1:C
    d(int64(i/Qv)+1,j) = z(i,j);
  end
end

imshow(d/Qv);
