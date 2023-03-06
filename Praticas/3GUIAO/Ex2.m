%%Ex2
T = [1/3 1/4 0;
     1/3 11/20 1/2;
     1/3 1/5 1/2]
format rat %mostra a matriz com fracoes

%%a 
sum(T)
T>= 0 & T<=1

%% b)
v = [60 15 15]/90; %fazer um esquema: a+b+c=90
                   %                  a=2(b+c)
                   %                  b=c
%% c)
v0=[60 15 15]'/90;
v30=T^30 * v0; %há 30 vezes a transição
format short
n1= v30*90

%% d)
v0=[30 30 30]'/90;
v30=T^30 * v0; %há 30 vezes a transição
format short
n2= v30*90