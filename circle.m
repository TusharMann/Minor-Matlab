% angle=linspace(0,2*pi,360);
% x=5*cos(angle);
% y=5*sin(angle);
% plot(x,y);
% axis('equal');
n=10;
X=rand(n,1)*10;
Y=rand(n,1)*10;
R=rand(n,1)*3;
P=[0:0.1:2*pi 0];
xr=R*cos(P);
yr=R*sin(P);
X_C=bsxfun(@plus,X,xr);
Y_C=bsxfun(@plus,Y,yr);
plot(X_C',Y_C','g')
axis equal