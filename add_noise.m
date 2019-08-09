function z=add_noise(y,P)
mu=0;
v= P*var(y)/100;
sigma= (v)^.5;
z=zeros(1,2000);
noise=sigma*randn(1,3000)+mu;
for n=1:3000
    z(1,n)=y(1,n)+noise(1,n);
end;

