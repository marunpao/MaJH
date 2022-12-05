function y=vondrak(x,r)
len=length(x);
B=sparse(len-3,4);
B(:,1)=-1;
B(:,2)=3;
B(:,3)=-3;
B(:,4)=1;
D=[0;1;2;3];
a=spdiags(B,D,len-3,len);

b=speye(len);
c=(b+len/(len-3)*r*r*(a'*a));

y=c\x;
end