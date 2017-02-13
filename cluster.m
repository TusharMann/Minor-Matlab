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

%For 10 nodes
%orgarre=[61 75 66 46 56 3 76 18 70 12];

%For 20 nodes
%orgarre=[61.8312,75.1722,66.7746,46.5825,56.7009,31.6321,76.4693,18.2085,70.6775,12.4082,89.5943,53.7954,64.2475,60.7045,22.7742,29.0182, 49.0923, 23.0689,86.4309,21.4764];

%For 30 nodes
%orgarre=[61.8312,19,75.1722,66.7746,46.5825,56.7009,31.6321,26,76.4693,18.2085,70.6775,12.4082,89.5943,14,53.7954,64.2475,60.7045,22.7742,29.0182, 49.0923,39, 23.0689,86.4309,21.4764,16,81,51,32,71,27];

%For 40 nodes
%orgarre=[35.0357,69.9728,15.6553,74.1227,9.6929,62.7110,51.4174,79.9052,64.6578,92.3721,61.8312,19,75.1722,66.7746,46.5825,56.7009,31.6321,26,76.4693,18.2085,70.6775,12.4082,89.5943,14,53.7954,64.2475,60.7045,22.7742,29.0182, 49.0923,39, 23.0689,86.4309,21.4764,16,81,51,32,71,27];

%For 50 nodes
%orgarre=[54.6876,43.6799,66.0704,62.6713,25.9658,40.1402,3.5487,100.4064,15.3036,12.6216,35.0357,69.9728,15.6553,74.1227,9.6929,62.7110,51.4174,79.9052,64.6578,92.3721,61.8312,19,75.1722,66.7746,46.5825,56.7009,31.6321,26,76.4693,18.2085,70.6775,12.4082,89.5943,14,53.7954,64.2475,60.7045,22.7742, 29.0182, 49.0923,39, 23.0689,86.4309,21.4764,16,81,51,32,71,27];


%orgarre=initial;
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




