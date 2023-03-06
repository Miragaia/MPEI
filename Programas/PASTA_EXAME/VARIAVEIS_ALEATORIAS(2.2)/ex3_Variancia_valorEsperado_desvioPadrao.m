%3 a)
Sx = 0:4;

N = 1e6;
p = 1/2;
exp = rand(4,N) < p;

num0 = sum(sum(exp) == 0);
num1 = sum(sum(exp) == 1);
num2 = sum(sum(exp) == 2);
num3 = sum(sum(exp) == 3);
num4 = sum(sum(exp) == 4);

prob0 = num0/N;
prob1 = num1/N;
prob2 = num2/N;
prob3 = num3/N;
prob4 = num4/N;


fprintf("Px(0)= %.6f\nPx(1)= %.6f\nPx(2)= %.6f\nPx(3)= %.6f\nPx(4)= %.6f\n", prob0, prob1, prob2, prob3, prob4)

%b)
Sx = 0:4;

N = 1e6;
p = 1/2;
exp = rand(4,N) < p;

num0 = sum(sum(exp) == 0);
num1 = sum(sum(exp) == 1);
num2 = sum(sum(exp) == 2);
num3 = sum(sum(exp) == 3);
num4 = sum(sum(exp) == 4);

prob0 = num0/N; 
prob1 = num1/N;
prob2 = num2/N;
prob3 = num3/N;
prob4 = num4/N;

probs = [prob0 prob1 prob2 prob3 prob4];

media = sum(Sx.*probs);
var = sum((Sx.^2).*probs) - (media.^2);
desvio_padrao = sqrt(var);

fprintf("Valor Esperado = %.6f \nVariância = %.6f \nDesvio padrão = %.6f\n", media, var, desvio_padrao)

%d)
p = 1/2;

prob0Teo = prob_teorica(0, 4, p);
prob1Teo = prob_teorica(1, 4, p);
prob2Teo = prob_teorica(2, 4, p);
prob3Teo = prob_teorica(3, 4, p);
prob4Teo = prob_teorica(4, 4, p);

fprintf("Px(0)= %.6f\nPx(1)= %.6f\nPx(2)= %.6f\nPx(3)= %.6f\nPx(4)= %.6f\n", prob0Teo, prob1Teo, prob2Teo, prob3Teo, prob4Teo)

%e)
Sx = 0:4;
p = 1/2;

prob0Teo = prob_teorica(0, 4, p);
prob1Teo = prob_teorica(1, 4, p);
prob2Teo = prob_teorica(2, 4, p);
prob3Teo = prob_teorica(3, 4, p);
prob4Teo = prob_teorica(4, 4, p);

probsTeo = [prob0Teo prob1Teo prob2Teo prob3Teo prob4Teo];

mediaTeo = sum(Sx.*probsTeo);
varTeo = sum((Sx.^2).*probsTeo) - (mediaTeo.^2);
desvio_padraoTeo = sqrt(varTeo);

fprintf("Valor Esperado = %.6f \nVariância = %.6f \nDesvio padrão = %.6f\n", mediaTeo, varTeo, desvio_padraoTeo)