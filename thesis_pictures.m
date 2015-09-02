% figure
% plot([0 0],[-pi/2,pi/2], 'b')
% hold on
% axis((7/6)*[-6 6 -6 6])
% 
% plot([0 20],[pi/2,pi/2], 'b')
% plot([0 20],[-pi/2,-pi/2], 'b')
% plot([0 -20],[pi/2,pi/2],'b')
% plot([0 -20],[-pi/2,-pi/2],'b')
% 
% x=[0:1/50:2*pi];
% for j=-4:1:4            
% plot(j*pi*ones(1,length(x))+real(exp(i*x)),pi*ones(1,length(x))+imag(exp(i*x)),'b')
% 
% plot(j*pi*ones(1,length(x))+real(exp(i*x)),-pi*ones(1,length(x))+imag(exp(i*x)),'b')
% 
% plot([j*pi,j*pi],[pi/2,pi-1],'b')   
% 
% plot([j*pi,j*pi],-1*[pi/2,pi-1],'b')   
% 
% plot([j*pi,j*pi],[pi+1,10],'b')   
% 
% plot([j*pi,j*pi],-1*[pi+1,10],'b')   
% 
% end
% 
% 
% 
% 
% hold off
% 
% 



% %distorted:
% figure
% y=[-pi/2:(pi/2+pi/2)/10:pi/2];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% plot(x,y,'b')
% %plot([0 0],[-pi/2,pi/2], 'b')
% hold on
% 
% 
% 
% %plot([0 20],[pi/2,pi/2], 'b')
% 
% 
% 
% x=[-20:1/10:20];
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% y=zeros(1,length(x));
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+pi/2*ones(1,length(y));
% plot(x,y,'b')
% 
% x=[-20:1/10:20];
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% y=zeros(1,length(x));
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))-pi/2*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% 
% for j=-4:1:4            
% x=[0:1/20:2*pi];    
% plot(j*pi*ones(1,length(x))+1/10*(2*rand(1,length(x))-ones(1,length(x)))+real(exp(i*x)),...
%     pi*ones(1,length(x))+imag(exp(i*x)),'b')
% 
% plot(j*pi*ones(1,length(x))+1/10*(2*rand(1,length(x))-ones(1,length(x)))+real(exp(i*x)),...
%     -pi*ones(1,length(x))+imag(exp(i*x)),'b')
% 
% 
% %plot([j*pi,j*pi],[pi/2,pi-1],'b')   
% 
% y=[pi/2:((pi-1)-pi/2)/2:pi-1];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% y=[-(pi-1):((pi-1)-pi/2)/2:-pi/2];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% y=[pi+1:(10-(pi+1))/30:10];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/5)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% y=[-10:(10-(pi+1))/30:-(pi+1)];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/5)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% axis((7/6)*[-6 6 -6 6])
% 
% 
% % x=(2/5)*cos([0:1/10:2*pi]);
% % x=x+pi*ones(1,length(x));
% % y=(2/5)*sin([0:1/10:2*pi]);
% % y=y+pi*ones(1,length(y));
% % fill(x,y,'r')
% 
% end
% 
% hold off



