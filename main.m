clc;
clear;
% path='E:\xuexi\wenjian\NTP3recevier\C\';
% namelist=dir([path,'*.txt']);
% l=length(namelist);
% p=cell(1,l);
% for i=1:l
% namelist(i).name;
% filename{i}=[path,namelist(i).name];
% p{i,1}=load(filename(i));
% end  
% p1=tab(:,1);
% plot(p1,p2);
e=[];
l4=[];
off=[];
t=[];
s3={};
path='E:\E\¼æÈÝ»¥²Ù×÷\lunwen\Ð¡\5\ICG\';
file=dir(strcat(path));
l1=length(file);
for n=340:414
y=strcat(path,file(n).name);
fid=fopen(y);
data=textscan(fid,'%s %s %f %f %u %u %u %f %s %f %f %u %u %u %u %u %u %u %u %u %u %u %s %s','HeaderLines',19);
fclose(fid);
data1=[];
data2=[];
data1=data{3};
data3=data{4};
data2=data{10};
[d1,row1]=unique(data3,'stable'); 
l=length(data2);
l2=length(d1);
for m=1:l2
    x(m,:)=Ghmstommjd(d1(m,1));
    e=data1(1,1);
    x1(m,:)=x(m,:)+e;
end
for q=1:(l2-1)
    c1=row1(q,1);
    c2=row1((q+1),1);
    s1=sum(data2((c1:(c2-1)),:));
    s2(q,:)=s1*0.1/(c2-c1);
    if q==(l2-1)
        s2(l2,1)=sum(data2(c2:l))*0.1/(l-c2+1);
    end
end   

s3{n-2,1}=s2(1:l2);
x2{n-2,1}=x1(1:l2);
s4=cell2mat(s3);
x3=cell2mat(x2);
% l3=length(s2);
% l4((n-2),:)=l3;
% l5=sum(l4(1:(n-2),:));
% off((l5+1):(l5+l3),:)=s2;
% t((15+1):(l5+l3)=x1;

end

%xlswrite('D:\¼æÈÝ»¥²Ù×÷\ËãÂ³°ôÐÔÊý¾Ý\BDTGPST1\153.xls',s4,1,'C1');
%xlswrite('D:\¼æÈÝ»¥²Ù×÷\ËãÂ³°ôÐÔÊý¾Ý\BDTGPST1\153.xls',x3,1,'A1');

[row2,col2]=find((s4>60));
[row3,col3]=find((s4<-60));
z=vondrak(s4-57,1000);
yy=smooth(z,'moving',100);
plot(x3,-s4);
hold on
plot(x3,yy);
title('8ÔÂUTC(NTSC)-GLNT');


