clc;
clear;
data=importdata('classify.xlsx');
num=data.data.Sheet3';
n=size(num,2);
name=data.textdata.Sheet3';
numCopy=num;
sum_num=sum(num);
%%计算低于4%的类型索引
low_idx=[];
for i=1:n
    if (num(i)/sum_num)<0.04
        low_idx=[low_idx,i];
        numCopy(i)=0;
    end
end
%%计算低于4%的类型数量总和
summary=[];
for i=1:size(low_idx,2)
    summary=[summary,num(low_idx(i))];
end
%%输出高于4%部分数量集
zero_idx=find(numCopy==0);
numCopy(zero_idx)=[];
high_num=numCopy;
%%计算高于4%的类型索引
high_idx=setdiff(1:30,low_idx);
%%计算高于4%的类型名称
high_name=[];
for i=1:size(high_idx,2)
    high_name=[high_name,name(high_idx(i))];
end
%%计算高于4%的类型数量集
high_num=[];
for i=1:size(high_idx,2)
    high_num=[high_num,num(high_idx(i))];
end
all_num=[high_num,sum_num];
all_name=[high_name,"农林交通运输等"];
explode = [0,0,0,1,0,0,0,0,0,0];
pie3(all_num,explode)
legend(all_name)
print(gcf,'-dpng','pieout.png');
figure(2)
bar(num)
xlabel('企业类型数量');
ylabel('企业类型代号');
y=abs(rand(1,10)*100);
axis([1,30,min(num),max(num)]);
for i=1:30
    text(i,num(i)+0.5,num2str(num(i)),'VerticalAlignment','bottom','HorizontalAlignment','center');
end
legend("企业类型")
print(gcf,'-dpng','barout.png');


