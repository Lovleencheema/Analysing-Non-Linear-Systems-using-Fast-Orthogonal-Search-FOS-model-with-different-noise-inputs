function y = Noise_less_system_2(x)
y = zeros (1,3000);
for i = 5:3000
y(i) = 0.098 + 0.413*x(i-2) + 0.597*y(i-1) - 0.78*x(i-3)*x(i-1) + 1.12*x(i-1)*y(i-2) - 0.7*y(i-1)*y(i-2); 
    
end

