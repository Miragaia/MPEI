%Exercicios Suplementares
%Ex3
%a)
T = [0 1/2 1/2 0 1/4 0;
     1 0 0 0 1/4 0;
     0 0 0 1 1/4 0;
     0 0 1/2 0 1/4 1;
     0 0 0 0 0 0;
     0 1/2 0 0 0 0];

B = 0.85;
A = B*T + (1-B)*ones(6,6)*(1/6);

pg = ones(1,6)'*1/6;

pg1 = pg;

while(true)
    pg2 = A*pg1;
    if abs(pg2-pg1)<0.01
        break
    end
    pg1 = pg2;
end
disp(pg2)
fprintf("O maior pageRank é: %f\n", pg2(3));
fprintf("O menor pageRank é: %f\n", pg2(5));