clear;clc;
path='C:\Users\ygx79\Desktop\2013b\附件3\';
files=dir('C:\Users\ygx79\Desktop\2013b\附件3\*.bmp');
fl=length(files);
 
eig=[];%特征向量矩阵
for i=1:fl
    imi=imread([path,files(i).name]);
    [ro,co]=size(imi);
    thresh=graythresh(imi);%图像二值化;
    imj=im2bw(imi,thresh);
    t=[];
    for j=1:ro
        if min(imj(j,:))==0
            t=[  t 0];
        else
            t=[t 1];
        end
    end
    eig=[eig t'];
end
 
 
P=eig;
net=newc(minmax(P),11,0.1);
net.trainParam.epochs=200;
net=init(net);
% net=newsom(P,[11]);
net=train(net,P);
Y=sim(net,P);
y=vec2ind(Y);
% y=kmeans(P',11);
 
 
% 测试分类
te=[];
for i=1:11
    tot=0;
    for j=1:209
        if y(j)==i
            tot=tot+1;
        end
    end
    te=[te tot];
end
 
 
c1=[];c2=[];c3=[];c4=[];c5=[];c6=[];c7=[];c8=[];c9=[];c10=[];c11=[];
for i=1:fl
    if y(i)==1 c1=[c1 i];
    elseif y(i)==2 c2=[c2 i];
    elseif y(i)==3 c3=[c3 i];
    elseif y(i)==4 c4=[c4 i];
    elseif y(i)==5 c5=[c5 i];
    elseif y(i)==6 c6=[c6 i];
    elseif y(i)==7 c7=[c7 i];
    elseif y(i)==8 c8=[c8 i];
    elseif y(i)==9 c9=[c9 i];
    elseif y(i)==10 c10=[c10 i];
    else c11=[c11 i];
    end
end
c1=sort(c1);c2=sort(c2);c3=sort(c3);c4=sort(c4);c5=sort(c5);c6=sort(c6);c7=sort(c7);c8=sort(c8);c9=sort(c9);c10=sort(c10);c11=sort(c11);