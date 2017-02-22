n=100;
k=n/10;

graph=[];
coor=[];
mindis=[];
find=[];
xcoor=[];
ycoor=[];
left=[];
used=[];
tfind=[];
chx=[];
chy=[];
x=[];
y=[];
one=[];
two=[];
three=[];
four=[];
five=[];
six=[];
seven=[];
eight=[];
nine=[];
a=0;
b=0;
c=0;
d=0;
e=0;
f=0;
g=0;
h=0;
k=0;

for i=1:n
    for j=1:2
         r=randi([1,100],1,1);   
         coor(i,j)=r;
    end
end


for i=1:n
    for j=1:n
        graph(i,j)=-9999;
    end
end


for i=1:n
    for j=1:n
        if i==j
            graph(i,j)=0;
            continue;
        end
        
        
        if(graph(i,j)== -9999)
            d=((coor(i,1)-coor(j,1))*(coor(i,1)-coor(j,1))+(coor(i,2)-coor(j,2))*(coor(i,2)-coor(j,2)));
            b=sqrt(d);
            graph(i,j)=b;
            graph(j,i)=b;
            
        else
            continue;
        end
        
    end
end

for i=1:n
    left(i)=rand*100+2;
    used(i)=100-left(i);
    %orgarre(i)=10;
end
disp('Used energy of the each node');
disp(used);

for i=1:n
   if (coor(i)(1)<=33) && (coor(i)(2)<=33)
       a=a+1;
       one(a)=i;
   end
end


for i=1:n
    xcoor(i)=coor(i,1);
    ycoor(i)=coor(i,2);
end

for i=1:k
    chx(i)=coor(tfind(i,2),1);
    chy(i)=coor(tfind(i,2),2);

end


figure
pause(0.05);
subplot(1,1,1);

% for i=1:10
%     angle=linspace(0,2*pi,360);
%     x=5*cos(angle)+chx(i);
%     y=5*sin(angle)+chy(i);
% end
for i=1:k
  x(i,1)=chx(i);
  y(i,1)=chy(i)
end

R=10;
P=[0:0.1:2*pi 0];
xr=R*cos(P);
yr=R*sin(P);
X_C=bsxfun(@plus,x,xr);
Y_C=bsxfun(@plus,y,yr);
%plot(X_C',Y_C','g')

plot(xcoor,ycoor,'*',chx,chy,'v',X_C',Y_C','g','LineWidth',2);
title('Cluster Head');
xlabel('X');
ylabel('Y');
axis equal

grid on;