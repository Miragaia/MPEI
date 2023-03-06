%Exercicios Suplementares
%Ex2
%a)
T = [0 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0.5 0 0 0 0 0 0;
     0 1/3 0 0.2 0.1 0 0;
     0 1/3 0.6 0.5 0.4 0.6 0;
     0 1/3 0.4 0 0.3 0 0;
     0 0 0 0.3 0.2 0.4 0];

%b)
N = 1e5;
CasosF = 0;
 
for n = 1:N
    state = crawl(T, 2, 7);
    if length(state) == 7 
        if state(end-1) == 6
            CasosF = CasosF + 1;
        end
    end
end

p = CasosF/N;

fprintf("Probabilidade de ter 7 digitos e terminar no nº9: %f \n", p);

%c)
CasosF2 = 0;

for n = 1:N
    state = crawl(T, 2, 7);
    if length(state) == 7
        CasosF2 = CasosF2 + 1;
    end

end

p2 = CasosF2/N;

fprintf("Probabilidade de ter 7 digitos: %f \n", p2);
