%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vertices=[0 0; 1/2 sqrt(3)/2; 1 0; 1/2 -sqrt(3)/2; 0 0];
% ImageVertices=[0 0; 1/2 .5*sqrt(3)/2; 1 0; 1/2 .5*(-sqrt(3)/2); 0 0];
% Vertices=[0 0; 1/2 sqrt(3)/2; 1 0; 0 0];
% ImageVertices=[0 0; 1/2 1.5*sqrt(3)/2; 1 0; 0 0];
% Vertices=[0 0; 1/2 sqrt(3)/2; 1 0; 1/2 0; 0 0];
% ImageVertices=[0 0; 1/2 1.5*sqrt(3)/2; 1 0; .505 -.1; 0 0];
Vertices=[0 0; 1/2 sqrt(3)/2; 3/2 sqrt(3)/2; 2 0; 3/2 -sqrt(3)/2; 1/2 -sqrt(3)/2; 0 0];
%ImageVertices=[0 .3; 1/2 sqrt(3)/2; 3/2 1.25*sqrt(3)/2; 2 0; 1.3*3/2 -sqrt(3)/2; 1/2 -sqrt(3)/2; 0 0];
ImageVertices(1:6,:)=Vertices(1:6,:)+2/(8)*(rand(6,2)-ones(6,2));
ImageVertices(7,:)=ImageVertices(1,:);
Vertices=1/2*Vertices; ImageVertices=1/2*ImageVertices;
% Vertices=[0 0; 1/2 sqrt(3)/2; 3/2 sqrt(3)/2; 2 sqrt(3); 5/2 sqrt(3)/2; 2 0; 0 0];
% ImageVertices=[0 0; 1/2 1.5*sqrt(3)/2; 3/2 sqrt(3)/2; 2 sqrt(3); 3 sqrt(3)/2; 1.75 -.25; 0 0];
% Vertices=1/10*Vertices; ImageVertices=1/10*ImageVertices;
mesh_size=20;
mesh_scale=1/mesh_size;
% [PointSet,ConnectivityList,FirstParityInteriorVariablesConnectivity,SecondParityInteriorVariablesConnectivity,...
%     ThirdParityInteriorVariablesConnectivity,BoundaryVariableStorage]=Setup(Vertices, mesh_size);
[PointSet,ConnectivityList,FirstParityInteriorVariablesConnectivity,SecondParityInteriorVariablesConnectivity,...
    ThirdParityInteriorVariablesConnectivity,BoundaryVariableStorage]=Setup_two(Vertices, mesh_size, mesh_scale);


ImagePointSet=PointSet;
    for j=1:1:length(Vertices)-1
        [~,index]=ismembertol(Vertices(j,1:2),PointSet(:,1:2),'ByRows',true );
        ImagePointSet( index, 1:2 )=ImageVertices(j,:);
    end
%I also want to adjust in the image that the line segments between vertices
%are sent to line segments between image vertices.
for k=1:1:length(Vertices)-1
    
    for j=1:1:3
        
        for l=1:1:size(BoundaryVariableStorage{j,k},2)
            
            t=(Vertices(k,1)+1i*Vertices(k,2)-...
                (PointSet(ConnectivityList(BoundaryVariableStorage{j,k}(1,l),j),1)+...
                1i*PointSet(ConnectivityList(BoundaryVariableStorage{j,k}(1,l),j),2)))/...
                (Vertices(k,1)+1i*Vertices(k,2)-(Vertices(k+1,1)+1i*Vertices(k+1,2)));                  
            
            ImagePointSet(ConnectivityList(BoundaryVariableStorage{j,k}(1,l),j),1:2)=...
                [real((1-t)*(ImageVertices(k,1)+1i*ImageVertices(k,2))+t*(ImageVertices(k+1,1)+...
                1i*ImageVertices(k+1,2))) imag((1-t)*(ImageVertices(k,1)+1i*ImageVertices(k,2))+...
                t*(ImageVertices(k+1,1)+1i*ImageVertices(k+1,2)))];
    
%             fprintf('%f \n',imag((1-t)*(ImageVertices(k,1)+1i*ImageVertices(k,2))+t*(ImageVertices(k+1,1)+...
%                 1i*ImageVertices(k+1,2))))
            
        end
    
    end
    
end

[inside_polygon,on_polygon]=inpolygon(PointSet(:,1),PointSet(:,2),...
    Vertices(:,1),Vertices(:,2));
strictly_inside=inside_polygon-on_polygon;
strictly_inside(inside_polygon-on_polygon==0)=[];
% ImagePointSet(inside_polygon-on_polygon==1,1:2)=ImagePointSet(inside_polygon-on_polygon==1,1:2)+...
%     (1/(2*Mesh_size))*(2*rand(numel(strictly_inside),2)-ones(numel(strictly_inside),2));
ImagePointSet(inside_polygon-on_polygon==1,2)=.5*ImagePointSet(inside_polygon-on_polygon==1,2);
ImagePointSetBeforeFix=ImagePointSet;

