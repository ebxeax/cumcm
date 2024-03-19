files=dir('C:\Users\ygx79\Desktop\附件3\*.bmp');
%第二问中文拼接中投影代码?? 文件名reflect.m

% 碎片预处理，图像投影，存放投影数组figure;
A=zeros(1,180);
for n=1:numel(files)
    image{n}=imread(['C:\Users\ygx79\Desktop\附件3\' files(n).name]);
end
[x,y]=size(image{1});
flag1=zeros(x,n);
for i=1:n
    for j=1:x
        sum=0;
        for k=1:y
            if image{i}(j,k)<255
                break;
            else
                sum=sum+1;
            end
        end
    if sum==y
        flag1(j,i)=0;
    else
        flag1(j,1)=1;
    end
    end
end
%第二问C均值分类代码? 文件名Classify.m
%模糊C均值（fcm）分类
%clear;
%close all;
%load flag1.mat;
files=dir('C:\Users\ygx79\Desktop\附件3\*.bmp');%载入图像figure;
for n=1:numel(files)
    image{n}=imread(['C:\Users\ygx79\Desktop\附件3\' files(n).name]);
end
data = flag1';
[center,U,obj_fcn] = fcm(data, 11);
maxU = max(U);
%index(i)中存放第i类分组的图片
index(1).t = find(U(1,:) == maxU);
index(2).t = find(U(2, :) == maxU);
index(3).t = find(U(3,:) == maxU);
index(4).t = find(U(4,:) == maxU);
index(5).t = find(U(5,:) == maxU);
index(6).t = find(U(6,:) == maxU);
index(7).t = find(U(7,:) == maxU);
index(8).t = find(U(8,:) == maxU);
index(9).t = find(U(9,:) == maxU);
index(10).t = find(U(10,:) == maxU);
index(11).t= find(U(11,:) == maxU);




