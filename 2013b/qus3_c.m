%%组合每行碎片
c=[ 8    1  33    46    54    57    69    71    94   127 138   139   154   159   167   175   176   197   209;
    169    2    19    24    27    31    42    51    63    77  87    88   101   121   143   148  180   192  196;
    50    3    12    23    29    55    58    66    92  96   119   130   142   144   179   187   189   191    193;
    15    4    13    32    40    52    74    83   108  116   129   135   136   160   161   170   177   200  204;
    90    5    41   102   103   109   114   115   118  120   124      141   147   152   155   156   186  195   208;
    126    14    17    22    67   107   110   111  140   146   151     158   174   182   183   185   188   198   205 ;
    30     6    11    38    45    49    56    60    65    76   93    99   105   112   172   173   181   202   207;
    62    7    20    21    37    53    64    68    70    73  79    80    97   100   117   132   163   164   178;
    39    9    10    25    26    36   47    75    82   89   104   106   123   131   149   162   168   190 194;
    72    16    18    28    34    61   81    84    86   133   134   153   157   166   171   199   201   203   206;
    95    35    43    44    48    59    78    85    91     98   113   122   125   128   137   145   150   165   184];
p1=c(1,:);p2=c(2,:);p3=c(3,:);p4=c(4,:);p5=c(5,:);p6=c(6,:);p7=c(7,:);p8=c(8,:);
p9=c(9,:);p10=c(10,:);p11=c(11,:);
 
q1=cocom(p1);%根据相似度求每列的顺序
q2=cocom(p2);q3=cocom(p3);q4=cocom(p4);q5=cocom(p5);q6=cocom(p6);q7=cocom(p7);
q8=cocom(p8);q9=cocom(p9);q10=cocom(p10);q11=cocom(p11);
f1=[8 209 139 159 127  69 176  46 175 1 138 54  57  94 154 71 167  33 197 ];
f2=[169  101  77  63 143  31  42  24 148 192 51   180   121    87 196  27 2    88   19];
f3=[50 55  66 144 187  3  58 193 179 119   191    96    12    23   130    29    92   189   142];
f4=[15   129     4   160    83   200   136    13    74 161   204   170   135    40    32    52   108   116 177];
f5=[90   147   103   155   115    41   152   208   156 141   186   109   118     5   102   114   195   120 124];
f6=[126    14   183   110   198    17   185   111   188  67   107   151    22   174   158   182   205   140  146];
f7=p7(q7);
f8=[62    20    79    68    70   100   163    97   132 80    64   117   164    73     7   178    21    53 37];
f9=[39   149    47   162    25    36    82   190   123 104   131   194    89   168    26     9    10   106  75];
f10=[72   157    84   133   201    18    81    34   203   199    16   134 171   206    86   153   166    28    61];
f11=[95    35    85   184    91    48   122    43   125   145    78   113   150    98   137   165   128    59    44];
tm1=[];tm2=[];tm3=[];tm4=[];tm5=[];tm6=[];tm7=[];tm8=[];tm9=[];tm10=[];tm11=[];
for i=1:19
    tpim=imread([path,files(f1(i)).name]);
    tm1=[tm1 tpim];
    tpim1=imread([path,files(f2(i)).name]);
    tm2=[tm2 tpim1];
    tpim2=imread([path,files(f3(i)).name]);
    tm3=[tm3 tpim2];
    tpim3=imread([path,files(f4(i)).name]);
    tm4=[tm4 tpim3];
    tpim4=imread([path,files(f5(i)).name]);
    tm5=[tm5 tpim4];
    tpim5=imread([path,files(f6(i)).name]);
    tm6=[tm6 tpim5];
    tpim6=imread([path,files(f7(i)).name]);
    tm7=[tm7 tpim6];
    tpim7=imread([path,files(f8(i)).name]);
    tm8=[tm8 tpim7];
    tpim8=imread([path,files(f9(i)).name]);
    tm9=[tm9 tpim8];
    tpim9=imread([path,files(f10(i)).name]);
    tm10=[tm10 tpim9];
    tpim10=imread([path,files(f11(i)).name]);
    tm11=[tm11 tpim10];
end
 
%%组合11张横向碎片
 
%first 50 tm3;
[a,b]=size(tm3);
eu=[];ed=[];%tm矩阵的第一行和最后一行;
eu=[eu tm1(1,:);tm2(1,:);tm3(1,:);tm4(1,:);tm5(1,:);tm6(1,:);tm7(1,:);tm8(1,:);tm9(1,:);tm10(1,:);tm11(1,:)];
ed=[ed tm1(a,:);tm2(a,:);tm3(a,:);tm4(a,:);tm5(a,:);tm6(a,:);tm7(a,:);tm8(a,:);tm9(a,:);tm10(a,:);tm11(a,:)];
eu=im2double(eu);
ed=im2double(ed);
ei=zeros(11,11);
for i=1:11
    for j=1:11
        eimat(i,j)=sum(abs(ed(i,:)-eu(j,:)));
    end
end
 
first=3;
q2ue=[];ff=ones(11,1);
q2ue=[q2ue first];ff(first)=-1;
flag=1;
pos=1;
tf=first;
while(flag==1)
    t=255*255*254;
    tp=0;
    for i=1:11
        if i~=tf && ff(i)~=-1;
            if t>eimat(tf,i)
                t=eimat(tf,i);
                tp=i;
            end
        end
    end
    tf=tp;ff(tf)=-1;
    pos=pos+1;
    q2ue=[q2ue tp];
    if pos==11
        flag=0;
    end
end
% imshow(tm4)
fim=[tm3;tm8;tm2;tm9;tm10;tm4;tm11;tm6;tm7;tm1;tm5;];
imshow(fim);