clear;
I=imread('C:\Users\ygx79\Desktop\2013b\����3\*.bmp');
if(isgray(I)==0)
disp('������Ҷ�baiͼ��,��������������128 *128�ĻҶ�ͼ��!du');
else
if (size(I)~=[128,128])
disp('ͼ��Ĵ�С���ϳ���Ҫ��!');
else
H.color=[1 1 1]; %���ð׵Ļ���
figure(H);imshow(I);
title('ԭͼ��');
zeroImage=repmat(uint8(0),[128 128]);
figure(H); %Ϊ���Ѻϲ�����ʾ��ͼ���û���
meansImageHandle=imshow(zeroImage);
title('���ֵͼ��');
%%%%%���÷��Ѻ�ͼ��Ĵ�С���ڱ�ͼ������128���ص�ͼ
blockSize=[128 64 32 16 8 4 2];
%%����һ��Sϡ����������Ĳ����ֽ���������
S=uint8(128);
S(128,128)=0;
threshold=input('��������ѵ���ֵ(0--1):');%��ֵ
threshold=round(255*threshold);
M=128;dim=128;
%%%%%%%%%%%%%%%%% ����������%%%%%%%%%%%
while (dim>1)
[M,N] = size(I);
Sind = find(S == dim);
numBlocks = length(Sind);
if (numBlocks == 0)
%�����
break;
end
rows = (0:dim-1)';
cols = 0:M:(dim-1)*M;
rows = rows(:,ones(1,dim));
cols = cols(ones(dim,1),:);
ind = rows + cols;
ind = ind(:);
tmp = repmat(Sind', length(ind), 1);
ind = ind(:, ones(1,numBlocks));
ind = ind + tmp;
blockValues= I(ind);
blockValues = reshape(blockValues, [dim dim numBlocks]);
if(isempty(Sind))
%�����
break;
end
[i,j]=find(S);
set(meansImageHandle,'CData',ComputeMeans(I,S));
maxValues=max(max(blockValues,[],1),[],2);
minValues=min(min(blockValues,[],1),[],2);
doSplit=(double(maxValues)-double(minValues))>threshold;
dim=dim/2;
Sind=Sind(doSplit);
Sind=[Sind;Sind+dim;(Sind+M*dim);(Sind+(M+1)*dim)];
S(Sind)=dim;
end
[i,j]=find(S); % ����Ѱ���Ĳ���ֽ����д�СΪS�Ŀ��λ��
set(meansImageHandle,'CData',ComputeMeans(I,S)); % ��ʾ�ֽ������ֵͼ��
Numberofbloks=length(i); %�������
%sizev=size(v);
end
end

PicName1='a.jpg'; % Ҫ�ϲ���ͼƬ1
PicName2='b.jpg'; % Ҫ�ϲ���ͼƬ2
PicOut='c.jpg'; %�ϲ��Ľ��
IV1=imread(PicName1); % ����ͼƬ1
IV2=imread(PicName2); % ����ͼƬ2
PicData=[IV1; IV2]; % ���������ƴ�������
PicData=[IV1 IV2]; % ����Ǻ���ƴ�������
imwrite(PicData, PicOut, 'Quality', 75); % ���ͼ��\����1\');
if(isgray(I)==0)
disp('������Ҷ�ͼ��,��������������128 *128�ĻҶ�ͼ��!');
else
if (size(I)~=[128,128])
disp('ͼ��Ĵ�С���ϳ���Ҫ��!');
else
H.color=[1 1 1]; %���ð׵Ļ���
figure(H);imshow(I);
title('ԭͼ��');
zeroImage=repmat(uint8(0),[128 128]);
figure(H); %Ϊ���Ѻϲ�����ʾ��ͼ���û���
meansImageHandle=imshow(zeroImage);
title('���ֵͼ��');
%%%%%���÷��Ѻ�ͼ��Ĵ�С���ڱ�ͼ������128���ص�ͼ
blockSize=[128 64 32 16 8 4 2];
%%����һ��Sϡ����������Ĳ����ֽ���������
S=uint8(128);
S(128,128)=0;
threshold=input('��������ѵ���ֵ(0--1):');%��ֵ
threshold=round(255*threshold);
M=128;dim=128;
%%%%%%%%%%%%%%%%% ����������%%%%%%%%%%%
while (dim>1)
[M,N] = size(I);
Sind = find(S == dim);
numBlocks = length(Sind);
if (numBlocks == 0)
%�����
break;
end
rows = (0:dim-1)';
cols = 0:M:(dim-1)*M;
rows = rows(:,ones(1,dim));
cols = cols(ones(dim,1),:);
ind = rows + cols;
ind = ind(:);
tmp = repmat(Sind', length(ind), 1);
ind = ind(:, ones(1,numBlocks));
ind = ind + tmp;
blockValues= I(ind);
blockValues = reshape(blockValues, [dim dim numBlocks]);
if(isempty(Sind))
%�����
break;
end
[i,j]=find(S);
set(meansImageHandle,'CData',ComputeMeans(I,S));
maxValues=max(max(blockValues,[],1),[],2);
minValues=min(min(blockValues,[],1),[],2);
doSplit=(double(maxValues)-double(minValues))>threshold;
dim=dim/2;
Sind=Sind(doSplit);
Sind=[Sind;Sind+dim;(Sind+M*dim);(Sind+(M+1)*dim)];
S(Sind)=dim;
end
[i,j]=find(S); % ����Ѱ���Ĳ���ֽ����д�СΪS�Ŀ��λ��
set(meansImageHandle,'CData',ComputeMeans(I,S)); % ��ʾ�ֽ������ֵͼ��
Numberofbloks=length(i); %�������
%sizev=size(v);
end
end

PicName1='a.jpg'; % Ҫ�ϲ���ͼƬ1
PicName2='b.jpg'; % Ҫ�ϲ���ͼƬ2
PicOut='c.jpg'; %�ϲ��Ľ��
IV1=imread(PicName1); % ����ͼƬ1
IV2=imread(PicName2); % ����ͼƬ2
PicData=[IV1; IV2]; % ���������ƴ�������
PicData=[IV1 IV2]; % ����Ǻ���ƴ�������
imwrite(PicData, PicOut, 'Quality', 75); % ���ͼ��