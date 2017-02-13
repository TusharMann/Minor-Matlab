n=10;

graph=[];
coor=[];
mindis=[];
find=[];
xcoor=[];
ycoor=[];

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

left=[];
used=[];

for i=1:n
    left(i)=rand*100+2;
    used(i)=100-left(i);
    %orgarre(i)=10;
end
disp('Used energy of the each node');
disp(used);

for i=1:n
    s=0;
    for j=1:n
        s=s+graph(i,j);
    end
    mindis(i)=s/n;
end

disp('Mobility ');
disp(mindis);

for i=1:n
    find(i)=0.4*mindis(i)+0.5*used(i);
end

head=find(1);
ch=1;
for i=2:n
    if find(i)<head
        head=find(i);
        ch=i;
    end
end

disp('Find data');
disp(find);


for i=1:n
    xcoor(i)=coor(i,1);
    ycoor(i)=coor(i,2);
end

chx=coor(ch,1);
chy=coor(ch,2);

figure
pause(0.05);
subplot(1,1,1);
plot(xcoor,ycoor,'*',chx,chy,'v','LineWidth',2);
title('Cluster Head');
xlabel('X');
ylabel('Y');

grid on;