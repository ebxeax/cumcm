% 求最左边的图片
leftque=[];
cntnum=zeros(fl,1);
maxnum=0;
tmax=0;tpos=0;
for i=1:fl
    imi=imread([path,files(i).name]);
    [ro,co]=size(imi);
    thresh=graythresh(imi);%图像二值化;
    imj=im2bw(imi,thresh);
    tot=0;
    for j=1:co
        if min(imj(:,j))==1
            tot=tot+1;
        else
            break;
        end
    end
    if i==8
        maxnum=tot;
    end
    if tmax<tot
        tmax=tot;tpos=i;
    end
    cntnum(i)=tot;
end
 
for i=1:fl
    if cntnum(i)>=maxnum
        leftque=[leftque i];
    end
end
leftque;
 
%构建209*209相似度矩阵
x2smat=ones(209,209);
for i=1:fl
    imi=imread([path,files(i).name]);
%     thresh=graythresh(imi);
%     tmi=im2bw(imi,thresh);
    for j=1:fl
        imj=imread([path,files(j).name]);
%         thresh=graythresh(imj);
%         tmj=im2bw(imj,thresh);
        timi=im2double(imi);
        timj=im2double(imj);
        x2ssum=sum(abs(timi(:,co)-timj(:,1)));
        x2smat(i,j)=x2ssum;
    end
end