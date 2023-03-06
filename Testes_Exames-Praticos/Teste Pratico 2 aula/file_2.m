filme_atual = 0;

while(filme_atual<1 || filme_atual>1682)
    filme_atual = input('Insert Film ID (1 to 1682): ');
    if (filme_atual<1 || filme_atual>1682)
        fprintf("ERROR: Enter a valid ID User\n");
    end
end

clear menu;
menu = menu('Menu', ...
            '1 - Users that evaluated current movie', ...
            '2 - Suggestions of user to evaluate movie', ...
            '3 - Suggestions of user to based on common interersts', ...
            '4 - Movies feedback based on popularity', ...
            '5 - Exit');

while(menu ~= 5 && menu ~=0)
    switch menu
        case 1
            evalUsers = usersE{filme_atual};
            numEvalUsers = height(evalUsers);
            
            fprintf("\n---------- MY USERS ----------\n\n");

            for i= 1:numEvalUsers
                idUser = evalUsers(i);
                nameUser = dic(idUser,2);
                apelidoUser = dic(idUser,3);
                fprintf("(ID: %d) %s %s\n", idUser,nameUser{1},apelidoUser{1});
            end

            fprintf("\n------------------------------\n\n");
            
        case 2
            Jacmax1= 1;
            for simFilm = 1:numFilms
                if simFilm ~= filme_atual
                    if distancesFilms(filme_atual,simFilm) < Jacmax1
                        id1 = simFilm;
                        Jacmax1 = distancesFilms(filme_atual,simFilm);
                    end
                end
            end
            Jacmax2=1;
            for simFilm = 1:numFilms
                if simFilm ~= filme_atual 
                    if simFilm ~= id1
                        if distancesFilms(filme_atual,simFilm) < Jacmax2
                            id2=simFilm;
                            Jacmax2 = distancesFilms(filme_atual,simFilm);
                        end
                    end
                end
            end
          
            evalUsers1 = usersE{id1}; %%lista de ids dos users que viram o filme 1
            evalUsers2 = usersE{id2};
            numEvalUsers1temp = height(evalUsers1);
            numEvalUsers2temp = height(evalUsers2);
        
            for k= 1:numEvalUsers1temp   
                idUser1= evalUsers1(k);  %valor atual do id do users que viu o filme 1
                idUser1atual= usersE{filme_atual}; %%lista de id dos Users que viram o filme atual
                numidUser1atual = height(idUser1atual);
                for j= 1: numidUser1atual   
                    if idUser1 == idUser1atual(j) %valor atual do id dos users que viu o filme 1 ser diferente do dos ids que viram Atual 
                        evalUsers1(k)= 0;
                    end
                end
            end

            for k= 1:numEvalUsers2temp   
                idUser2= evalUsers2(k);  %valor atual do id do users que viu o filme 1
                idUser2atual= usersE{filme_atual}; %%lista de id dos Users que viram o filme atual
                numidUser2atual = height(idUser2atual);
                for j= 1: numidUser2atual   
                    if idUser2 == idUser2atual(j) %valor atual do id dos users que viu o filme 1 ser diferente do dos ids que viram Atual 
                        evalUsers2(k)= 0;
                    end
                end
            end
            
            fprintf("\n---------- USERS THAT EVALUATED CURRENT MOVIE ----------\n\n");
           for p= 1:numEvalUsers1temp
                if evalUsers1(p)~= 0
                    idUser = evalUsers1(p);
                    nameUser = dic(idUser,2);
                    apelidoUser = dic(idUser,3);
                    fprintf("(ID: %d) %s %s\n", idUser,nameUser{1},apelidoUser{1});
                end
           end

           for z= 1:numEvalUsers2temp
                if evalUsers2(z)~= 0
                    idUser = evalUsers2(z);
                    nameUser = dic(idUser,2);
                    apelidoUser = dic(idUser,3);
                    fprintf("(ID: %d) %s %s\n", idUser,nameUser{1},apelidoUser{1});
                end
           end

            fprintf("\n---------------------------------------------------------\n\n");


        case 3
            evalUsers = usersE{filme_atual};
            searchInteresses(evalUsers, matrizMinHashInteresses, numHash, interesses); 
            
        
        case 4
            titulo = lower(input('Write a title: ', 's'));
            
            fprintf("\n---------- MOST SIMILAR TITLES ----------\n\n");

            searchTitle(titulo, matrizMinHashTitles, numHash, titles, shingleSize,data); 

            fprintf("\n-----------------------------------------\n\n");
    end
    clear menu;
    menu = menu('Menu', ...
                '1 - Users that evaluated current movie', ...
                '2 - Suggestions of user to evaluate movie', ...
                '3 - Suggestions of user to based on common interersts', ...
                '4 - Movies feedback based on popularity', ...
                '5 - Exit');
