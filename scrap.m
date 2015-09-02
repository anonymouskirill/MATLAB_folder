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



%distorted:
figure
y=[-pi/2:(pi/2+pi/2)/10:pi/2];
y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
x=zeros(1,length(y));
x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
plot(x,y,'b')
%plot([0 0],[-pi/2,pi/2], 'b')
hold on



%plot([0 20],[pi/2,pi/2], 'b')

x=[-20:1/10:20];
x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
y=zeros(1,length(x));
y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
plot(x,y,'b')

x=[-20:1/10:20];
x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
y=zeros(1,length(x));
y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+pi/2*ones(1,length(y));
plot(x,y,'b')

x=[-20:1/10:20];
x=x+(1/10)*(2*rand(1,length(x))-ones(1,length(x)));
y=zeros(1,length(x));
y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))-pi/2*ones(1,length(y));
plot(x,y,'b')



for j=-4:1:4            
x=[0:1/20:2*pi];    
plot(j*pi*ones(1,length(x))+1/10*(2*rand(1,length(x))-ones(1,length(x)))+real(exp(i*x)),...
    pi*ones(1,length(x))+imag(exp(i*x)),'b')

plot(j*pi*ones(1,length(x))+1/10*(2*rand(1,length(x))-ones(1,length(x)))+real(exp(i*x)),...
    -pi*ones(1,length(x))+imag(exp(i*x)),'b')


%plot([j*pi,j*pi],[pi/2,pi-1],'b')   

y=[pi/2:((pi-1)-pi/2)/2:pi-1];
y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
x=zeros(1,length(y));
x=x+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
plot(x,y,'b')

y=[-(pi-1):((pi-1)-pi/2)/2:-pi/2];
y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
x=zeros(1,length(y));
x=x+(1/10)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
plot(x,y,'b')


y=[pi+1:(10-(pi+1))/30:10];
y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
x=zeros(1,length(y));
x=x+(1/5)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
plot(x,y,'b')


y=[-10:(10-(pi+1))/30:-(pi+1)];
y=y+(1/10)*(2*rand(1,length(y))-ones(1,length(y)));
x=zeros(1,length(y));
x=x+(1/5)*(2*rand(1,length(y))-ones(1,length(y)))+j*pi*ones(1,length(y));
plot(x,y,'b')

axis((7/6)*[-6 6 -6 6])
end

hold off


