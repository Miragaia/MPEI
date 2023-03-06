pdef = 1/1000;
n = 8000;   
k = 7;
%%a
nCk = prod(n:-1:n-k+1)/prod(1:k);
pB = nCk * pdef^k * (1-pdef)^(n-k);
disp("Usando a binomial:");
fprintf("P(7 defeituosos) = %f\n",pB);
%ou usamos a do andre
probt=prob_teorica(7,8000,0.001)

%%b

%pk = a^k/k! * e^-alfa ; onde alfa = media = n * p


m = 8 ; %media = (8000 * 1/1000) = 8 
k = 7 ;

pP = leiPoisson(m,k);
fprintf("P(7 defeituosos teorico(Poisson)) = %f\n",pP);
