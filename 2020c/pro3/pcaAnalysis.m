clc,clear;
data=importdata('CER.xlsx');
X=data.data(:,:);
X(1,:)=[];
[x,coeff,sum_ex,latent]=pcaff(X,5);
weight=latent/100';
weight(2)=weight(2)*(1);
weight(3)=weight(3)*(-1);
X(:,5)=[];
for i=1:4
    X(:,i)=X(:,i)*weight(i);
end
Wdata=sum(X,2);
Wdata=-Wdata;
rise_num=[];
rise_idx=[];
for i=1:length(Wdata)
    if Wdata(i)>0
        rise_num=[rise_num,Wdata(i)];
        rise_idx=[rise_idx,i];
    end
end
figure(2)
area(1:26,Wdata(1:26),'FaceColor',[0 100/256 0],'EdgeColor','b')
hold on 
area(26:28,[0,Wdata(27),0],'FaceColor',[192/250 42/256 42/256],'EdgeColor','b')
hold on 
area(28:30,Wdata(28:30),'FaceColor',[0 100/256 0],'EdgeColor','b')
hold on 
legend("不利系数","有利系数")
hold on 
xlabel("企业分类编号");
hold on 
ylabel("新冠疫情影响指数")
hold on 
print(gcf,'-dpng','areaout.png');


