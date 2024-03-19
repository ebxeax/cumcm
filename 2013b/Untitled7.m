clear;
I=imread('C:\Users\ygx79\Desktop\2013b\附件3\*.bmp');
if(isgray(I)==0)
disp('请输入灰度bai图像,本程序用来处理128 *128的灰度图像!du');
else
if (size(I)~=[128,128])
disp('图像的大小不合程序要求!');
else
H.color=[1 1 1]; %设置白的画布
figure(H);imshow(I);
title('原图像');
zeroImage=repmat(uint8(0),[128 128]);
figure(H); %为分裂合并后显示的图设置画布
meansImageHandle=imshow(zeroImage);
title('块均值图像');
%%%%%设置分裂后图像的大小由于本图采用了128像素的图
blockSize=[128 64 32 16 8 4 2];
%%设置一个S稀疏矩阵用于四叉树分解后存诸数据
S=uint8(128);
S(128,128)=0;
threshold=input('请输入分裂的阈值(0--1):');%阈值
threshold=round(255*threshold);
M=128;dim=128;
%%%%%%%%%%%%%%%%% 分裂主程序%%%%%%%%%%%
while (dim>1)
[M,N] = size(I);
Sind = find(S == dim);
numBlocks = length(Sind);
if (numBlocks == 0)
%已完成
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
%已完成
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
[i,j]=find(S); % 用来寻找四叉机分解结果中大小为S的块的位置
set(meansImageHandle,'CData',ComputeMeans(I,S)); % 显示分解结果块均值图像
Numberofbloks=length(i); %计算块数
%sizev=size(v);
end
end

PicName1='a.jpg'; % 要合并的图片1
PicName2='b.jpg'; % 要合并的图片2
PicOut='c.jpg'; %合并的结果
IV1=imread(PicName1); % 读入图片1
IV2=imread(PicName2); % 读入图片2
PicData=[IV1; IV2]; % 如果是纵向拼接用这个
PicData=[IV1 IV2]; % 如果是横向拼接用这个
imwrite(PicData, PicOut, 'Quality', 75); % 输出图形\附件1\');
if(isgray(I)==0)
disp('请输入灰度图像,本程序用来处理128 *128的灰度图像!');
else
if (size(I)~=[128,128])
disp('图像的大小不合程序要求!');
else
H.color=[1 1 1]; %设置白的画布
figure(H);imshow(I);
title('原图像');
zeroImage=repmat(uint8(0),[128 128]);
figure(H); %为分裂合并后显示的图设置画布
meansImageHandle=imshow(zeroImage);
title('块均值图像');
%%%%%设置分裂后图像的大小由于本图采用了128像素的图
blockSize=[128 64 32 16 8 4 2];
%%设置一个S稀疏矩阵用于四叉树分解后存诸数据
S=uint8(128);
S(128,128)=0;
threshold=input('请输入分裂的阈值(0--1):');%阈值
threshold=round(255*threshold);
M=128;dim=128;
%%%%%%%%%%%%%%%%% 分裂主程序%%%%%%%%%%%
while (dim>1)
[M,N] = size(I);
Sind = find(S == dim);
numBlocks = length(Sind);
if (numBlocks == 0)
%已完成
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
%已完成
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
[i,j]=find(S); % 用来寻找四叉机分解结果中大小为S的块的位置
set(meansImageHandle,'CData',ComputeMeans(I,S)); % 显示分解结果块均值图像
Numberofbloks=length(i); %计算块数
%sizev=size(v);
end
end

PicName1='a.jpg'; % 要合并的图片1
PicName2='b.jpg'; % 要合并的图片2
PicOut='c.jpg'; %合并的结果
IV1=imread(PicName1); % 读入图片1
IV2=imread(PicName2); % 读入图片2
PicData=[IV1; IV2]; % 如果是纵向拼接用这个
PicData=[IV1 IV2]; % 如果是横向拼接用这个
imwrite(PicData, PicOut, 'Quality', 75); % 输出图形