end

function searchInteresses(evalUsers, matrizMinHashInteresses, numHash, interesses)
    minHashSearch = inf(1, numHash);
    for j = 1:length(evalUsers)
            chave = char(evalUsers(j));
            for i = 1:numHash
                chave = [chave num2str(i)];
                h(i) = DJB31MA(chave, 127);
            end
            matrizMinHashInteresses(1, :) = min([matrizMinHashInteresses(1, :); h]);
    end
   
    threshold = 0.9;
    [similarInteresses,distancesUsers] = filterSimilarInteresses(threshold,interesses,matrizMinHashInteresses,minHashSearch,numHash);
         
    distances = cell2mat(distancesUsers);
    [distances, index] = sort(distances);    
end

function h= DJB31MA( chave, seed)
    len= length(chave);
    chave= double(chave);
    h= seed;
    for i=1:len
        h = mod(31 * h + chave(i), 2^32 -1) ;
    end
end

function searchTitle(titulo, matrizMinHashTitles, numHash, titles, shingleSize,data)
    minHashSearch = inf(1, numHash);
    for j = 1 : (length(titulo) - shingleSize + 1)
        shingle = char(titulo(j:(j+shingleSize-1))); 
        h = zeros(1, numHash);
        for i = 1 : numHash
            shingle = [shingle num2str(i)];
            h(i) = DJB31MA(shingle, 127);
        end
        minHashSearch(1, :) = min([minHashSearch(1, :); h]);
    end
   
    threshold = 1;
    [similarTitles,distancesTitles,k] = filterSimilar(threshold,titles,matrizMinHashTitles,minHashSearch,numHash);
    
    distances = cell2mat(distancesTitles);
    [distances, index] = sort(distances);
    
    numData = height(data);
    numTitles = length(titles);
    for h = 1 : 3
        count = 0;
        for j = 1 : numTitles
            if strcmp(titles{j},similarTitles{index(h)})  %j -> id do filme se verdadeiro
                for k = 1 : numData
                    if j == data(k,2)
                        if data(k,3) >= 3
                            count = count + 1;
                        end
                    end                         
                end
            end
        end
        fprintf('%s - Número de avaliações iguais ou superiores a 3: %d\n', similarTitles{index(h)}, count);
    end
end

function [similarTitles,distancesTitles,k] = filterSimilar(threshold,titles,matrizMinHashTitles,minHash_Search,numHash)
    similarTitles = {};
    distancesTitles = {};
    numTitles = length(titles);
    k=0;
    for n = 1 : numTitles
        distancia = 1 - (sum(minHash_Search(1, :) == matrizMinHashTitles(n,:)) / numHash);
        if (distancia < threshold)
            k = k+1;
            similarTitles{k} = titles{n};
            distancesTitles{k} = distancia;
        end
    end
end

function [similarInteresses,distancesInteresses,k] = filterSimilarInteresses(threshold,interesses,matrizMinHashInteresses,minHash_Search,numHash)
    similarInteresses = {};
    distancesInteresses = {};
    numInteresses = length(interesses);
    k=0;
    for n = 1 : numInteresses
        distancia = 1 - (sum(minHash_Search(1, :) == matrizMinHashInteresses(n,:)) / numHash);
        if (distancia < threshold)
            k = k+1;
            similarInteresses{k} = interesses{n};
            distancesInteresses{k} = distancia;
        end
    end
end
