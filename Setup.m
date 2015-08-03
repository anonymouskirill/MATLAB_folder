function [PointSet,ConnectivityList,FirstParityInteriorVariablesConnectivity,SecondParityInteriorVariablesConnectivity,...
    ThirdParityInteriorVariablesConnectivity,BoundaryVariableStorage]=Setup(Vertices, quantity)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Vertices=[0 0; 1/2 sqrt(3)/2; 1 0; 1/2 -sqrt(3)/2; 0 0];
%Vertices=[0 0; 1/2 sqrt(3)/2; 3/2 sqrt(3)/2; 2 0; 3/2 -sqrt(3)/2; 1/2 -sqrt(3)/2; 0 0];
%Vertices=[0 0; 1/2 sqrt(3)/2; 3/2 sqrt(3)/2; 2 sqrt(3); 5/2 sqrt(3)/2; 2 0; 0 0];
%Vertices=[0 0; 1 0; 1 sqrt(3); 0 sqrt(3); 0 0];

%quantity=10;
[X, Y] = meshgrid(-2:1/2:4*quantity+.5,-quantity*sqrt(3):sqrt(3):(quantity+5)*sqrt(3));
Y=Y+repmat([0 sqrt(3)/2], [min(size(Y)),length(X)/2]);
X=(1/quantity)*X; Y=(1/quantity)*Y;

PointSet=[X(:),Y(:)];
PointSetWithParity=zeros(length(PointSet),3);
    PointSetWithParity(:,1)=PointSet(:,1);
    PointSetWithParity(:,2)=PointSet(:,2);
    
% figure
% plot(PointSet(:,1),PointSet(:,2),'r+')
% hold on
% axis equal
% hold off    
    
for height=-quantity:1:quantity

temporary=find(abs(PointSet(:,2)-( (height)/(quantity)*sqrt(3) ))<1e-4);
counter=1;
for j=1:1:length(temporary)
    PointSetWithParity(temporary(j),3)=counter;
    counter=counter+1;
    if counter==4
        counter=1;
    end
end

temporary=find(abs(PointSet(:,2)-( (height*sqrt(3)+sqrt(3)/2)/quantity ))<1e-4);
counter=3;
for j=1:1:length(temporary)
    PointSetWithParity(temporary(j),3)=counter;
    counter=counter+1;
    if counter==4
        counter=1;
    end
end

end




[inside_polygon,on_polygon]=inpolygon(PointSetWithParity(:,1),PointSetWithParity(:,2),...
    Vertices(:,1),Vertices(:,2));   
strictly_inside_polygon=inside_polygon-on_polygon;
%    size_of_strictly_inside_polygon=strictly_inside_polygon;
%    size_of_strictly_inside_polygon(size_of_strictly_inside_polygon==0)=[];
%number_of_interior_variables=numel(size_of_strictly_inside_polygon);
    PointSetXCoordinatesInsidePolygon=PointSetWithParity(:,1);
    PointSetXCoordinatesInsidePolygon(strictly_inside_polygon==0)=[];
    PointSetYCoordinatesInsidePolygon=PointSetWithParity(:,2);
    PointSetYCoordinatesInsidePolygon(strictly_inside_polygon==0)=[];
    PointSetParityInsidePolygon=PointSetWithParity(:,3);
    PointSetParityInsidePolygon(strictly_inside_polygon==0)=[];    
PointSetInsidePolygon=[PointSetXCoordinatesInsidePolygon, PointSetYCoordinatesInsidePolygon, ...
    PointSetParityInsidePolygon];
    PointSetXCoordinatesOnPolygon=PointSet(:,1);
    PointSetXCoordinatesOnPolygon(on_polygon==0)=[];
    PointSetYCoordinatesOnPolygon=PointSet(:,2);
    PointSetYCoordinatesOnPolygon(on_polygon==0)=[];
    PointSetParityOnPolygon=PointSetWithParity(:,3);
    PointSetParityOnPolygon(on_polygon==0)=[];        
