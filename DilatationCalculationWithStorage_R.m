function [answerone, answertwo]=DilatationCalculationWithStorage_R(PointSet,ImagePointSet,ConnectivityList)

%Now I want to be able to calculate the dilatation of this associated map
%as long as I know what my PointSet and ImagePointSet vertices are. 
DilatationStorage=zeros(length(ConnectivityList),1);
for k=1:1:length(ConnectivityList)
DilatationStorage(k)=abs((((PointSet(ConnectivityList(k,3),1)+1i*PointSet(ConnectivityList(k,3),2))-(PointSet(ConnectivityList(k,1),1)+1i*PointSet(ConnectivityList(k,1),2)))/((PointSet(ConnectivityList(k,2),1)+1i*PointSet(ConnectivityList(k,2),2))-(PointSet(ConnectivityList(k,1),1)+1i*PointSet(ConnectivityList(k,1),2)))-((ImagePointSet(ConnectivityList(k,3),1)+1i*ImagePointSet(ConnectivityList(k,3),2))-(ImagePointSet(ConnectivityList(k,1),1)+1i*ImagePointSet(ConnectivityList(k,1),2)))/((ImagePointSet(ConnectivityList(k,2),1)+1i*ImagePointSet(ConnectivityList(k,2),2))-(ImagePointSet(ConnectivityList(k,1),1)+1i*ImagePointSet(ConnectivityList(k,1),2))))/( conj(((PointSet(ConnectivityList(k,3),1)+1i*PointSet(ConnectivityList(k,3),2))-(PointSet(ConnectivityList(k,1),1)+1i*PointSet(ConnectivityList(k,1),2)))/((PointSet(ConnectivityList(k,2),1)+1i*PointSet(ConnectivityList(k,2),2))-(PointSet(ConnectivityList(k,1),1)+1i*PointSet(ConnectivityList(k,1),2)))) -((ImagePointSet(ConnectivityList(k,3),1)+1i*ImagePointSet(ConnectivityList(k,3),2))-(ImagePointSet(ConnectivityList(k,1),1)+1i*ImagePointSet(ConnectivityList(k,1),2)))/((ImagePointSet(ConnectivityList(k,2),1)+1i*ImagePointSet(ConnectivityList(k,2),2))-(ImagePointSet(ConnectivityList(k,1),1)+1i*ImagePointSet(ConnectivityList(k,1),2))) ));    
end
DilatationConstantk=max(DilatationStorage);
%DilatationConstantkForPresentation = double(DilatationConstantk);

%If I am sending x_1,x_2,x_3 to y_1,y_2,y_3 the dilatation is:
%((x_3-x_1)/(x_2-x_1)-(y_3-y_1)/(y_2-y_1))/(conj((x_3-x_1)/(x_2-x_1))-(y_3-y_1)/(y_2-y_1))

answerone=DilatationConstantk;
answertwo=DilatationStorage;