num=size(MappedData,2);
dis=MappedData*1000000;
getout=[];
get=[];
for i=1:num
    if dis(i)<100000
        getout=[getout,i];
    else
        get=[get,i];
end
end
account=[];
for i=1:size(get,2)
    account=[account,dis(get(i))];
end



