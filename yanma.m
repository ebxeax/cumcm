%如果采用掩码模型，则运行代码yanma.m（包含3个函数top.m,mid.m,back.m）
%附件三掩码补充代码?? 文件名?? yanma.m
files4=dir('C:\Users\ygx79\Desktop\附件3\*.bmp');%载入图像
for n4=1:numel(files4)
    image4{n4}=imread(['C:\Users\ygx79\Desktop\附件3\' files4(n4).name]);
end
fid1=fopen('C:\Users\ygx79\Desktop\modeldata.txt','wt');
fid2=fopen('C:\Users\ygx79\Desktop\extendingdata.txt','wt');
[x,y]=size(image4{1});
flag=zeros(x,n4);%向量投影
for i=1:n4
    for j=1:x
        sum=0;
        for k=1:y
            if image4{i}(j,k)<255
                break;
            else
                sum=sum+1;
            end
        end
        if sum==y
            flag(j,i)=0
        else
        end
    end
end
sumofb=0;
for i=1:209
    sumofb=0;
    for j=1:179
        if flag(j,i)==1&&flag(j+1,i)==0
            sumofb=sumofb+1;
        else
            sumofb=sumofb;
        end
    end
    if flag(180,i)==1
        sumofb=sumofb+1;
    end
        numofb(i)=sumofb;
    end
    for i=1:209
        if numofb(i)<3
            fprint(fid2,'%g',i);
        end
    end
    flagnew=flag;
    A=[5 9 15 17 22 26 28 33 41 61 67 71 72 75 86 90 94 102 107 109 110111 114 115 118 120 124 126 140 141 146 147 151 153 154 155 156 158 166 167 174182 185 186 188 195 197 198 205 206 208];
    [ax,ay]=size(A);
