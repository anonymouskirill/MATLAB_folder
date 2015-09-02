% %This is for polynomial (z^3)/2-(3/2)*z with derivative (z-1)(z+1)
% x=-1:1e-2:1;
% 
% inverse_image_of_polynomial=[0 0];
% for j=x
%     
%     p = [1/2 0 -3/2 -j];
%     r = roots(p);
%     inverse_image_of_polynomial=vertcat(inverse_image_of_polynomial,...
%         [real(r) imag(r)]);
%     
% end
% 
% 
%     p = [1/2 0 -3/2 1];
%     r = roots(p);
%     inverse_image_of_first_critical_value=[real(r) imag(r)];
%     
%     p = [1/2 0 -3/2 -1];
%     r = roots(p);
%     inverse_image_of_second_critical_value=[real(r) imag(r)];    
% 
% 
% figure
% plot(inverse_image_of_polynomial(:,1),inverse_image_of_polynomial(:,2),'r+')
% hold on
% plot(inverse_image_of_first_critical_value(:,1),inverse_image_of_first_critical_value(:,2),'b+')
% plot(inverse_image_of_second_critical_value(:,1),inverse_image_of_second_critical_value(:,2),'g+')
% axis equal
% hold off
% 
%  





%This is for polynomial (z^4/4-z^3/3-z^2/2+z) with derivative 
%(z-1)^2(z+1) and critical values -11/12, 5/12:
% x=-11/12:1e-3:5/12;
% 
% inverse_image_of_polynomial=[0 0];
% for j=x
%     
%     p = [1/4 -1/3 -1/2 1 -j];
%     r = roots(p);
%     inverse_image_of_polynomial=vertcat(inverse_image_of_polynomial,...
%         [real(r) imag(r)]);
%     
% end
% 
%    
%     p = [1/4 -1/3 -1/2 1 11/12];
%     r = roots(p);
%     inverse_image_of_first_critical_value=[real(r) imag(r)];
%     
%     p = [1/4 -1/3 -1/2 1 -5/12];
%     r = roots(p);
%     inverse_image_of_second_critical_value=[real(r) imag(r)];    
% 
% 
% figure
% plot(inverse_image_of_polynomial(:,1),inverse_image_of_polynomial(:,2),'r+')
% hold on
% plot(inverse_image_of_first_critical_value(:,1),inverse_image_of_first_critical_value(:,2),'b+')
% plot(inverse_image_of_second_critical_value(:,1),inverse_image_of_second_critical_value(:,2),'g+')
% axis equal
% hold off
% 
% 
% 


for k=1:1:10
    disp(k)
end



