function y = Noise_less_system_1(x)
y = zeros ( 1,3000);
for i = 5:3000
    y(i) = 0.25 + 0.25*x(i) + 0.15*y(i-1) + 0.05*x(i-1) + 0.4*x(i-1)*x(i-2) +0.05*x(i-3)*y(i-1) - 0.15*y(i-1);
end

