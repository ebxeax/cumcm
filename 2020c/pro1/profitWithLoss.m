%%���峣��
a0=-9.923*100000;
a1=9.923*100000;
b1=1772;
w1=0.01241;
A0=-1.725*1000000;
A1=1.725*1000000;
B1=-2277 ;
W1=-0.008875;
aa0=-3.033*1000;
aa1=3.033*1000;
bb1=301.4;
ww1=0.06494;
m=[50000000,30000000,20000000];
X=0.04+(0.15-0.04)*rand(1000,3);
x=a1*cos(w1*P(:,1))+a0+b1*sin(w1*(P(:,1)));
y=A1*cos(W1*P(:,1))+A0+B1*sin(W1*(P(:,1)));
z=aa1*cos(ww1*P(:,1))+aa0+bb1*sin(ww1*(P(:,1)));
%l=(1-x)*sumA+(1-y)*sumB+(1-z)*sumC;
l=(1-x)*m(1)+(1-y)*m(2)+(1-z)*m(3);
II=find(l<=100000000);
disp(x(II))
disp(y(II))
disp(z(II))
 