X=data(:,2:end)';
X(1,:)=[];
[x,coeff,sum_ex,latent]=pcaff(X,3);