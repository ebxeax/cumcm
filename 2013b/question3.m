clear;clc;
fileform = 'C:\Users\ygx79\Desktop\附件3\*.bmp';
filepathsrc = 'C:\Users\ygx79\Desktop\附件3\';
files = dir(fileform);
for i = 1:length(files)
    image{i} = imread([filepathsrc, files(i).name]);
end
byz=[];byy=[];
for i=1:length(image)
    byz=[byz image{i}(:,1)];
    byy=[byy image{i}(:,end)];
end


byz=im2double(byz);
byy=im2double(byy);
a= [30 6 11 38 45 49 56 60  65 76 93 99 105 112 172 173 181 202 207];
aa=[];
y=a(1);
c=[];
c=[c,y];
m=0;
ok=[];
s=start;
aa=[];
while m~=18
 ok=union(ok,c);aa=setdiff(a,ok);
cc=[last(:,y) s(:,aa)];
r=corrcoef(cc);
[x,y]=max(r(1,2:length(r)))
y=aa(y)
c=[c y]
% if isnan(x)
%    rr1=[63 68 81 136 144];
%    y=intersect(rr1,a);%找两不同维度矩阵相同元素
%    c(end)=y;
% end
%%
% cc1=c;n1=1;
% while x<0.1 && n1~=0 
%     rr=([aa(1:end);r(1,2:end)])';
%     rr=sortrows(rr,-2);
%     b=intersect(rr(:,1),cc1);
%     for i=1:length(b)
%         for j=1:length(rr)-1
%            if rr(j,1)==b(i);
%               rr(j,:)=[];
%            end
%         end
%     end
%     temp1=[];
%     for i=1:length(c)
%         temp1=[temp1 image{c(i)}];
%     end
%     imshow(temp1);
%     n1=input('请输入n1值：');
%     if n1~=0  
%        c(end)=rr(1);
%        cc1=[cc1 rr(1)];
%     end
%     
%     
% end
% y=c(end);
%%
m=m+1;
end
temp1=[];
for i=1:length(c)
    temp1=[temp1 image{c(i)}];
end
imshow(temp1);
fileform = 'C:\Users\ygx79\Desktop\附件3\*.bmp';
filepathsrc = 'C:\Users\ygx79\Desktop\附件3\';
file = dir(fileform);
for i = 1:length(file)
    image{i} = imread([filepathsrc, file(i).name]);
end
start=[];last=[];
for i=1:length(image)
    start=[start image{i}(:,1)];
    last=[last image{i}(:,end)];
end
start=im2double(start);
last=im2double(last);