PointSetOnPolygon=[PointSetXCoordinatesOnPolygon, PointSetYCoordinatesOnPolygon,PointSetParityOnPolygon];
PointSet=[X(:),Y(:)];
    PointSetInOrOnPolygonXCoordinates=PointSet(:,1);
    PointSetXCoordinates=PointSetInOrOnPolygonXCoordinates(inside_polygon);
    PointSetInOrOnPolygonYCoordinates=PointSet(:,2);
    PointSetYCoordinates=PointSetInOrOnPolygonYCoordinates(inside_polygon);
    PointSetParity=PointSetWithParity(:,3);
    PointSetParity(inside_polygon==0)=[];           
    PointSet=[PointSetXCoordinates, PointSetYCoordinates, PointSetParity];
    
temporary= PointSet(:,3)==1;
ParityOne=PointSet(temporary,:);

temporary= PointSet(:,3)==2;
ParityTwo=PointSet(temporary,:);

temporary= PointSet(:,3)==3;
ParityThree=PointSet(temporary,:);    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% figure
% plot(PointSet(:,1),PointSet(:,2),'r+')
% hold on
% axis equal
% hold off

% figure
% plot(PointSetOnPolygon(:,1),PointSetOnPolygon(:,2),'r+')
% hold on
% plot(PointSetInsidePolygon(:,1),PointSetInsidePolygon(:,2),'g+')
% axis equal
% hold off




counter=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for j=1:1:length(ParityOne)
   temporary=find( abs( ParityOne(j,1)+1i*ParityOne(j,2) - ( ParityTwo(:,1)+1i*ParityTwo(:,2) ) )...
       <= 1/quantity+1e-5 );
   temp=find( abs( ParityOne(j,1)+1i*ParityOne(j,2) - ( ParityThree(:,1)+1i*ParityThree(:,2) ) )...
       <= 1/quantity+1e-5 );
   
   for k=transpose(temporary)
       for l=transpose(temp)
        if abs(ParityTwo(k,1)+1i*ParityTwo(k,2)-(ParityThree(l,1)+1i*ParityThree(l,2)))<= 1/quantity+1e-5
           
           [~,j_index]=ismember(ParityOne(j,:),PointSet,'rows');
           [~,k_index]=ismember(ParityTwo(k,:),PointSet,'rows');
           [~,l_index]=ismember(ParityThree(l,:),PointSet,'rows');
            
           ConnectivityList(counter,:)=[j_index k_index l_index]; 
           counter=counter+1;
        end
       end
   end
   
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%So there will be two types of derivatives: interior and exterior. For the
%interior variables I want to know which six triangles neighbor that
%interior variable. 
PointSetInsidePolygonFirstParity=PointSetInsidePolygon;
PointSetInsidePolygonFirstParity(PointSetInsidePolygonFirstParity(:,3)==2,:)=[];
PointSetInsidePolygonFirstParity(PointSetInsidePolygonFirstParity(:,3)==3,:)=[];
FirstParityInteriorVariablesConnectivity=zeros(6,length(PointSetInsidePolygonFirstParity));
for j=1:1:length(PointSetInsidePolygonFirstParity)
   [~,index]=ismember(PointSetInsidePolygonFirstParity(j,:),PointSet,'rows');
   FirstParityInteriorVariablesConnectivity(:,j)=find(ConnectivityList(:,1)==index);
end

PointSetInsidePolygonSecondParity=PointSetInsidePolygon;
PointSetInsidePolygonSecondParity(PointSetInsidePolygonSecondParity(:,3)==1,:)=[];
PointSetInsidePolygonSecondParity(PointSetInsidePolygonSecondParity(:,3)==3,:)=[];
SecondParityInteriorVariablesConnectivity=zeros(6,length(PointSetInsidePolygonSecondParity));
for j=1:1:length(PointSetInsidePolygonSecondParity)
   [~,index]=ismember(PointSetInsidePolygonSecondParity(j,:),PointSet,'rows');
   SecondParityInteriorVariablesConnectivity(:,j)=find(ConnectivityList(:,2)==index);
end
   
