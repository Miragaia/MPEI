%Guia0 4
%Exerciio 2
ficheiro=fopen("wordlist-preao-20201103.txt");
palavras=textscan(ficheiro,"%s",'delimiter','\n');
palavras=palavras{1};
fclose(ficheiro);

n=8000;
k=3;
chaves=palavras(1:1000);

filtro=inicializarFiltro(n);

for i=1:length(chaves)
    filtro=inserirElemento(filtro,chaves{i},k);
end


ativacao_falso_negativos = 0;

for i= 1:length(chaves)
    if ~pertenceConjunto(filtro,chaves{i},k)
        ativacao_falso_negativos = 1;
    end
end

if ativacao_falso_negativos == 1
    fprintf("Exsite um falso negativo\n");
else
    fprintf("Não existe um falso negativo\n");
end