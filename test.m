n=100;
k=n/10;

graph=[];
coor=[];
xcoor=[];
ycoor=[];
left=[];
used=[];

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
p=0;
c=0;
q=0;
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
    left(i)=randi([1,100],1,1);   
    used(i)=100-left(i);
end
    
disp('Used energy of the each node');
disp(used);

for i=1:n
   if (coor(i,1)<=33) && (coor(i,2)<=33)
       a=a+1;
       one(a)=i;
   
   elseif (coor(i,1)<=33) && (coor(i,2)<=66)
       p=p+1;
       two(p)=i;
      
   elseif (coor(i,1)<=33) && (coor(i,2)<=100)
       c=c+1;
       three(c)=i;
      
   elseif (coor(i,1)<=66) && (coor(i,2)<=33)
       q=q+1;
       four(q)=i;
       
   elseif (coor(i,1)<=66) && (coor(i,2)<=66)
       e=e+1;
       five(e)=i;
 
   
   elseif (coor(i,1)<=66) && (coor(i,2)<=100)
       f=f+1;
       six(f)=i;
   
   elseif (coor(i,1)<=100) && (coor(i,2)<=33)
       g=g+1;
       seven(g)=i;
      
   elseif (coor(i,1)<=100) && (coor(i,2)<=66)
       h=h+1;
       eight(h)=i;
      
   elseif (coor(i,1)<=100) && (coor(i,2)<=100)
       k=k+1;
       nine(k)=i;
       
   end
   
end

minone=[];
for i=1:a
    s=0;
    for j=1:a
        s=s+graph(one(i),one(j));
    end
    minone(i)=s/a;
end

for i=1:a
    
end



for i=1:n
    xcoor(i)=coor(i,1);
    ycoor(i)=coor(i,2);
end

figure
pause(0.05);
subplot(1,1,1);
plot(xcoor,ycoor,'*','LineWidth',2);
title('Cluster Head');
xlabel('X');
ylabel('Y');
grid on;