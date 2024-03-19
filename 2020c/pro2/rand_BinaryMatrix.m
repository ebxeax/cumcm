function [ BinaryMatrix ] = rand_BinaryMatrix( i, j )

% 随机bai生成dui行j列的zhi0和1元素填充的矩阵dao

BinaryMatrix = rand(i,j);

for count_i = 1:i

for count_j = 1:j

if BinaryMatrix(count_i, count_j) < 0.5

BinaryMatrix(count_i, count_j) = 0;

else

BinaryMatrix(count_i, count_j) = 1;

end

end

end

end