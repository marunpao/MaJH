clc;
clear; % Kalman算法 鲁棒性测试计算
for ii=2:32
filename=['D:\兼容互操作\算鲁棒性数据\',num2str(ii),'.xlsx'];    
data1=xlsread(filename);
N=6; %一次迭代5个数
da1=data1((1:75),4); %
da2=data1((1:75),1); %
X=zeros(1,N); %
Xkf=zeros(1,N);
P=zeros(1,N); %
X(1)=da1(end);
P(1)=0.01;
Z(1)=da1(end)-0.1;   %观测初始值
Xkf(1)=Z(1);
Q=0.01;
R=0.16;
W=sqrt(Q)*rand(1,N);
V=sqrt(R)*rand(1,N);
F=1;
G=1;
H=1;
I=eye(1);


for m2=2:N
 X(m2)=F*X(m2-1)+G*W(m2-1);
 Z(m2)=H*X(m2)+V(m2);
 X_pre=F*Xkf(m2-1);
 P_pre=F*P(m2-1)*F'+Q;
 Kt=P_pre*inv(H*P_pre*H'+R);
 e=Z(m2)-H*X_pre;
 Xkf(m2)=X_pre+Kt*e;
 P(m2)=(I-Kt*H)*P_pre;
end

da3=data1((76:80),2);
err=da3'-Xkf(1,(2:6));
RMSE(ii,1)=sqrt(sum(err.^2));
xlswrite('D:\兼容互操作\rm\rm3.xlsx',RMSE,1,['A',num2str(ii)]);
end
