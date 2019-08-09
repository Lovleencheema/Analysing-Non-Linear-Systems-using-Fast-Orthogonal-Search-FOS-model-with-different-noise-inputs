function v=Modloutput(a,P,x,K,L,N,Order)
M=size(a,2);
s=listOrder(K,L,Order);
v=zeros(1,1000);
for i=N+1:1000
    for j=1:M
        p=1;
        h=1;
        while (h<=Order*2 && s(P(j),h) ~= -1)
            if (s(P(j),h) ==120)
                p=p.*x(i-s(P(j),h+1));
            else
                 p=p.*v(i-s(P(j),h+1));
            end
            h=h+2;
        end
        v(i)=v(i)+a(j)*p;
    end
end

