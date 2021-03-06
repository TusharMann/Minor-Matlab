n=52;

graph=[];
coor=[];
xcoor=[];
ycoor=[];
rxcoor=[];
rycoor=[];
dxcoor=[];
dycoor=[];
dij=[];

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



src=input('Input Source ');
start=src;
des=input('Input Destination ');
path=[];
remaining=[];
orgarre=[];
initial=[];
arre=[];
arey=[];
srdist=[];
ind=[];
denergy=[];
psize=1;
path(psize)=src;

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
    orgarre(i)=rand*100+2;
    initial(i)=orgarre(i);
    %orgarre(i)=10;
end
disp('Energy of the system before transmission of data');
disp(initial);


for i=1:n
    for j=1:n
        arre(i,j)=(orgarre(i)-graph(i,j)* 0.2);
        if arre(i,j) == 100
            arre(i,j)=0;
        end
		
    end
end

for i=1:n
    srdist(i)=graph(src,i);
     arey(i)=orgarre(i);
     ind(i)=0;
end		
	
for i=1:n
    for j=1:n
        arre(i,j)=(orgarre(i)-graph(i,j)* 0.2);
        
    end
end

%dijkastra algo...........

[dij,dsize,denergy]=Dijkstra(graph,orgarre,arre,arey,ind,src,des,n);

%end..................
  


while src~=des
  %  [src,orgarre,arey,ind]=call(des,src,graph,arre,ind,arey,srdist,orgarre,n);
  if src == des
    break;
  end
		
		
   index=0;
	 %1z=0;
     %li = 9999;
	 l = -9999;
     
		for i=1:n
			ind(src)=1;
            
			if (ind(i)==0) && (i~=src)
			z=arre(src)+arey(i)-graph(src,i);
               
            	if(index==des)
               
				orgarre(src) =arre(src,index);
				arey(src)= orgarre(src);
                psize=psize+1;
                path(psize)=index;
                src=index;
				break;
            end
      
	      
            if(l<z) && (orgarre(i)>=10)
			    l=z;
				index=i;
				ind(i)=1;
            
			else
			
				continue;
            end
            
            else
				continue;
            end
            
				
		
		
        end
		
		%System.out.println("index"+"->"+index);
       % ind(index)=1;
        %xlabel(n);
        %ylabel(n);
        %plot(index,n);
       % disp(index);
        if src == des
             break;
        end

         psize=psize+1;
        path(psize)=index;
      
        
		orgarre(src) =arre(src,index);
		arey(src)=orgarre(src);
        src=index;
	%call(des, index, graph, arre,ind,arey,srdist,n);
	

end
 
disp('Path followed by our algorithm ');
disp(path);

disp('Path followed by Dijkstra ');
disp(dij);

disp('Energy of the system after transmission of data in our algo ');
disp(orgarre);

disp('Energy of the system after transmission of data in dijkstra ');
disp(denergy);


for i=1:psize
    remaining(i)=orgarre(path(i));
end

for i=1:n
    xcoor(i)=coor(i,1);
    ycoor(i)=coor(i,2);
end

for i=1:psize
    rxcoor(i)=coor(path(i),1);
    rycoor(i)=coor(path(i),2);
end

for i=1:dsize
    dxcoor(i)=coor(dij(i),1);
    dycoor(i)=coor(dij(i),2);
end


srxcoor=coor(start,1);
srycoor=coor(start,2);

dsxcoor=coor(des,1);
dsycoor=coor(des,2);

figure
subplot(1,1,1);
plot(xcoor,ycoor,'*',dxcoor,dycoor,srxcoor,srycoor,'v',dsxcoor,dsycoor,'.','LineWidth',2);
title('Dijkstra Algorithm Result');
xlabel('X');
ylabel('Y');
grid on;

figure
pause(0.05);
subplot(1,1,1);
plot(xcoor,ycoor,'*',rxcoor,rycoor,'b',srxcoor,srycoor,'v',dsxcoor,dsycoor,'.','LineWidth',2);
title('Hybrid Algorithm Result');
xlabel('X');
ylabel('Y');


grid on;