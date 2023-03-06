clear all
%Guiao 3 Exercicio 4
%%a
p = 0.4;
q = 0.6;

T = [p^2,0,0,q^2;
    (1-p)^2,0,0, q*(1-q);
     p*(1-p),0,0,q*(1-q);
     p*(1-p),1,1,(1-q)^2];  %nao gosto desta maneira fazer sem as virgulas (andre)
sum(T)

V=[1 0 0 0]';  %assumir que estamos no estado A
%%b
T5 = T^5;
V5 = T5 *V  %vetor com as probabilidades de estar em cada estado apos 5 transicoes

T10 = T^10;
V10 = T10 *V  %vetor com as probabilidades de estar em cada estado apos 100 transicoes

T100 = T^100;
V100 = T100 *V  %vetor com as probabilidades de estar em cada estado apos 100 transicoes

T200 = T^200;
V200 = T200 * V %vetor com as probabilidades de estar em cada estado apos 200 transicoes


%%c MATRIZ NO LIMITE DE CADA ESTADO
Y = [T - eye(size(T));ones(1,4)];
sum(Y)
Y
B= [zeros(4,1);1];
U = Y\B   %Valor Teorico vetor estacionario



