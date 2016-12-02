n=10;
%graph=[0,7,9,25,22,14;7,0,10,15,25,16;9,10,0,11,14,2;25,15,11,0,6,17;22,25,16,6,0,8;14,16,2,17,8,0];
graph=[];
coor=[];
xcoor=[];
ycoor=[];
rxcoor=[];
rycoor=[];
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
psize=1;
path(psize)=src;


for i=1:n
    orgarre(i)=rand*100+2;
    initial(i)=orgarre(i);
  % orgarre(i)=10;
end
disp('Energy of the system before transmission of data');
disp(initial);


for i=1:n
    for j=1:n
        arre(i,j)=(orgarre(i)-graph(i,j)* 0.1);
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
        arre(i,j)=(orgarre(i)-graph(i,j)* 0.1);
        
    end
end

%dijkastra algo...........

[dij,dsize]=Dijkstra(graph,orgarre,arre,arey,ind,src,des,n);

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
 
disp('Path followed is ');
disp(path);

disp('Energy of the system after transmission of data ');
disp(orgarre);

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

figure(2)
subplot(1,1,1);
plot(xcoor,ycoor,'*',dxcoor,dycoor,srxcoor,srycoor,'v',dsxcoor,dsycoor,'.','LineWidth',2);
xlabel('X');
ylabel('Y');
grid on;

figure
pause(0.05);
subplot(1,1,1);
%plot(dsxcoor,dsycoor,'.');
plot(xcoor,ycoor,'*',rxcoor,rycoor,'b',srxcoor,srycoor,'v',dsxcoor,dsycoor,'.','LineWidth',2);
xlabel('X');
ylabel('Y');


grid on;