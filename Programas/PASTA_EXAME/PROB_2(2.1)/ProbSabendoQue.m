%%Ex1 
N=1e5;
p=0.5; %probablidade
k=1; %nr rapazes
n=2; %nr filhos

%a ter pelo menos 1 rapaz em familia com 2 filhos

lancamentos = rand(n, N) < p;

sucessos = sum(lancamentos)>=k; %pelo menos 1 rapaz

probSimulacaoA = sum(sucessos)/N

%c familia com 2 filhos sabemos que 1 dos filhos é rapaz, probabilidade do OUTRO ser tambem rapaz

%Sabendo que =>  P(A|B)=P(AB)/P(B)

% A - família tem 2 rapazes
% B - família tem pelo menos 1 rapaz

familia = rand(n,N) < p; 
A=sum(familia)>=1; %pelo menos 1 rapaz
B=sum(familia)==2; %2 filhos

probC=sum(A)/sum(B)


%d familia com 2 filhos sabemos que 1 dos filhos é rapaz, probabilidade do SEGUNDO ser tambem rapaz

% P(A|B)
% A - família tem 2 rapazes
% B - o primeiro filho é rapaz

N = 1e5;
n = 2;
p = 0.5;

familias = rand(n,N) < p;

A = sum(familias)==2;
B = familias(1,:);
probD = sum(A)/sum(B)

%e familia com 5 filhos sabendo que pelo menos 1 dos filhos é rapaz, qual a PROB DE OUTRO (E APENAS 1) filho também o ser.

% P(A|B)
% A - família tem pelo menos 1 rapaz
% B - família tem 2 rapazes

N = 1e5;
n = 5;
p = 0.5;

familia = rand(n,N) < p;                

A = sum(familia)>=1; %pelo menos um rapaz
B = sum(familia)==2; %
probE = sum(B)/sum(A)

%f familia com 5 filhos sabendo que pelo menos 1 dos filhos é rapaz qual a PROB DE PELO MENOS OUTRO filho também o ser.

% P(A|B)
% A - família tem pelo menos 1 rapaz
% B - família tem pelo menos 2 rapazes

N = 1e5;
n = 5;
p = 0.5;

familia = rand(n,N) < p;                

A = sum(familia)>=1;
B = sum(familia)>=2;
probF = sum(B)/sum(A)