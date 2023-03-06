%%Ex3
%%a
T = zeros(20,20); %criar a matriz de 20 estados
for k= 1: 20
    row = rand(20,1); %criar a coluna atraves da funct rand()
    row = row/ sum(row); %passar os valores a probabilidades (divisao do valor especifico de rand por o numero total de valores rand)
    T(:,k) = row; %atribuir o valor a cada linha de acordo com o valor k da coluna
end

disp(T);
sum(T)
disp("É estocástica pois não temos entradas negativas e a soma de cada coluna dá sempre 1");

%%b
vx0 = zeros(1,20)';
vx0(1) = 1; %criar vetor com 20 estados e estar no primeiro

vx2 = (T^2)*vx0    %duas transicoes apos estar no estado 1
resposta2 = vx2(20)

vx5 = (T^5)*vx0; %cinco transicoes apos estar no estado 1
resposta5 = vx5(20)

vx10 = (T^10)*vx0;  %dez transicoes apos estar no estado 1
resposta10 = vx10(20)

vx100 = (T^100)*vx0;  %cem transicoes apos estar no estado 1
resposta100 = vx100(20) 