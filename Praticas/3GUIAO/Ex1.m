matriz = [0.2, 0.3; %faltar 
          0.8, 0.7];%nao faltar  podemos apresentar a matriz assim T = [0.7,0.8 ; 0.3,0.2];

vetor1  = [0;    %faltar
          1];   %nao faltar

%%a
v_aula1 = vetor1;
v_aula2 = matriz * v_aula1;
v_aula3 = matriz * v_aula2;
respostaA = v_aula3(2)

%%b
vetor2 = [1;  %faltar
          0];  %nao faltar
v_aula1 = vetor2;
v_aula2 = matriz * v_aula1;
v_aula3 = matriz * v_aula2;
respostaB = v_aula3(2)

%%c
vetor3  = [0;    %faltar
          1];   %nao faltar
v_aulax = matriz^(2*15-1);
v_aula30 = v_aulax *vetor3;
respostaC = v_aula30(2)

%%d
pNaoFaltar = 0.85;
v1 = [1-pNaoFaltar pNaoFaltar]'

prob(1) = v1(1)
for aula = 1:30-1
    v= matriz^(aula) * v1;
    prob(aula+1) = v(1);
end

plot(1:30, prob, ' bo: ')
