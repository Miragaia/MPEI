m= 0.02*100;
pXE = leiPoisson(m,0) +leiPoisson(m,1);
fprintf("P(Erros em cada pagina) = %g\n",pXE);

%ou

lambda=0.02*100;
pk=0;

for k=0:1
    pk= pk + ((lambda^k)/factorial(k))*exp(-lambda);
end 

disp(pk);