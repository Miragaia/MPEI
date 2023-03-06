x1=0.2;
x3=0.3;
x4=0.1;
x5=0.45;
fprintf("a\n");
T = [ 0 0 0 0 0 0;
     x1 0 0 0 0 0;
     0 0 0 x4 x5 0;
     0 0 x3 0 1-x5 0;
     1-x1 1 1-x3 0 0 0;
     0 0 0 1-x4 0 1;]

fprintf("para confirmar:");
sum(T)

fprintf("b\n");
fprintf("como começa no estado 1:");
v = [1 0 0 0 0 0]'
fprintf("3 passos até à meta (5,4,M)");
probabilidade = T^3*v
fprintf("probabilidade de chegar à meta em 3 passos: %f\n",probabilidade(6));

fprintf("c\n");

FCanonica = T([1 2 3 4 5 6], [1 5 3 4 2 6])
nena= 4 %numero de estados nao absorventes
Q = FCanonica(1:nena, 1:nena)
I = eye(length(Q))
Fundamental = inv(I-Q)
N = 1e4;
soma = 0;
for i = 1:N
    seq = crawl(T,1,6);
    soma = soma + length(seq);
end
fprintf("numero medio de casas percorridas: %f\n", soma/N);




