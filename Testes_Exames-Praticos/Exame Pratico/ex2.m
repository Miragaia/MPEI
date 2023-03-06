fprintf("a\n")
palavrasAdd = 300;
k = 1;
size = round(-palavrasAdd/log(0.97));
fprintf("Tamanho filtro: %d\n", size);

fprintf("b\n")
bloomFilter=inicializarFiltro(size);
N = 1e4;
chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
codes = cell(1,N);

falsos_positivos=0;

for i= 1:N
    if pertenceConjunto(bloomFilter,codes{i},k)
        falsos_positivos = falsos_positivos+1;
    end
end
falsos_positivos
fprintf("Percentagem de falsos positivos %f%%\n",(falsos_positivos/length(codes))*100);