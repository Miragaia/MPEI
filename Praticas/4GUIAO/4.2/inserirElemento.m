function filter = inserirElemento(filter,key,numHashFunc)
    for i= 1:numHashFunc
        key1 = [key num2str(i)];
        hashcode = mod(string2hash(key1),length(filter))+1;
        filter(hashcode) = 1;
    end
end