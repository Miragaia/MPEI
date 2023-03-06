%%Preciso de perceber esta

import prob.*
import prob2.*


x = prob(6,15,0.5,1e6);
fprintf("Prob -> %.20f \n",x)

x = prob(6,20,0.5,1e6);
fprintf("Prob -> %.20f \n",x)

x = prob(6,40,0.5,1e6);
fprintf("Prob -> %.20f \n",x)

x = prob(6,100,0.5,1e6);
fprintf("Prob -> %.20f \n",x)


%% grafico

N = 1e6;help prob

lancamentos = 20;  %numero de lancamentos


for x = 0:20    %desde nenhum a sair tudo caras, mudar o 20(se for outro numero de lancamentos)
    P(x+1) = prob(x,lancamentos,0.5,N);  %prob(número de caras; nr de lancamentos; prob cara; nr de experiencias)

end



stem(0:20,P)