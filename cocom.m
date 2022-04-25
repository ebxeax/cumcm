function fc=cocom(p)%根据相似度求行的排列顺序
%load x2smat.mat
p1=p;tp1=p1;
fc=[1];
lo=1;tp1(1)=-1;
flag=1;tot=0;
while(flag==1)   
    tot=tot+1;
    tpo=0;
    min=255*255*255;
    for i=1:19
        if i~=lo && tp1(i)~=-1
            if min>x2smat(p1(lo),p1(i))
                min=x2smat(p1(lo),p1(i));
                tpo=i;
            end
        end
    end
    fc=[fc tpo];
    lo=tpo;
    tp1(lo)=-1;
    if tot==18
        flag=0;
    end
end
% la=0;
% for i=1:19
%     if tp1(i)~=-1
%         la=i;
%     end
% end
% fc=[fc la];