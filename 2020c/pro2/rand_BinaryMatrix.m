function [ BinaryMatrix ] = rand_BinaryMatrix( i, j )

% ���bai����dui��j�е�zhi0��1Ԫ�����ľ���dao

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