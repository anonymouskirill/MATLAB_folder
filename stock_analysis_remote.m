%stock_data=100*ones(100,1)+20*(2*rand(100,1)-ones(100,1));
stock_data=dlmread('~/stock_data_in_text.txt')

%Ok so now I want to simulate the execution of a trading strategy where the
%above matrix entries are stock prices at regular time intervals. 

%So I can buy however many stocks I want (say 100):
initial_capital=1e4;

%Here is where I record what I buy, and how much, column 1 - how many units
%I buy, column 2 - the price at that particular time, column 3 - time period at
%which I buy, column 4 - total capital at this time.
buying_data=zeros(size(stock_data,1),4);
for j=1:1:size(stock_data,1)
   
   if stock_data(j)<sum(stock_data(1:j,1))/j
    buying_data(j,1)=1;
   end
   
   buying_data(j,2)=stock_data(j);
   buying_data(j,3)=j;
   
   buying_data(j,4)=(initial_capital-sum(buying_data(1:j,2).*buying_data(1:j,1)))+...
    sum(buying_data(1:j,1).*stock_data(j,1));
end

%buying_data(1,1)=4;

%I want to measure my final capital which will measure the success of this
%trading strategy. 
final_capital=(initial_capital-sum(buying_data(:,2).*buying_data(:,1)))+...
    sum(buying_data(:,1).*stock_data(size(stock_data,1),1));

%disp(round(final_capital,0))

figure_name=figure
plot(buying_data(:,3), buying_data(:,2), 'r')
hold on 
hold off
saveas(figure_name,'~/www/stock_data.png')





