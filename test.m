n=100;
k=n/10;

graph=[];
coor=[];
xcoor=[];
ycoor=[];
left=[];
used=[];
chh=[];

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
l=0;

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

findone=[];
for i=1:a
    findone(i)=0.4*minone(i)+0.6*used(one(i));
end

min=findone(1);
for i=2:a
    if min>findone(i)
        min=findone(i);
        ch=i;
    end
end
l=l+1;
chh(l)=one(ch);

mintwo=[];
for i=1:a
    s=0;
    for j=1:a
        s=s+graph(two(i),two(j));
    end
    mintwo(i)=s/a;
end

findtwo=[];
for i=1:a
    findtwo(i)=0.4*mintwo(i)+0.6*used(two(i));
end

min=findtwo(1);
for i=2:a
    if min>findtwo(i)
        min=findtwo(i);
        ch=i;
    end
end
l=l+1;
chh(l)=one(ch);




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