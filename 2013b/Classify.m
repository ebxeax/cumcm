%�ڶ���C��ֵ�������? �ļ���Classify.m
%ģ��C��ֵ��fcm������
%clear;
%close all;
load flag1.mat;
files=dir('C:\Users\ygx79\Desktop\����3\*.bmp');%����ͼ��figure;
for n=1:numel(files)
    image{n}=imread(['C:\Users\ygx79\Desktop\����3\' files(n).name]);
end
data = flag1';
[center,U,obj_fcn] = fcm(data, 11);
maxU = max(U);
%index(i)�д�ŵ�i������ͼƬ
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
