%Guiao 3 Exercicio 5
%%a
T = [0.7 0.2 0.3;
     0.2 0.3 0.3;
     0.1 0.5 0.4];
sum(T)
%%b
%sol 2 dia e terceiro sabendo que está sol no dia 1 (P (Sol2 Sol3 |Sol1)
%P(Sol1) * P(Sol1 -> Sol2) * P(Sol2 -> Sol3)
% 1 * T(1,1) * T(1,1)
VA = [1;
     0;
     0];
V2 = T*VA;
V3 = (T^2)*VA;
prob= V2(1)* V3(1)

%%c
%P(Sol1) * P(Sol1 -> nuvens/sol) * P(nuvens/sol -> nuvens/sol)
V2 = T*VA;
V3 = (T^2)*VA;
prob2nchover= V2(1)+V2(2)
prob3nchover = V3(1)+V3(2)
prob2e3nchover = prob2nchover * prob3nchover

%%d
diaSol =1;
diaNuvens = 0;
diaChuva =0;
V = [1 0 0]';
for i=2:31
    V = T*V;
    diaSol = diaSol + V(1);  
    diaNuvens = diaNuvens + V(2);
    diaChuva = diaChuva + V(3);
end
diaSol
diaNuvens
diaChuva

%%e
V = [0 0 1]';
diaSol2 =1;
diaNuvens2 = 0;
diaChuva2 =0;
for i=2:31
    V = T*V;
    diaSol2 = diaSol2 + V(1);  
    diaNuvens2 = diaNuvens2 + V(2);
    diaChuva2 = diaChuva2 + V(3);
end
diaSol2
diaNuvens2
diaChuva2
disp("Existem em media mais ao menos os mesmos dias de cada estado de tempo sendo a diferenca veridicada que é mais provavel existir um dia de chuva e nuvens quando o primeiro é dia de chuva e menos dias de sol ")

%%f
V=[1 0 0]';
Dores= [0.1 0.3 0.5]';
diaSol =1;
diaNuvens = 0;
diaChuva =0;
for i=2:31
    V = T*V;
    diaSol = diaSol + V(1);  
    diaNuvens = diaNuvens + V(2);
    diaChuva = diaChuva + V(3);
end
diaSoldoresdores = diaSol * Dores(1)
diaNuvensdores = diaNuvens * Dores(2)
diaChuvadores = diaChuva * Dores(3)
