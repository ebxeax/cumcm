files=dir('C:\Users\ygx79\Desktop\����3\*.bmp');
%�ڶ�������ƴ����ͶӰ���� �ļ���reflect.m

% ��ƬԤ����ͼ��ͶӰ�����ͶӰ����figure;
A=zeros(1,180);
for n=1:numel(files)
    image{n}=imread(['C:\Users\ygx79\Desktop\����3\' files(n).name]);
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