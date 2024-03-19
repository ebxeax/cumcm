function [data_PCA, COEFF, sum_explained,latent1]=pcaff(data,k)
% k:ǰk�����ɷ�
data=zscore(data);  %��һ������
[COEFF,SCORE,latent,tsquared,explained,mu]=pca(data);
latent1=100*latent/sum(latent);%��latent����ֵ�ܺ�ͳһΪ100�����ڹ۲칱����
data= bsxfun(@minus,data,mean(data,1));
data_PCA=data*COEFF(:,1:k);
pareto(latent1);%����matlab��ͼ pareto�������ۻ��ֲ���ǰ95%�����y�еĲ���Ԫ�ز�δ��ʾ
xlabel('Principal Component');
ylabel('Variance Explained (%)');
% ͼ�е��߱�ʾ���ۻ��������ͳ̶�
print(gcf,'-dpng','PCAout.png');
sum_explained=sum(explained(1:k));