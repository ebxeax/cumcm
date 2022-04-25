clc;
clear;
filename = 'C:\Users\ygx79\Desktop\附件3\*.bmp'
files = dir(filename);    %批量载入图像
NUM_OF_FILES_1=numel(files)-1;
for i=0:NUM_OF_FILES_1
    temp= imread(['C:\Users\ygx79\Desktop\附件3\', files(i+1).name]);
    img(i+1,:,:)=temp;
    eval(['img' int2str(i) '=temp;']);
end

kkk=0;
count=0;
for i=0:NUM_OF_FILES_1
    columns=0;
    for k=1:72
        count=0;
        for j=1:180
            if img(i+1,j,k)==255
                count=count+1;
            end
        end
        if count>=180
            columns=columns+1;
        else
            break;
        end
    end
    if columns>0
        kkA=i;
        Kkk=kkk+1;
    end
end

kkk=0;
for i=0:NUM_OF_FILES_1
    lines=0;
    for k=1:180
        count=0;
        for j=1:72
            if img(i+1,k,j)==255
                count=count+1;
            end
        end
        if count==72
            lines=lines+1;
        else
            break;
        end
    end
    if lines>36
        kkB=i;
        kkk=kkk+1;
    end
end

coo=[];
C=[];
for i=0:NUM_OF_FILES_1
    C=[C;img(i+1,:,1)];
end
C=squeeze(C);
D=[];
for i=0:NUM_OF_FILES_1
    D=[D;img(i+1,:,72)];
end
D=squeeze(D);
for i=0:NUM_OF_FILES_1
    %coo=[coo,corr2(img(107,180,:),img(i+1,1,:))];
    coo=[coo,corr2(img(153,:,72),img(i+1,:,1))];
end
pii=find(coo==(max(coo)))

