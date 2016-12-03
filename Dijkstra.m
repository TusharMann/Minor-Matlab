function[path,psize,orgarre]= Dijkstra(graph,orgarre,arre,arey,ind,src,des,n)

psize=1;
path(psize)=src;



while src~=des
  
  if src == des
    break;
  end
		
		
   index=1;
   l = 9999;
     
		for i=1:n
			ind(src)=1;
            
			if (ind(i)==0) && (i~=src)
			z=graph(src,i);
               
		    if(index==des)
               
				orgarre(src) =arre(src,index);
				arey(src)= orgarre(src);
                psize=psize+1;
                path(psize)=index;
                src=index;
			
            end
        
            if(l>z) 
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


end