number_of_triangles=length(ConnectivityList);
number_of_variables=length(PointSet)-length(Vertices);
WhereToAddGradient=zeros(3,number_of_triangles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=zeros(3,number_of_triangles);
for k=1:1:number_of_triangles
x(:,k)=[PointSet(ConnectivityList(k,1),1)+1i*PointSet(ConnectivityList(k,1),2);...
        PointSet(ConnectivityList(k,2),1)+1i*PointSet(ConnectivityList(k,2),2);...
        PointSet(ConnectivityList(k,3),1)+1i*PointSet(ConnectivityList(k,3),2)];
end
y=zeros(3,number_of_triangles);
for k=1:1:number_of_triangles
y(:,k)=[ImagePointSet(ConnectivityList(k,1),1)+1i*ImagePointSet(ConnectivityList(k,1),2);...
        ImagePointSet(ConnectivityList(k,2),1)+1i*ImagePointSet(ConnectivityList(k,2),2);...
        ImagePointSet(ConnectivityList(k,3),1)+1i*ImagePointSet(ConnectivityList(k,3),2)];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for iteration=1:1:1000

gradient_one=2*Interior_z_bar_derivative(x,y,PointSet,ConnectivityList,...
    FirstParityInteriorVariablesConnectivity,SecondParityInteriorVariablesConnectivity,...
    ThirdParityInteriorVariablesConnectivity);
gradient_two=boundary_derivative(x,y,PointSet,ConnectivityList,ImageVertices,BoundaryVariableStorage);
%gradient_two=zeros(size(PointSet,1),1);
descent_direction=-(gradient_one+gradient_two);

for j=1:1:size(PointSet,1)    
    WhereToAddGradient(abs(x-(PointSet(j,1)+1i*PointSet(j,2)))<1e-10)=descent_direction(j);    
end

objectivefunctionnotchanging=objective_function(x,y,number_of_triangles);
t=1; alpha=.1; beta=.7;    
%Here is where I actually start choosing t    
while objective_function(x,y+t*WhereToAddGradient,number_of_triangles)>...
    objectivefunctionnotchanging-alpha*t*(norm(descent_direction)^2)
    t=beta*t;     
end

y=y+t*WhereToAddGradient;
fprintf('iteration - %d    t - %f \n', iteration, t)

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:1:number_of_triangles
    ImagePointSet(ConnectivityList(k,1),1)=real(y(1,k)); ImagePointSet(ConnectivityList(k,1),2)=imag(y(1,k));
    ImagePointSet(ConnectivityList(k,2),1)=real(y(2,k)); ImagePointSet(ConnectivityList(k,2),2)=imag(y(2,k));
    ImagePointSet(ConnectivityList(k,3),1)=real(y(3,k)); ImagePointSet(ConnectivityList(k,3),2)=imag(y(3,k));
end
[~,DilatationStorage]=...
    DilatationCalculationWithStorage_R(PointSet,ImagePointSet,ConnectivityList);
PreImageTriangulation=triangulation(ConnectivityList, PointSet);
PreFixTriangulation=triangulation(ConnectivityList,ImagePointSetBeforeFix);
ImageTriangulation=triangulation(ConnectivityList, ImagePointSet);
figure

hold on  
subplot(1,3,1)
triplot(PreImageTriangulation)
    TEE=[1 2 3];
    for z=1:1:length(ConnectivityList)
    ex=[PointSet(ConnectivityList(z,1),1) PointSet(ConnectivityList(z,2),1) PointSet(ConnectivityList(z,3),1)];
    why=[PointSet(ConnectivityList(z,1),2) PointSet(ConnectivityList(z,2),2) PointSet(ConnectivityList(z,3),2)];
    Constant_k=DilatationStorage(z);
    patch(ex(TEE)',why(TEE)', [1 max(1-Constant_k,0) max(1-Constant_k,0)],'EdgeColor','b');
    end  
axis equal
%axis([0 2 -1 1])

subplot(1,3,2)
triplot(PreFixTriangulation)
axis equal
%axis([0 2 -1 1])

subplot(1,3,3)
triplot(ImageTriangulation)
    TEE=[1 2 3];
    for z=1:1:length(ConnectivityList)
    ex=[ImagePointSet(ConnectivityList(z,1),1) ImagePointSet(ConnectivityList(z,2),1)...
        ImagePointSet(ConnectivityList(z,3),1)];
    why=[ImagePointSet(ConnectivityList(z,1),2) ImagePointSet(ConnectivityList(z,2),2)...
        ImagePointSet(ConnectivityList(z,3),2)];
    Constant_k=DilatationStorage(z);
    patch(ex(TEE)',why(TEE)', [1 max(1-Constant_k,0) max(1-Constant_k,0)],'EdgeColor','b');
    end  
axis equal
%axis([0 2 -1 1])
hold off

temp=zeros(number_of_triangles,1);
for k=1:1:number_of_triangles
temp(k)=sqrt(abs(((x(3,k)-x(1,k))/(x(2,k)-x(1,k))-(y(3,k)-y(1,k))/(y(2,k)-y(1,k)))/...
(conj((x(3,k)-x(1,k))/(x(2,k)-x(1,k)))-(y(3,k)-y(1,k))/(y(2,k)-y(1,k))))^2);
%fprintf('%f \n', temp(k))
end
fprintf('max dilatation - %f \n', max(max(temp)))
fprintf('average dilatation - %f \n', sum(temp)/length(temp))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%