PointSetInsidePolygonThirdParity=PointSetInsidePolygon;
PointSetInsidePolygonThirdParity(PointSetInsidePolygonThirdParity(:,3)==1,:)=[];
PointSetInsidePolygonThirdParity(PointSetInsidePolygonThirdParity(:,3)==2,:)=[];
ThirdParityInteriorVariablesConnectivity=zeros(6,length(PointSetInsidePolygonThirdParity));
for j=1:1:length(PointSetInsidePolygonThirdParity)
   [~,index]=ismember(PointSetInsidePolygonThirdParity(j,:),PointSet,'rows');
   ThirdParityInteriorVariablesConnectivity(:,j)=find(ConnectivityList(:,3)==index);
end




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




% FlexiblePointSetOnPolygonFirstParity=FlexiblePointSetOnPolygon;
% FlexiblePointSetOnPolygonFirstParity(FlexiblePointSetOnPolygonFirstParity(:,3)==2,:)=[];
% FlexiblePointSetOnPolygonFirstParity(FlexiblePointSetOnPolygonFirstParity(:,3)==3,:)=[];
% FirstParityBoundaryVariablesConnectivity=zeros(3,length(FlexiblePointSetOnPolygonFirstParity));
% for j=1:1:length(FlexiblePointSetOnPolygonFirstParity)
%    [~,index]=ismember(FlexiblePointSetOnPolygonFirstParity(j,:),PointSet,'rows');
%    FirstParityBoundaryVariablesConnectivity(:,j)=find(ConnectivityList(:,1)==index);
% end
% 
% FlexiblePointSetOnPolygonSecondParity=FlexiblePointSetOnPolygon;
% FlexiblePointSetOnPolygonSecondParity(FlexiblePointSetOnPolygonSecondParity(:,3)==1,:)=[];
% FlexiblePointSetOnPolygonSecondParity(FlexiblePointSetOnPolygonSecondParity(:,3)==3,:)=[];
% SecondParityBoundaryVariablesConnectivity=zeros(3,length(FlexiblePointSetOnPolygonSecondParity));
% for j=1:1:length(FlexiblePointSetOnPolygonSecondParity)
%    [~,index]=ismember(FlexiblePointSetOnPolygonSecondParity(j,:),PointSet,'rows');
%    SecondParityBoundaryVariablesConnectivity(:,j)=find(ConnectivityList(:,2)==index);
% end
% 
% FlexiblePointSetOnPolygonThirdParity=FlexiblePointSetOnPolygon;
% FlexiblePointSetOnPolygonThirdParity(FlexiblePointSetOnPolygonThirdParity(:,3)==1,:)=[];
% FlexiblePointSetOnPolygonThirdParity(FlexiblePointSetOnPolygonThirdParity(:,3)==2,:)=[];
% ThirdParityBoundaryVariablesConnectivity=zeros(3,length(FlexiblePointSetOnPolygonThirdParity));
% for j=1:1:length(FlexiblePointSetOnPolygonThirdParity)
%    [~,index]=ismember(FlexiblePointSetOnPolygonThirdParity(j,:),PointSet,'rows');
%    ThirdParityBoundaryVariablesConnectivity(:,j)=find(ConnectivityList(:,3)==index);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  figure
% % % % plot(Vertices(:,1), Vertices(:,2), 'd')
%  hold on
% % % %     Triangulation=triangulation(ConnectivityList,PointSet(:,1:2));
% % % %     triplot(Triangulation)
% % % % %plot(X(:),Y(:),'r+')
% % % % % plot(ParityOne(:,1), ParityOne(:,2), 'b+')
% % % % % % % plot(PointSetXCoordinates,PointSetYCoordinates,'r+')
% % % % % % % plot(PointSetInsidePolygon(:,1),PointSetInsidePolygon(:,2),'g+')
% % % % % % % plot(PointSetOnPolygon(:,1),PointSetOnPolygon(:,2),'b+')
% % % % % % % plot(PointSet(:,1),PointSet(:,2),'r+')
% % % % % plot(ParityTwo(:,1), ParityTwo(:,2), 'r+')
% % % % % plot(ParityThree(:,1), ParityThree(:,2), 'g+')
% % % % Triangulation=triangulation(ThirdParityBoundaryVariablesConnectivity(:,:,2),PointSet);
% % % % triplot(Triangulation)
% plot(FlexiblePointSetOnPolygon(:,1),FlexiblePointSetOnPolygon(:,2),'r+')
%  axis equal
%  hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



 
end



