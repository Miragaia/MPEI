%Guiao 3 Exercicio 6
%%a
T =[8 0 3 0 0;
    2 6 2 0 0;
    0 1 4 0 0;
    0 3 0 1 0;
    0 0 1 0 1;]/10;
sum(T)

%%b
figure(1);
V = [1 0 0 0 0]';
P = zeros(1,100);
for n =1:100
    V = T*V;
    P(n) = V(2);
end
plot(P)

%%c
figure(2);
V = [1 0 0 0 0]';
P = zeros(1,100);
P2 = zeros(1,100);
for n =1:100
    V = T*V;
    P(n) = V(3);
end
for n =1:100
    V = T*V;
    P2(n) = V(5);
end
subplot(2,1,1)
plot(P)
subplot(2,1,2)
plot(P2);
%%d 
nena = 3; %%numero de estados nao absorventes
Q = T(1:nena, 1:nena)

%%e
F = inv(eye(3) - Q) %Matriz Fundamental

%%f
F = inv(eye(length(Q))-Q);

E = sum(F);
fprintf("Nº passos a começar em 1: %f\n", E(1));
fprintf("Nº passos a começar em 2: %f\n", E(2));
fprintf("Nº passos a começar em 4: %f\n", E(3));

%%g
R = T(4:5,1:3);
F = inv(eye(length(Q))-Q);

B = R*F;

fprintf("Começando no estado 1, prob. absorção do estado 3: %f\n", B(1,1));
fprintf("Começando no estado 1, prob. absorção do estado 5: %f\n", B(2,1));

