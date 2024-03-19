T=data(1,:);
P=data(2:end,:);
N=n1;
[pn,minp,maxp,tn,mint,maxt]=premnmx(P,T);
dx=[-1,1;-1,1;-1,1];
net=newff(dx,[3,15,1]);
net.trainParam.goal = 0;
net.trainParam.epochs = 50000;
net.trainParam.lr = 0.01;
net.trainParam.showWindow = 1;
net = train(net,pn,tn);
an = sim(net,pn);
a=postmnmx(an,mint,maxt);
disp(['mse: ' num2str(mse(T-an))]);
list=[];
for i=1:n1
    if data(1,i)~=4
        list=[list,i];
    end
end
MappedData = mapminmax(a, 0, 1);
Map=[];
len=size(list,2)
for i=1:len
    Map=[Map,MappedData(list(i))];
end
figure
plot(1:len,Map,'ro')
save('out.mat','MappedData')