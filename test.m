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
for i=1:p
    s=0;
    for j=1:p
        s=s+graph(two(i),two(j));
    end
    mintwo(i)=s/p;
end

findtwo=[];
for i=1:p
    findtwo(i)=0.4*mintwo(i)+0.6*used(two(i));
end

min=findtwo(1);
for i=2:p
    if min>findtwo(i)
        min=findtwo(i);
        ch=i;
    end
end
l=l+1;
chh(l)=two(ch);

minthree=[];
for i=1:c
    s=0;
    for j=1:c
        s=s+graph(three(i),three(j));
    end
    minthree(i)=s/c;
end

findthree=[];
for i=1:c
    findthree(i)=0.4*minthree(i)+0.6*used(three(i));
end

min=findthree(1);
for i=2:c
    if min>findthree(i)
        min=findthree(i);
        ch=i;
    end
end
l=l+1;
chh(l)=three(ch);

minfour=[];
for i=1:q
    s=0;
    for j=1:q
        s=s+graph(four(i),four(j));
    end
    minfour(i)=s/q;
end

findfour=[];
for i=1:q
    findfour(i)=0.4*minfour(i)+0.6*used(four(i));
end

min=findfour(1);
for i=2:q
    if min>findfour(i)
        min=findfour(i);
        ch=i;
    end
end
l=l+1;
chh(l)=four(ch);

minfive=[];
for i=1:e
    s=0;
    for j=1:e
        s=s+graph(five(i),five(j));
    end
    minfive(i)=s/e;
end

findfive=[];
for i=1:e
    findfive(i)=0.4*minfive(i)+0.6*used(five(i));
end

min=findfive(1);
for i=2:e
    if min>findfive(i)
        min=findfive(i);
        ch=i;
    end
end
l=l+1;
chh(l)=five(ch);

minsix=[];
for i=1:f
    s=0;
    for j=1:f
        s=s+graph(six(i),six(j));
    end
    minsix(i)=s/f;
end

findsix=[];
for i=1:f
    findsix(i)=0.4*minsix(i)+0.6*used(six(i));
end

min=findsix(1);
for i=2:f
    if min>findsix(i)
        min=findsix(i);
        ch=i;
    end
end
l=l+1;
chh(l)=six(ch);

minseven=[];
for i=1:g
    s=0;
    for j=1:g
        s=s+graph(seven(i),seven(j));
    end
    minseven(i)=s/g;
end

findseven=[];
for i=1:g
    findseven(i)=0.4*minseven(i)+0.6*used(seven(i));
end

min=findseven(1);
for i=2:g
    if min>findseven(i)
        min=findseven(i);
        ch=i;
    end
end
l=l+1;
chh(l)=seven(ch);

mineight=[];
for i=1:h
    s=0;
    for j=1:h
        s=s+graph(eight(i),eight(j));
    end
    mineight(i)=s/h;
end

findeight=[];
for i=1:h
    findeight(i)=0.4*mineight(i)+0.6*used(eight(i));
end

min=findeight(1);
for i=2:h
    if min>findeight(i)
        min=findeight(i);
        ch=i;
    end
end
l=l+1;
chh(l)=eight(ch);

minnine=[];
for i=1:k
    s=0;
    for j=1:k
        s=s+graph(nine(i),nine(j));
    end
    minnine(i)=s/k;
end

findnine=[];
for i=1:k
    findnine(i)=0.4*minnine(i)+0.6*used(nine(i));
end

min=findnine(1);
for i=2:k
    if min>findnine(i)
        min=findnine(i);
        ch=i;
    end
end
l=l+1;
chh(l)=nine(ch);



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