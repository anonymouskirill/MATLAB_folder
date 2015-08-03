function [PointSet,ConnectivityList,FirstParityInteriorVariablesConnectivity,SecondParityInteriorVariablesConnectivity,ThirdParityInteriorVariablesConnectivity,BoundaryVariableStorage]=Setup_two(Vertices, mesh_size, mesh_scale)

x_coordinates=-mesh_size:1/2:(mesh_size+.5);
y_coordinates=-mesh_size*sqrt(3):sqrt(3):(mesh_size+.5)*sqrt(3);

[x,y]=meshgrid(x_coordinates, y_coordinates);

%Now I need to shift up every other point. Here it would be convenient if
%we had an even number of x-coordinates in our grid.
%horzcat(zeros(numel(0*sqrt(3):sqrt(3):5*sqrt(3)),1),...
    %sqrt(3)/2*ones(numel(0*sqrt(3):sqrt(3):5*sqrt(3)),1));
    
%I want one row, length(x)/2 columns of the above:
y=y+repmat(horzcat(zeros(numel(y_coordinates),1),...
    sqrt(3)/2*ones(numel(y_coordinates),1)),1,numel(x_coordinates)/2);

%Test that this grid looks right:
% figure
% plot(x(:),y(:),'b+')
% hold on
% axis equal
% hold off


%Now notice PointSet will go in order - read off x-coordinates y going up.
PointSet=[x(:) y(:)];
PointSet=horzcat(PointSet,zeros(size(PointSet,1),1));

%Now if I want to partition these into '1', '2', '3' vertices, this is
%actually easy, in the same column all the vertices have the same parity.
counter=1;
for k=-mesh_size:1/2:(mesh_size+.5)
    PointSet( abs(PointSet(:,1)-(k))<1e-10 ,3)=counter;
    counter=counter+1;
    if abs(counter-4)<1e-10
        counter=1;
    end
end


%Test that I am actually partitioning vertices correctly:
% figure
% plot(PointSet(PointSet(:,3)==1,1),PointSet(PointSet(:,3)==1,2),'b+')
% hold on
% plot(PointSet(PointSet(:,3)==2,1),PointSet(PointSet(:,3)==2,2),'r+')
% plot(PointSet(PointSet(:,3)==3,1),PointSet(PointSet(:,3)==3,2),'g+')
% axis equal
% hold off

%Now if I want to rescale the grid:
% mesh_scale=1/10;
PointSet=horzcat(mesh_scale*PointSet(:,1:2),PointSet(:,3));

%Now I want to cut away everything that is not part of my polygon:
% [in,on,tolerance]=inpoly(PointSet(:,1:2),Vertices);
[in,on]=inpolygon(PointSet(:,1),PointSet(:,2),...
    Vertices(:,1),Vertices(:,2));   

%Is this in/on function working well?
figure
plot(PointSet(in==1,1),PointSet(in==1,2),'b+')
hold on
plot(PointSet(on==1,1),PointSet(on==1,2),'r+')
hold off

PointSet=PointSet(in==1,1:3);


%Now I have to establish ConnectivityList. I go through each '1' vertex,
%check the nearby '2' vertices, and then check the nearby '3' vertices.
PointSetFirstParity=PointSet(PointSet(:,3)==1,1:2);
PointSetSecondParity=PointSet(PointSet(:,3)==2,1:2);
PointSetThirdParity=PointSet(PointSet(:,3)==3,1:2);

%Check if the parity is correct
% figure
% plot(PointSetFirstParity(:,1),PointSetFirstParity(:,2),'b+')
% hold on
% plot(PointSetSecondParity(:,1),PointSetSecondParity(:,2),'r+')
% plot(PointSetThirdParity(:,1),PointSetThirdParity(:,2),'g+')
% axis equal
% hold off

counter=1;
for j=1:1:size(PointSetFirstParity,1)
    
    Second_placement=find(abs( (PointSetFirstParity(j,1)+1i*PointSetFirstParity(j,2))-...
        (PointSetSecondParity(:,1)+1i*PointSetSecondParity(:,2)) )<= mesh_scale+1e-10 );

    for k=transpose(Second_placement)
        
        Third_placement=find(abs(PointSetSecondParity(k,1)+1i*PointSetSecondParity(k,2)-...
            (PointSetThirdParity(:,1)+1i*PointSetThirdParity(:,2)))<=mesh_scale+1e-10);
        
            for l=transpose(Third_placement)
                
                if abs(PointSetFirstParity(j,1)+1i*PointSetFirstParity(j,2)-...
                (PointSetThirdParity(l,1)+1i*PointSetThirdParity(l,2)))<=mesh_scale+1e-10
               
                [~,j_index]=ismembertol(PointSetFirstParity(j,1:2),PointSet(:,1:2),'ByRows', true);
                [~,k_index]=ismembertol(PointSetSecondParity(k,1:2),PointSet(:,1:2),'ByRows', true);
                [~,l_index]=ismembertol(PointSetThirdParity(l,1:2),PointSet(:,1:2),'ByRows', true);
                
                ConnectivityList(counter,:)=[j_index k_index l_index];
                counter=counter+1;
                
                end
                
            end
        
    end
    
