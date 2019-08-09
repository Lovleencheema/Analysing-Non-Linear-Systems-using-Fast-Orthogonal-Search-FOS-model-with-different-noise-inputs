function y = Noise_less_system_3(x)
y = zeros ( 1,3000);
for i = 5:3000
%     y(i) =0.1 + 0.4*x(i) - 0.3*y(i)  - 0.9*x(i-1)*y(i-2) + 0.76*y(i-1)*y(i-2);
    y(i) =0.1 + 0.3*x(i) - 0.2*y(i)  - 0.85*x(i-1)*y(i-2) + 0.70*y(i-1)*y(i-2);
end

