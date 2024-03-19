clc;
clear;
source1=importdata("1(1).xlsx");
src1=source1.data;
n1=size(src1,1);
score=src1(:,1);
reg=src1(:,2);
data1=[score,reg];
src2=importdata("1(2).xlsx");
str2=src2.textdata;
src2=src2.data;
n2=size(src2,1);
src3=importdata("1(3).xlsx");
str3=src3.textdata;
src3=src3.data;
n3=size(src3,1);

%º∆À„À∞∂Ó
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



str2 = deblank(str2);
str3 = deblank(str3);
S2 = regexp(str2, '/', 'split');
S3 = regexp(str3, '/', 'split');
month2=[];
reg=0;
for i=1:n2
    reg=S2{i,1}(2);
    month2=[month2,str2num(reg{1})];
end
month3=[];
for i=1:n3
    reg=S3{i,1}(2);
    month3=[month3,str2num(reg{1})];
end
month2_idx=src2(:,1);
        
    

