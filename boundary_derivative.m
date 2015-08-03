function answer=boundary_derivative(x,y,PointSet,ConnectivityList,ImageVertices,BoundaryVariableStorage)

answer=zeros(size(PointSet,1),1);

for k=1:1:length(ImageVertices)-1
       
        for l=1:1:size(BoundaryVariableStorage{1,k},2)
           
            for j=1:1:3
            
            answer(ConnectivityList(BoundaryVariableStorage{1,k}(j,l),1))=...
                answer(ConnectivityList(BoundaryVariableStorage{1,k}(j,l),1))+t_derivative_y1(x,y,...
                BoundaryVariableStorage{1,k}(j,l),ImageVertices(k,1)+1i*ImageVertices(k,2),...
                ImageVertices(k+1,1)+1i*ImageVertices(k+1,2));                    
            
            end
            
        end
        
        for l=1:1:size(BoundaryVariableStorage{2,k},2)
           
            for j=1:1:3
            
            answer(ConnectivityList(BoundaryVariableStorage{2,k}(j,l),2))=...
                answer(ConnectivityList(BoundaryVariableStorage{2,k}(j,l),2))+...
                t_derivative_y2(x,y,BoundaryVariableStorage{2,k}(j,l),ImageVertices(k,1)+1i*ImageVertices(k,2),...
                ImageVertices(k+1,1)+1i*ImageVertices(k+1,2));           
            
            end
            
        end
        
        for l=1:1:size(BoundaryVariableStorage{3,k},2)
           
            for j=1:1:3
            
            answer(ConnectivityList(BoundaryVariableStorage{3,k}(j,l),3))=...
                answer(ConnectivityList(BoundaryVariableStorage{3,k}(j,l),3))+...
                t_derivative_y3(x,y,BoundaryVariableStorage{3,k}(j,l),ImageVertices(k,1)+1i*ImageVertices(k,2),...
                ImageVertices(k+1,1)+1i*ImageVertices(k+1,2));
            
            end
            
        end        
    
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%It might also be a good idea here to point these values in the correct
%direction:
for k=1:1:length(ImageVertices)-1
   
    for j=1:1:3
        
        for l=1:1:size(BoundaryVariableStorage{j,k},2)
            
           answer(ConnectivityList(BoundaryVariableStorage{j,k}(1,l),j))=...
               ((ImageVertices(k+1,1)+1i*ImageVertices(k+1,2))-(ImageVertices(k,1)+1i*ImageVertices(k,2)))...
               *answer(ConnectivityList(BoundaryVariableStorage{j,k}(1,l),j));
            
        end
        
    end
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%








end