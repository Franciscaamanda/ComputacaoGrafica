function y = pendulo(R,i0,j0,i1,j1,ic,jc,theta0,g,l)
#Desenho do pendulo simples
#R: raio
#g: gravidade
#l: comprimento
#theta0: ângulo inicial
#ic e jc: centro do círculo
#i0 e j0: coordenadas iniciais do segmento de reta
#i1 d j1: ponto final do segmento de reta

X = zeros(300,300);

deltaI = i1-i0;
deltaJ = j1-j0;

if deltaJ > deltaI
  for j= j0:j1
    i = i0 + (deltaI/deltaJ)*(j-j0);
    X(i,j) = 1;
  endfor
else
  for i= i0:i1
    j = j0 + (deltaJ/deltaI)*(i-i0);
    X(i,j) = 1;
  endfor
end

for deltaI = -R:R
  i = ic + deltaI;
  L = round(sqrt(R.^2 - (deltaI).^2));
  for j =jc-L:jc+L
      X(i,j)=1; 
  endfor
endfor

y = imshow(X);
