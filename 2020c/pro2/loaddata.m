clc;
clear;
source1=importdata("1(1).xlsx");
src1=source1.data;
n1=size(src1,1);
score=src1(:,1);
reg=src1(:,2);
data1=[score,reg];
src2=importdata("1(2).xlsx");
n2=size(src2,1);
src3=importdata("1(3).xlsx");
n3=size(src3,1);
%计算税额
summary=0.0;
add1=[];
add2=[];
for i=1:n1
    for j=1:n2
        if src2(j,1)==i&&src2(j,3)==1
            summary=summary+src2(j,2);
        end
    end
   add1=[add1 summary];
end
summary=0;
for i=1:n1
    for j=1:n3
        if src3(j,1)==i&&src3(j,3)==1
            summary=summary+src3(j,2);
        end
    end
   add2=[add2 summary];
end
fail1=[];
fail2=[];
summary=0;
for i=1:n1
    for j=1:n2
        if src2(j,1)==i&&src2(j,3)==0
            summary=summary+1;
        end
    end
    fail1=[fail1 summary];
end
summary=0;
for i=1:n1
    for j=1:n3
        if src3(j,1)==i&&src3(j,3)==0
            summary=summary+1;
        end
    end
   fail2=[fail2 summary];
end
summary=0;
all1=[];
all2=[];
for i=1:n1
    for j=1:n2
        if src2(j,1)==i
            summary=summary+1;
        end
    end
   all1=[all1 summary];
end
summary=0;
for i=1:n1
    for j=1:n3
        if src3(j,1)==i
            summary=summary+1;
        end
    end
   all2=[all2 summary];
end
fail=fail1+fail2;
all=all1+all2;
tic_cod=(all-fail)./all;
profit=add2-add1;
profit=profit';
data=[src1';profit';tic_cod];





%%%数据2表%%%
table1=importdata("2(1).xlsx");
m1=size(table1,1);
table2=importdata("2(2).xlsx");
m2=size(table2,1);
table3=importdata("2(3).xlsx");
m3=size(table3,1);
%计算税额
tag=0.0;
plus1=[];
plus2=[];
for i=1+123:m1+123
    for j=1:m2
        if table2(j,1)==i&&table2(j,3)==1
            tag=tag+table2(j,2);
        end
    end
   plus1=[plus1 tag];
end
for m=1+123:m1+123
    for n=1:m3
        if table3(n,1)==m&&table3(n,3)==1
            tag=tag+table3(n,2);
        end
    end
   plus2=[plus2 tag];
end
getmoney=plus2-plus1;
getmoney=getmoney';
invalid1=[];
invalid2=[];
tag=0;
for i=1+123:m1+123
    for j=1:m2
        if table2(j,1)==i&&table2(j,3)==0
            tag=tag+1;
        end
    end
    invalid1=[invalid1 tag];
end
tag=0;
for i=1+123:m1+123
    for j=1:m3
        if table3(j,1)==i&&table3(j,3)==0
            tag=tag+1;
        end
    end
   invalid2=[invalid2 tag];
end
tag=0;
valid1=[];
valid2=[];
for i=1+123:m1+123
    for j=1:m2
        if table2(j,1)==i
            tag=tag+1;
        end
    end
   valid1=[valid1 tag];
end
tag=0;
for i=1+123:m1+123
    for j=1:m3
        if table3(j,1)==i
            tag=tag+1;
        end
    end
   valid2=[valid2 tag];
end
invalid=invalid1+invalid2;
valid=valid1+valid2;
valid_acc=(valid-invalid)./valid;
data2=[getmoney';valid_acc];