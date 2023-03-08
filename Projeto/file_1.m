clear all;


udata = load("u.data");
data = udata(1:end,1:3);
numData = height(data);
clear udata;

films = unique(data(:,2));
users = unique(data(:,1));

dic = readcell('users.txt', 'Delimiter', ';');
numUsers = height(dic);

dic2 = readcell('film_info.txt', 'Delimiter', '\t');
numFilms = height(dic2);

usersNames = dic(:,2:3); %n se esta a usar


usersE = getUsers(films,data); 

numHash = 100;
matrizMinHashFilms = minHashFilms(films,numHash,usersE);
distancesFilms = getDistancesMinHashFilms(numFilms,matrizMinHashFilms,numHash);

%numHash = 100; 
%interesses = getinteresses(dic);
%numInteresses = length(interesses);
%matrizAssinaturasInteresses = matrizAssinaturas(dic,interesses);
%matrizMinHashInteresses = minHash(matrizAssinaturasInteresses,numHash);
%distancesInteresses = getDistancesMinHashInteresses(numUsers,matrizMinHashInteresses,numHash);


titles = dic2(:,1);
numTitles = length(titles);
numHash = 100;
shingleSize = 2;
matrizMinHashTitles = minHashTitles(titles,numHash,shingleSize);
distancesTitles = getDistancesMinHashTitles(numTitles,matrizMinHashTitles,numHash);

function usersE = getUsers(films,data)
    numFilms = length(films);
    usersE = cell(numFilms,1);

    for n = 1:numFilms
        indices = find(data(:,2) == films(n));
        usersE{n} = [usersE{n} data(indices,1)]; %%2ºcoluna do u.data dá-nos o ID do filme n
    end
end

function matrizMinHashFilms = minHashFilms(films, numHash, usersE)
    
    numFilms = length(films);
    matrizMinHashFilms = inf(numFilms, numHash);
    
    
    x = waitbar(0,'A calcular minHashFilms()...');
    for k = 1:numFilms
        waitbar(k/numFilms,x);
        usersFilms = usersE{k};
        for j = 1:length(usersFilms)
            chave = char(usersFilms(j));
            for i = 1:numHash
                chave = [chave num2str(i)];
                h(i) = DJB31MA(chave, 127);
            end
            matrizMinHashFilms(k, :) = min([matrizMinHashFilms(k, :); h]);
        end
    end
    delete(x);
end

function h= DJB31MA( chave, seed)
    len= length(chave);
    chave= double(chave);
    h= seed;
    for i=1:len
        h = mod(31 * h + chave(i), 2^32 -1) ;
    end
end

function distances = getDistancesMinHashFilms(numFilms,matrizMinHash,numHash) 
    distances = zeros(numFilms,numFilms);
    for n1= 1:numFilms
        for n2= n1+1:numFilms
            distances(n1,n2) = sum(matrizMinHash(n1,:)==matrizMinHash(n2,:))/numHash;
        end
    end
end

function matrizMinHashTitles = minHashTitles(titles,numHash,shingleSize)
    numTitles = length(titles);
    matrizMinHashTitles = inf(numTitles, numHash);
    
    x = waitbar(0,'A calcular minHashTitles()...');
    for k= 1 : numTitles
        waitbar(k/numTitles,x);
        movie = titles{k};
        for j = 1 : (length(movie) - shingleSize + 1)
            shingle = lower(char(movie(j:(j+shingleSize-1)))); 
            h = zeros(1, numHash);
            for i = 1 : numHash
                shingle = [shingle num2str(i)];
                h(i) = DJB31MA(shingle, 127);
            end
        matrizMinHashTitles(k, :) = min([matrizMinHashTitles(k, :); h]);
        end
    end
    delete(x);
end

function distances = getDistancesMinHashTitles(numTitles,matrizMinHash,numHash) 
    distances = zeros(numTitles,numTitles);
    for n1= 1:numTitles
        for n2= n1+1:numTitles
            distances(n1,n2) = sum(matrizMinHash(n1,:)==matrizMinHash(n2,:))/numHash;
        end
    end
end


function interesses = getinteresses(dic)
    interesses = {};
    k = 1;
    for j= 1:height(dic)
        for i = 4:width(dic(j,:))
            if ~isempty(dic{j,i}) && i<17
                interesses{k} = dic{j,i};
                k = k+1;
            end
        end
    end
    interesses = unique(interesses);
end

function matrizAssinaturasInteresses = matrizAssinaturas(dic,interesses)
    numUsers = height(dic);
    numInteresses = length(interesses);
    matrizAssinaturasInteresses = zeros(numInteresses,numUsers);
    for i= 1:numInteresses
        for n= 1:numUsers            
            for k = 4:width(dic(n,:))
                if ~isempty(dic{j,i}) && i<17
                    if strcmp(interesses(i),dic{n,k})
                        matrizAssinaturasInteresses(i,n) = 1;
                    end
                end
            end
        end
    end
end

function matrizMinHashInteresses = minHash(matrizAssinaturasInteresses,numHashFunc)
    p = primes(10000);
    matrizMinHashInteresses = zeros(numHashFunc,width(matrizAssinaturasInteresses));
    Lista = p(randperm(length(p),numHashFunc));

    x = waitbar(0,'A calcular minHashInteresses()...');
    for func= 1:length(Lista)
        waitbar(func/length(Lista),x);
        for d= 1:width(matrizAssinaturasInteresses)
            matrizMinHashInteresses(func,d) = min(mod(find(matrizAssinaturasInteresses(:,d)==1),Lista(func)));
        end
    end

end

function distancesInteresses = getDistancesMinHashInteresses(numUsers,matrizMinHashInteresses,numHash) 
    distancesInteresses = zeros(numUsers,numUsers);
    for n1= 1:numUsers
        for n2= n1+1:numUsers
            distancesInteresses(n1,n2) = sum(matrizMinHashInteresses(:,n1)==matrizMinHashInteresses(:,n2))/numHash;
        end
    end
end
