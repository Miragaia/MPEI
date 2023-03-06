%lancamento n dardos um de cada vez para m alvos, cada dardo atinge 1 e
%apenas 1 alvo de cada vez

%Prob de nenhum alvo ser atingido mais do que uma vez
N = 1e5; %nr de experiencias
n = 20;  %nr de dardos
m = 100; %nr de alvos
cf = 0;  %casos favoraveis

lancamentos = randi(m,n,N);

for k=1:N
    sem_rep = unique(lancamentos(:,k));  
    if length(sem_rep)==20
        cf = cf+1;
    end
end

prob = cf/N