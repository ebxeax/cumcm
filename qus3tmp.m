clc
clear all
for i=0:208
d{i+1}=imread(strcat('C:\Users\ygx79\Desktop\¸½¼þ3\',num2str(i,'%03d'),'.bmp'));
d{i+1}=im2bw(d{i+1})
end

Tmatrix=zeros(11,19);
TCol=zeros(11,19);
leftEdge=12;
TopEdge=37;
Tmaxtrix(1,1)=50;
colspan=6;
rowspan=28;
TUsed=zeros(1,209);
count=1;
TCol(1,1)=50;

for j=1:length(TUsed)
    if(TUsed(j)~=1)
        tempTotal= sum(sum(d{j}(1:180,1:leftEdge)));
        if(tempTotal==180*leftEdge)
            TUsed(j)=1;
            count=count+1;
            TCol(count,1)=j;
        end
    end
end

for i=1:11
    for l=1:18
        maxcount=0;
        for j=1:209
            if(TUsed(j)~=1)
                count=0;
                samespan=0;
                k=UpBracket(d{j});
                if(i==1)
                    if(UpBracket(d{j})>=TopEdge)
                        ret=RightBracket(d{TCol(i,l)});
                            if(ret~=0)
                                if(RightBracket(d{TCol(i,l)})+LeftBracket(d{j}==colspan))
                                    samespan=samespan+1;
                                        TCol(i,l+1)=j;
                                            if(samespan>1)
                                                pause
                                            end
                                            break;
                                end
                            else
                                count=simstat(d{TCol(i,l)},d{j});
                                if(count>maxcount)
                                TCol(i,l+1)=j
                                maxcount=count;
                                end
                            end
                    end
                else
                t1=TCol(i,l);
                if(UpBracket(d{t1})==UpBracket(d{j}))
                    if(RightBracket(d{TCol(i,l)})~=0)
                        m=TCol(i,l);
                        n=RightBracket(d{m})+LeftBracket(d{j})
                        if(n==colspan)
                    TCol(i,l+1)=j;
                        end
                    else
                        count=simstat(d{TCol(i,l)},d{j})
                        if(count>maxcount)
                            TCol(i,l+1)=j;
                            maxcount=count;
                        end
                    end
                end
                end
            end
        end
        temp=TCol(i,l+1);
        TUsed(temp)=1;
    end
end