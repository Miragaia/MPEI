%%a
k = 0;  %# de mensagens que queremos que o computador receba num segundo
m= 15;
pX0 = leiPoisson(m,k);
fprintf("P(O computador nao recebe mensagens) = %g\n",pX0);

%%b
p =zeros(1,11);
m= 15;
for k= 0:10
    i = k+1;
    p(i)= leiPoisson(m,k);
end

pX10ouMenos = sum(p);
pXmaisDe10 = 1-pX10ouMenos;
fprintf("P(O computador recebe mais de 10 mensagens) = %f\n",pXmaisDe10);
    
