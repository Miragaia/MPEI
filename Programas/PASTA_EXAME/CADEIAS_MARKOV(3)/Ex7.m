%Guiao 3 Exercicio 7
%%a
M  =[0 0 0 0 1/3 0;
     1 0 0 0 1/3 0;
     0 1/2 0 1 0 0;
     0 0 1 0 0 0;
     0 1/2 0 0 0 0;
     0 0 0 0 1/3 0;];
sum(M)

N= 6; %numero de estados
Prr = ones(N,1) / N; % criacao do vetor pagerank 
for iter = 1:10
    Prr = M * Prr;
end
fprintf('PageRank: \n')
disp(Prr);

%%b
disp('Spider Trap = C - D');
disp('Dead End = F');

%%c
M2 = M; %nova matriz
M2(:,6) = 1/N; %em todas as linhas na colunas 6 (estado F) adicionar uma "saída" para todos os estados apartir do F
Prr2 = ones(N,1) / N;
for iter = 1:1000
    Prr2 = M2 * Prr2;
end
fprintf('Pagrank com dead-end resolvido: \n')
disp(Prr2);

%%d
B = 0.8;
A = B*M + (1-B)*ones(N)/N; %equacao pagerank(ver resumos)
r = ones(N,1)/N;
for iter = 1:10
    r = A *r;
end
fprintf('Pagrank com ambos os problemas resolvidos \n')
disp(r);

%%e
x0=ones(N,1)/N;
A = B*M + (1-B)*ones(N)/N; %equacao pagerank(ver resumos)
iter=1;
x=x0;
epsilon=1e-4;
while 1
    fprintf(1,'iteração %d\n',iter);
    xold=x;
    x=A*x;
    if max(abs(x-xold))<epsilon 
        break ; 
    end
    iter=iter+1;
end
fprintf("Page rank até à iteração %d: \n", iter);
disp(x);

