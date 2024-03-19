class=round(a);
classA=find(class==1);
classB=find(class==2);
classC=find(class==3);
classD=find(class==4);
A=[];
for i=1:length(classA)
    A=[A,dis(classA(i))];
end
B=[];
for i=1:length(classB)
    B=[B,dis(classB(i))];
end
C=[];
for i=1:length(classC)
    C=[C,dis(classC(i))];
end
for i=1:length(classD)
    dis(classD(i))=0;
end
for i=1:length(dis)
    if dis(i)>1000000||dis(i)<100000
        dis(i)=0;
    end
end
summary_dis=sum(dis);
bar(dis)
hold on 
xlabel('企业编号')
ylabel('放贷额度￥(10^7)')
print(gcf,'-dpng','pro1_dis.png');
sumA=sum(A);
sumB=sum(B);
sumC=sum(C);
