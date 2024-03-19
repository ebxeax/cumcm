clc
clear all
tic
fprintf('导入图片');
I=dir('.\*.bmp');
im_num=length(I);
im_temp=imread(I(1).name,'bmp');
[height,width]=size(im_temp);
DB(:,:,a)=zeros(height,width,im_num,'uint8');
level=3;
T0=uint8([]);
T=uint8([]);
for a = 1:length(I)
    DB(:,:,a) = imread(I(a).name,'bmp');
end
[h,w,d]=size(T0(:,:,:,1));
T=multi_resolution(T0,level);%调用子函数mult_resolution?
toc
tic
fprintf('相位相关计算偏移量');
M=10;
for N=1:M
    if N<M
        [i,j]=poc_2pow(T(:,:,:,N),T(:,:,:,N+1));
        elseif N==M [i,j]=poc_2pow(T(:,:,:,N),T(:,:,:,1));
    end
    coor_shift(N,1)=i;
    coor_shift(N,2)=j;
    %?????suml=suml+j;
end
coor_shift=coor_shift*2^level;%调用子函数coor_shift?
toc
tic
fprintf('变换旋转坐标');
f=sqrt(h^2+w^2);
[T1,coor_shift02]=coortransf(T0,f,coor_shift);
toc
tic
fprintf('相似度分析');
panorama1=T1(:,:,:,1);
for N=1:M
    if N<M panorama1=mosaic(panorama1,T1(:,:,:,N+1),coor_shift02(N,1),coor_shift02(N,2));
    end
end
toc
tic
fprintf('保存序号');
imwrite(panorama1,'*.bmp','bmp');
imshow(panorama1,[]);
toc