%now with filled in polygons:
% figure
% y=[-pi/2:(pi/2+pi/2)/10:pi/2];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% plot(x,y,'b')
% %plot([0 0],[-pi/2,pi/2], 'b')
% hold on
% 
% 
% 
% %plot([0 20],[pi/2,pi/2], 'b')
% 
% 
% x=[-20:1/10:20];
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% y=zeros(1,length(x));
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+pi/2*ones(1,length(y));
% plot(x,y,'b')
% 
% x=[-20:1/10:20];
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% y=zeros(1,length(x));
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))-pi/2*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% 
% for j=-4:1:4            
% x=[0:1/20:2*pi];    
% plot(j*pi*ones(1,length(x))+1/10*(2*rand(1,length(x))-ones(1,length(x)))+real(exp(i*x)),...
%     pi*ones(1,length(x))+imag(exp(i*x)),'b')
% 
% plot(j*pi*ones(1,length(x))+1/10*(2*rand(1,length(x))-ones(1,length(x)))+real(exp(i*x)),...
%     -pi*ones(1,length(x))+imag(exp(i*x)),'b')
% 
% 
% %plot([j*pi,j*pi],[pi/2,pi-1],'b')   
% 
% y=[pi/2:((pi-1)-pi/2)/2:pi-1];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% y=[-(pi-1):((pi-1)-pi/2)/2:-pi/2];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% y=[pi+1:(10-(pi+1))/30:10];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/5)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% y=[-10:(10-(pi+1))/30:-(pi+1)];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/5)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% axis((7/6)*[-6 6 -6 6])
% 
% 
% x=(2/5)*cos([0:1/10:2*pi]);
% x=x+pi*ones(1,length(x));
% y=(2/5)*sin([0:1/10:2*pi]);
% y=y+pi*ones(1,length(y));
% fill(x,y,'r')
% 
% 
% x=(2/14)*cos([0:1/10:2*pi]);
% x=x+(1/2)*ones(1,length(x));
% y=(2/14)*sin([0:1/10:2*pi]);
% y=y+(1/3)*ones(1,length(y));
% fill(x,y,'r')
% 
% x=(2/11)*cos([0:1/10:2*pi]);
% x=x+(1.5)*ones(1,length(x));
% y=(2/11)*sin([0:1/10:2*pi]);
% y=y+(2/3)*ones(1,length(y));
% fill(x,y,'r')
% 
% x=(2/9)*cos([0:1/10:2*pi]);
% x=x+(3)*ones(1,length(x));
% y=(2/9)*sin([0:1/10:2*pi]);
% y=y+(1)*ones(1,length(y));
% fill(x,y,'r')
% 
% 
% x=(2/5)*cos([0:1/10:2*pi]);
% x=x+2*pi*ones(1,length(x));
% y=(2/5)*sin([0:1/10:2*pi]);
% y=y+pi*ones(1,length(y));
% fill(x,y,'r')
% 
% end
% 
% hold off



%showing an unbounded fatou component:
% figure
% y=[-pi/2:(pi/2+pi/2)/10:pi/2];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% plot(x,y,'b')
% %plot([0 0],[-pi/2,pi/2], 'b')
% hold on
% 
% 
% 
% %plot([0 20],[pi/2,pi/2], 'b')
% 
% 
% x=[-20:1/10:20];
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% y=zeros(1,length(x));
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+pi/2*ones(1,length(y));
% plot(x,y,'b')
% 
% x=[-20:1/10:20];
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% y=zeros(1,length(x));
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))-pi/2*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% 
% for j=-4:1:4            
% x=[0:1/20:2*pi];    
% plot(j*pi*ones(1,length(x))+1/10*(2*rand(1,length(x))-ones(1,length(x)))+real(exp(i*x)),...
%     pi*ones(1,length(x))+imag(exp(i*x)),'b')
% 
% plot(j*pi*ones(1,length(x))+1/10*(2*rand(1,length(x))-ones(1,length(x)))+real(exp(i*x)),...
%     -pi*ones(1,length(x))+imag(exp(i*x)),'b')
% 
% 
% %plot([j*pi,j*pi],[pi/2,pi-1],'b')   
% 
% y=[pi/2:((pi-1)-pi/2)/2:pi-1];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% y=[-(pi-1):((pi-1)-pi/2)/2:-pi/2];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% y=[pi+1:(10-(pi+1))/30:10];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/5)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% y=[-10:(10-(pi+1))/30:-(pi+1)];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/5)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% axis((7/6)*[-6 6 -6 6])
% 
% 
% 
% x=(3)*cos([0:1/2:2*pi]);
% x=x+2*pi/1.25*ones(1,length(x));
% y=(2/5)*sin([0:1/2:2*pi]);
% y=y+(1/2)*ones(1,length(y));
% fill(x,y,'r')
% 
% 
% 
% 
% end
% 
% hold off
% 



