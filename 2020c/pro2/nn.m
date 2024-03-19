T=data(1,:);
P=data(3:end,:);
P_=data2;
N=n1;
[pn,minp,maxp,tn,mint,maxt]=premnmx(P,T);
[pn_,minp_,map_]=premnmx(P_);
dx=[-1,1;-1,1];
net=newff(dx,[2,15,1]);
net.trainParam.goal = 0;
net.trainParam.epochs = 500000;
net.trainParam.lr = 0.01;
net.trainParam.showWindow = 1;
net = train(net,pn,tn);
an = sim(net,pn_);
a=postmnmx(an,mint,maxt);
%disp(['mse: ' num2str(mse(T-an))]);
Map=mapminmax(a,0,1);
plot(1:size(Map,2),Map,'ro')
print(gcf,'-dpng','nn2_dis.png');