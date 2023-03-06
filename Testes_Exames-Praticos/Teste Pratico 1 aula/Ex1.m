%Exercicio 1
%b
T = [0.1 0.3 0.3 0.3;
    0.25 0.25 0.25 0.25;
    0.2 0.2 0.4 0.2;
    0.25 0.25 0.25 0.25]';
sum(T)

%c
V=[1/4 1/4 1/4 1/4]'; 
T_7 = (T^7)*V;
fprintf("setima")
T_7(2) %Floresta

%d
Y = [T - eye(size(T));ones(1,4)];
sum(Y)
B= [zeros(4,1);1]
U = Y\B   %Valor Teorico vetor estacionario
U(2)

%e
V=[1/4 1/4 1/4 1/4]';
T_1 = T*V;
fprintf("Deserto em 1")
T_1(3)
T_2 = (T^2)*V;
fprintf("Deserto em 2")
T_2(3)
T_4 = (T^4)*V;
fprintf("Urbano em 4")
T_4(4)
T_5 = (T^5)*V;
fprintf("Urbano em 5")
T_5(4)
fprintf("Probabilidade total")
prob= T_1(3) * T_2(3) *T_4(4) * T_5(4)
