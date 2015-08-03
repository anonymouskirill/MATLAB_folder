function answer=objective_function(x,y,number_of_triangles)

answer=0;
for k=1:1:number_of_triangles
answer=answer+abs(((x(3,k)-x(1,k))/(x(2,k)-x(1,k))-(y(3,k)-y(1,k))/(y(2,k)-y(1,k)))/...
    (conj((x(3,k)-x(1,k))/(x(2,k)-x(1,k)))-(y(3,k)-y(1,k))/(y(2,k)-y(1,k))))^2;
end

end