%showing a vertically unbounded fatou component:
% figure
% y=[-pi/2:(pi/2+pi/2)/10:pi/2];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% plot(x,y,'b')
% %plot([0 0],[-pi/2,pi/2], 'b')
% hold on
% 
% 
% 
% %plot([0 20],[pi/2,pi/2], 'b')
% 
% 
% x=[-20:1/10:20];
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% y=zeros(1,length(x));
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+pi/2*ones(1,length(y));
% plot(x,y,'b')
% 
% x=[-20:1/10:20];
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% y=zeros(1,length(x));
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))-pi/2*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% 
% for j=-4:1:4            
% x=[0:1/20:2*pi];    
% plot(j*pi*ones(1,length(x))+1/10*(2*rand(1,length(x))-ones(1,length(x)))+real(exp(i*x)),...
%     pi*ones(1,length(x))+imag(exp(i*x)),'b')
% 
% plot(j*pi*ones(1,length(x))+1/10*(2*rand(1,length(x))-ones(1,length(x)))+real(exp(i*x)),...
%     -pi*ones(1,length(x))+imag(exp(i*x)),'b')
% 
% 
% %plot([j*pi,j*pi],[pi/2,pi-1],'b')   
% 
% y=[pi/2:((pi-1)-pi/2)/2:pi-1];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% y=[-(pi-1):((pi-1)-pi/2)/2:-pi/2];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% y=[pi+1:(10-(pi+1))/30:10];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/5)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% y=[-10:(10-(pi+1))/30:-(pi+1)];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/5)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% axis((7/6)*[-6 6 -6 6])
% 
% 
% 
% x=[3.7, 3.7, 3.7, 3, 3.9, 3.9, 3.9, 3.3];
% y=[10, 5, 4, 3, 4, 5, 8, 10];
% 
% fill(x,y,'r')
% 
% 
% 
% 
% end
% 
% hold off



%showing a vertically unbounded fatou component:
% figure
% y=[-pi/2:(pi/2+pi/2)/10:pi/2];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% plot(x,y,'b')
% %plot([0 0],[-pi/2,pi/2], 'b')
% hold on
% 
% 
% 
% %plot([0 20],[pi/2,pi/2], 'b')
% x=[-20:1/10:20];
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% y=zeros(1,length(x));
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+pi/2*ones(1,length(y));
% plot(x,y,'b')
% 
% x=[-20:1/10:20];
% x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
% y=zeros(1,length(x));
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))-pi/2*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% 
% for j=-4:1:4            
% x=[0:1/20:2*pi];    
% plot(j*pi*ones(1,length(x))+1/10*(2*rand(1,length(x))-ones(1,length(x)))+real(exp(i*x)),...
%     pi*ones(1,length(x))+imag(exp(i*x)),'b')
% 
% plot(j*pi*ones(1,length(x))+1/10*(2*rand(1,length(x))-ones(1,length(x)))+real(exp(i*x)),...
%     -pi*ones(1,length(x))+imag(exp(i*x)),'b')
% 
% 
% %plot([j*pi,j*pi],[pi/2,pi-1],'b')   
% 
% y=[pi/2:((pi-1)-pi/2)/2:pi-1];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% y=[-(pi-1):((pi-1)-pi/2)/2:-pi/2];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% y=[pi+1:(10-(pi+1))/30:10];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/5)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% 
% y=[-10:(10-(pi+1))/30:-(pi+1)];
% y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
% x=zeros(1,length(y));
% x=x+(1/5)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
% plot(x,y,'b')
% 
% axis((7/6)*[-6 6 -6 6])
% 
% 
% 
% x=[3.7, 3.7, 3.7, 3, 3.9, 3.9, 3.9, 3.3];
% y=[10, 5, 4, 3, 4, 5, 8, 10];
% 
% fill(x,y,'r')
% 
% 
% 
% 
% end
% 
% hold off
% 







%showing just one vertically unbounded component:
figure
plot([pi, 2*pi],[pi/2,pi/2],'b')
hold on
axis((7/6)*[-6 6 -6 6])

x=[-pi/2:1/50:1*pi/2];
for j=1:1:1            
plot(j*pi*ones(1,length(x))+real(exp(i*x)),pi*ones(1,length(x))+imag(exp(i*x)),'b')

plot([j*pi,j*pi],[pi/2,pi-1],'b')   

plot([j*pi,j*pi],[pi+1,10],'b')   

end


x=[pi/2:1/50:1*3*pi/2];
for j=2:1:2            
plot(j*pi*ones(1,length(x))+real(exp(i*x)),pi*ones(1,length(x))+imag(exp(i*x)),'b')

plot([j*pi,j*pi],[pi/2,pi-1],'b')   

plot([j*pi,j*pi],[pi+1,10],'b')   

end




hold off




