%Exercicios Suplementares
%Ex1
%a)
T = [0.8 0 0 0.3 0;   
    0.2 0.6 0 0.2 0;   
    0 0.3 1 0 0;       
    0 0.1 0 0.4 0;
    0 0 0 0.1 1];

N = 1e5;
Soma1 = 0;
Soma2 = 0;
Soma4 = 0;
contador3 = 0;
contador5 = 0;

for n = 1:N
    estado1 = crawl(T, 1, [3,5]);
    estado2 = crawl(T, 2, [3,5]);
    estado4 = crawl(T, 4, [3,5]);
    
    if estado1(end) == 3
        contador3 = contador3 + 1;
    end
    if estado1(end) == 5
        contador5 = contador5 + 1;
    end

    Soma1 = Soma1 + length(estado1)-1;
    Soma2 = Soma2 + length(estado2)-1;
    Soma4 = Soma4 + length(estado4)-1;
end

E1 = Soma1/N;
E2 = Soma2/N;
E4 = Soma4/N;

fprintf("Nº passos a começar em 1: %f\n", E1);
fprintf("Nº passos a começar em 2: %f\n", E2);
fprintf("Nº passos a começar em 4: %f\n", E4);

p3 = contador3/N;
p5 = contador5/N;

fprintf("Começando em E1, probabilidade de absorção do e3: %f\n", p3);
fprintf("Começando em e1, probabilidade de absorção do e5: %f\n", p5);

%b)
array = cell(1,N);

for n = 1:N
    rand = randi(3);
    
    if rand == 3
        rand = 4;
    end
    
    stateRand = crawl(T, rand, [3 5]);

    array{n} = stateRand;
end

max = length(array{1});
min = length(array{1});

for n = 2:N
    if length(array{n}) > max
        max = length(array{n});
    end

    if length(array{n}) < min
        min = length(array{n});
    end
end

fprintf("O Comprimento máximo é: %d\n", max);
fprintf("O Comprimento minimo é: %d\n", min);
