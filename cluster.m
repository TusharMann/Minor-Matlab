n=100;

graph=[];
coor=[];
mindis=[];
find=[];
xcoor=[];
ycoor=[];
tfind=[];
chx=[];
chy=[];


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

for i=1:n
    tfind(i,1)=find(i);
    tfind(i,2)=i;
end

disp('Find data');
disp(find);

for i=1:n
    for j=1:n-1
      if tfind(j,1)>tfind(j+1,1)
          temp=tfind(j,1);
          tfind(j,1)=tfind(j+1,1);
          tfind(j+1,1)=temp;
          
          temp=tfind(j,2);
          tfind(j,2)=tfind(j+1,2);
          tfind(j+1,2)=temp;
      end
    end
end


for i=1:n
    xcoor(i)=coor(i,1);
    ycoor(i)=coor(i,2);
end

for i=1:10
    chx(i)=coor(tfind(i,2),1);
    chy(i)=coor(tfind(i,2),2);

end


figure
pause(0.05);
subplot(1,1,1);

plot(xcoor,ycoor,'*',chx,chy,'v','LineWidth',2);
title('Cluster Head');
xlabel('X');
ylabel('Y');
axis('equal');

grid on;