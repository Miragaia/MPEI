%Guiao 4
%Exercicio 1
alfabeto_min = 'a':'z'
alfabeto_mai = 'A':'Z'
num = '0':'9'
alfabetonum = [alfabeto_min  alfabeto_mai  num]

N=10;
imin= 2;
imax= 6;
%Tamanho da String
comprimento = randi([imin,imax],1,N)
%Criar a String
for i=1:N
    x= randi([1,length(alfabetonum)],1,comprimento(i));
    word = alfabetonum(x);
    fprintf(1,"%3d,%3d - %s\n",i,comprimento(i),word)
end
