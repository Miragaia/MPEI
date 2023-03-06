%%a
x = [1,2,3,4,5,6]; % X=1:6;mesma coisa, usada para valores maiores
fx = ones(1,6)/6;  %(elemesntos, numero de elementos
%funcao massa-probabilidade para cada valor possivel apresentar a massa

figure(1)
subplot(1,2,1)  %selecioanr a area (linhas,coluans,qual area selecionar)
stem(x,fx)
xlim([0,7])
grid on

%%b
subplot(1,2,2)

px= cumsum(fx);
stairs([0 x 7],[0 px 1.1])
grid on