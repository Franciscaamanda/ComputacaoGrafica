function penduloSimples(R,i0,j0,i1,j1,ic,jc,theta0,g,l)
#Função para movimentar o pêndulo:
t = 10;
for n=1:50:150
  theta1 = theta0 * cos(t*sqrt(g/l));
  theta = (pi.*theta1)./180;
    x = i1 + round(cos(theta));
    y = j1 + int64(sin(theta))-n;
    X = pendulo(R,i0,j0,x,y,x,y,theta0,g,l);
    pause(1);
endfor   