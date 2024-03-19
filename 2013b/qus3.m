clc; clear;
% ��һ�ʴ��� �ļ�����Qusetion1.m
filename = 'C:\Users\ygx79\Desktop\����3\*.bmp'
files = dir(filename);    %��������ͼ��
image = cell(1, size(files, 1)) ;  % ����һ��Ԫ��

for n=1:numel(files)
 image{n} = imread(['C:\Users\ygx79\Desktop\����3\', files(n).name]);
end

[h,z] = size(image{1,1});            % ����һ��ͼƬ����Ĵ�С(�У���)

% ֻȡ����������н��л�ɫ��������
% img_left_vector ��� n ��ͼƬ�ģ������� (1980��, n��)
for k=1:n
   img_left_vector(:, k) = image{1, k}(: , 1);      % ����k��ͼƬ�������һ�з������img_left_vector�ĵ�k��                     
   img_right_vector(:, k) = image{1, k}(: , z);      % ����k��ͼƬ�����ұ�һ�з������img_right_vector�ĵ�k��
   img_up_vector(:, k) = image{1, k}(1 , :);             % ����k��ͼƬ�����ұ�һ�з������img_up_vector�ĵ�k��
   img_down_vector(:, k) = image{1, k}(h , :);           % ����k��ͼƬ�����ұ�һ�з������img_down_vector�ĵ�k��
end

%����ҳ�߾�Ѱ�ұ�ԵͼƬ
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


%�ҳ���Ե�ظ���ͼƬ
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


%���в���
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
%���в���
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

f=72;%�˹���Ԥ
sequence=zeros(1,size(up,2));                       % ���� n����������������
index=1;
sequence(index) = f;                        % ѡ���һ��ͼƬ
i = f;

relevancy = ones(size(up,2), 1);
rho = 0.45;            % �ֱ�ϵ��
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

% ͨ�� ϵ����������кϳ�ͼƬ���ڴ�֮ǰ��������ʲô������ֻ��Ҫ������ڹ���ϵ��������ͺ���
temp = image{ sequence(1) };
for i=2:size(up,2)
    temp=[temp image{ sequence(i)} ];       %������õ�ͼƬ�����temp       
end

%imshow(temp)                                    %������ʾ����ֽƬ
%imsave(temp,"C:xxx")