end
        
%Check if ConnectivityList is right:
% figure
% hold on
% Triangulation=triangulation(ConnectivityList,PointSet(:,1:2));
% triplot(Triangulation)
% axis equal
% hold off



%Now for each interior vertex, I need the appropriate triangles connected
%to said vertex.
PointSetStrictlyInsidePolygon=PointSet;
[in,on]=inpolygon(PointSet(:,1),PointSet(:,2),...
    Vertices(:,1),Vertices(:,2));   
% [in,on]=inpolygon(PointSet(:,1:2),Vertices);
PointSetStrictlyInsidePolygon(in-on==0,:)=[];

PointSetStrictlyInsidePolygonFirstParity=PointSetStrictlyInsidePolygon(...
    PointSetStrictlyInsidePolygon(:,3)==1,:);
FirstParityInteriorVariablesConnectivity=zeros(6,length(PointSetStrictlyInsidePolygonFirstParity));
for j=1:1:length(PointSetStrictlyInsidePolygonFirstParity)
   [~,index]=ismembertol(PointSetStrictlyInsidePolygonFirstParity(j,:),PointSet,'ByRows',true);
   FirstParityInteriorVariablesConnectivity(:,j)=find(ConnectivityList(:,1)==index);
end

PointSetStrictlyInsidePolygonSecondParity=PointSetStrictlyInsidePolygon(...
    PointSetStrictlyInsidePolygon(:,3)==2,:);
SecondParityInteriorVariablesConnectivity=zeros(6,length(PointSetStrictlyInsidePolygonSecondParity));
for j=1:1:length(PointSetStrictlyInsidePolygonSecondParity)
   [~,index]=ismembertol(PointSetStrictlyInsidePolygonSecondParity(j,:),PointSet,'ByRows',true);
   SecondParityInteriorVariablesConnectivity(:,j)=find(ConnectivityList(:,2)==index);
end

PointSetStrictlyInsidePolygonThirdParity=PointSetStrictlyInsidePolygon(...
    PointSetStrictlyInsidePolygon(:,3)==3,:);
ThirdParityInteriorVariablesConnectivity=zeros(6,length(PointSetStrictlyInsidePolygonThirdParity));
for j=1:1:length(PointSetStrictlyInsidePolygonThirdParity)
   [~,index]=ismembertol(PointSetStrictlyInsidePolygonThirdParity(j,:),PointSet,'ByRows',true);
   ThirdParityInteriorVariablesConnectivity(:,j)=find(ConnectivityList(:,3)==index);
end

%Check if inside vertices are right:
% figure
% plot(PointSetStrictlyInsidePolygon(:,1),PointSetStrictlyInsidePolygon(:,2),'b+')




%And now as before the flexible vertices on the boundary:
PointSetOnPolygon=PointSet;
PointSetOnPolygon(on==0,:)=[];
FlexiblePointSetOnPolygon=PointSetOnPolygon;
        for k=1:1:length(Vertices)
            if ismembertol(Vertices(k,:),PointSetOnPolygon(:,1:2),'ByRows', true)==1
            [~,index]=ismembertol(Vertices(k,:),PointSetOnPolygon(:,1:2),'ByRows', true);
            FlexiblePointSetOnPolygon(index,:)=[0 0 0];
            end
        end
FlexiblePointSetOnPolygon(FlexiblePointSetOnPolygon(:,3)==0,:)=[];            

%So I want to be able to store in front of which vertex each boundary
%variable occurs, and also the parity of said boundary variable. Columns
%correspond to vertices, rows correspond to parities. So
%BoundaryVariableStorage{j,k} calls, in column order, the triangles
%(ordered by ConnectivityList) that touch a flexible index
%with parity j, in front of vertex k.
BoundaryVariableStorage=cell(3,length(Vertices)-1);

for k=1:1:length(Vertices)-1
    
    for j=1:1:size(FlexiblePointSetOnPolygon,1)
    
    if abs((Vertices(k+1,2)-Vertices(k,2))/(Vertices(k+1,1)-Vertices(k,1))-...
            (FlexiblePointSetOnPolygon(j,2)-Vertices(k,2))/(FlexiblePointSetOnPolygon(j,1)-Vertices(k,1)))<1e-10
  
            [~,index]=ismembertol(FlexiblePointSetOnPolygon(j,1:2),PointSet(:,1:2),'ByRows',true);
            BoundaryVariableStorage{FlexiblePointSetOnPolygon(j,3),k}=...
                horzcat(BoundaryVariableStorage{FlexiblePointSetOnPolygon(j,3),k},...
                find(ConnectivityList(:,FlexiblePointSetOnPolygon(j,3))==index));
            
    end
    
    end
    
end


end







       