function result = pertenceConjunto(filter,key,numHashFunc)
    listres = zeros(numHashFunc,1);
    for i= 1:numHashFunc
        key1 = [key num2str(i)];
        code = mod(string2hash(key1),length(filter))+1;
        listres(i) = filter(code);
    end
    result = sum(listres)==numHashFunc;
end