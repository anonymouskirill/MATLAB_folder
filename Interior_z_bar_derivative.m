function answer=Interior_z_bar_derivative(x,y,PointSet,ConnectivityList,FirstParityInteriorVariablesConnectivity,SecondParityInteriorVariablesConnectivity,ThirdParityInteriorVariablesConnectivity)

answer=zeros(length(PointSet),1);

for j=1:1:size(FirstParityInteriorVariablesConnectivity,2)
    for k=1:1:6
    answer(ConnectivityList(FirstParityInteriorVariablesConnectivity(k,j),1))=...
        answer(ConnectivityList(FirstParityInteriorVariablesConnectivity(k,j),1))+...
        z_bar_derivative_vertex1(x,y,FirstParityInteriorVariablesConnectivity(k,j));    
    end
end


for j=1:1:size(SecondParityInteriorVariablesConnectivity,2)
    for k=1:1:6
    answer(ConnectivityList(SecondParityInteriorVariablesConnectivity(k,j),2))=...
        answer(ConnectivityList(SecondParityInteriorVariablesConnectivity(k,j),2))+...
        z_bar_derivative_vertex2(x,y,SecondParityInteriorVariablesConnectivity(k,j));    
    end
end


for j=1:1:size(ThirdParityInteriorVariablesConnectivity,2)
    for k=1:1:6
    answer(ConnectivityList(ThirdParityInteriorVariablesConnectivity(k,j),3))=...
        answer(ConnectivityList(ThirdParityInteriorVariablesConnectivity(k,j),3))+...
        z_bar_derivative_vertex3(x,y,ThirdParityInteriorVariablesConnectivity(k,j));    
    end
end

end