clc; clear;
% 第一问代码 文件名：Qusetion1.m
filename = 'C:\Users\ygx79\Desktop\附件3\*.bmp'
files = dir(filename);    %批量载入图像
image = cell(1, size(files, 1)) ;  % 定义一个元组

for n=1:numel(files)
 image{n} = imread(['C:\Users\ygx79\Desktop\附件3\', files(n).name]);
end

[h,z] = size(image{1,1});            % 计算一张图片矩阵的大小(行，列)

% 只取最左和最右列进行灰色关联分析
% img_left_vector 存放 n 张图片的，最左列 (1980行, n列)
for k=1:n
   img_left_vector(:, k) = image{1, k}(: , 1);      % 将第k张图片的最左边一列放入矩阵img_left_vector的第k列                     
   img_right_vector(:, k) = image{1, k}(: , z);      % 将第k张图片的最右边一列放入矩阵img_right_vector的第k列
   img_up_vector(:, k) = image{1, k}(1 , :);             % 将第k张图片的最右边一列放入矩阵img_up_vector的第k列
   img_down_vector(:, k) = image{1, k}(h , :);           % 将第k张图片的最右边一列放入矩阵img_down_vector的第k列
end

%利用页边距寻找边缘图片
left=[];
right=[];
up=[];
down=[];
for i=1:n                                     
    sum_left=0;
    for j=1:h                                 
        if img_left_vector(j,i) == 255                 
            sum_left=sum_left+1;
        else
            break;
        end
    end
    if sum_left==h                            
        left=[left,i];
    end
end
for i=1:n  
    sum_right=0;
    for j=1:h                                 
        if img_right_vector(j,i) == 255                
            sum_right=sum_right+1;
        else
            break;
        end
    end
    if sum_right==h                             
        right=[right,i];
    end
end
for i=1:n  
    sum_up=0;
    for j=1:z                                 
        if img_up_vector(j,i) == 255                 
            sum_up=sum_up+1;
        else
            break;
        end
    end
    if sum_up==z                             
        up=[up,i];
    end
end
for i=1:n  
    sum_down=0;
    for j=1:z                                 
        if img_down_vector(j,i) == 255                 
            sum_down=sum_down+1;
        else
            break;
        end
    end
    if sum_down==z                            
        down=[down,i];
    end
end


%找出边缘重复的图片
left_up=intersect(left,up);
left_down=intersect(left,down);
right_up=intersect(right,up);
right_down=intersect(right,down);
left_up_down=intersect(left_up,left_down);
left_up_down_right=intersect(left_up_down,right);
right_up_down=intersect(right_down,right_up);
rud=right_up_down;
lud=left_up_down;
splitline=zeros(size(image{1,1}));
%imshow([image{1,rud(1)},splitline,image{1,rud(2)},splitline,image{1,rud(3)}])
imshow([image{1,lud(1)},splitline,image{1,lud(2)},splitline,image{1,lud(3)}])


%按列查找
col_list=cell(1,n);
for i=1:n  
    sum_=0;
    for j=1:z  
        for k=1:h
        if image{1,i}(k,j) ~= 255&&sum_<1                 
            col_list{1,i}=[k,j];
            sum_=sum_+1;
        else
            break;
        end
        end
    end
end
%按行查找
rol_list=cell(1,n);
for i=1:n  
    sum_=0;
    for j=1:h  
        for k=1:z
            sum_=0;
        if (sum_<1)&&(image{1,i}(j,k) ~= 255)                
            rol_list{1,i}=[j,k];
            sum_=sum_+1;
        else
            break;
        end
        end
    end
end

f=72;%人工干预
sequence=zeros(1,size(up,2));                       % 定义 n列向量，用来排序
index=1;
sequence(index) = f;                        % 选择第一张图片
i = f;

relevancy = ones(size(up,2), 1);
rho = 0.45;            % 分辨系数
list1=[];
label1=up;
for i=1:size(up,2)
    list1=[list1,img_right_vector(:,up(i))];
end
while index <= size(up,2) - 1
        op_tmp = img_right_vector(:, i);
        img_left_vector(:, i)= nan;
        t = repmat(op_tmp, [1, n]) - img_left_vector(:,:) ;
        mmin = min(min(t));
        mmax = max(max(t));
        alpha = (mmin + rho .* mmax) ./ (t +rho .* mmax);
        relevancy = mean(alpha);
        [gsort, ind] = sort(relevancy, 'descend');
        i = ind(1);
        index = index + 1;
        sequence(index) = i;
end

% 通过 系数的排序进行合成图片，在此之前，无论用什么方法，只需要求出关于关联系数的排序就好了
temp = image{ sequence(1) };
for i=2:size(up,2)
    temp=[temp image{ sequence(i)} ];       %将排序好的图片存放与temp       
end

%imshow(temp)                                    %完整显示整张纸片
%imsave(temp,"C:xxx")