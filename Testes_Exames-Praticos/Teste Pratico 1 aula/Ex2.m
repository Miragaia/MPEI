%Exercicio 2
L = load('L.mat');
%a
% N= ??; %numero de estadosload("L.mat");
N=100;
%length(find(sum(L) == 0)) 

%b
H = [ones(N,N)]/N;

%c
B= 0.85;
A = B*H + (1-B)*ones(N)/N; %equacao pagerank(ver resumos)

%d

Prr = ones(N,1) / N; % criacao do vetor pagerank 
for iter = 1:N
    Prr = H * Prr;
end
fprintf('PageRank: \n')
disp(Prr)

%e
% Olhar para o PageRank e ver os maiores