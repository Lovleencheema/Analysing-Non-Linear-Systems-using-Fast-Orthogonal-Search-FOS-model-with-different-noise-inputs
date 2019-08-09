function [z,Order,Selected_candidates,K,L,N,a,mse_absolute_1st_set,mse_relative_1st_set,mse_absolute_2nd_set,mse_relative_2nd_set,mse_absolute_3rd_set,mse_relative_3rd_set]=fast_orthogonal_search(x,y,Noise_percentage,K,L,Order)
z=add_noise(y,Noise_percentage);
N= max ([K;L]);
M=factorial(K+L+1+Order)/(factorial(K+L+1)*factorial(Order));
Candidates= transpose(1:M);
E(1) =1;
G(1)= sum(z(N+1:1000))/(1000-N);
Selected_candidates(1) = Candidates(1,1);
A=0;
M_S_E = sum(z(N+1:1000).^2)/(1000-N)-G(1)^2*E(1);
for m=2:M
    A_lpha = 0;
    position=size(Selected_candidates,2)+1;
    for mm=2:M
        if Candidates(mm,1)>-1
            P_m=getcandidate3(x,z,mm,N,1000,K,L,Order);
            d(mm,1) = sum(P_m)/(1000-N);
            for r = 1: position-1
                A_lpha(mm,r) = d(mm,r)/E(1,r);
                if (r+1 < position)
                    P_rplus1 = getcandidate3(x,z,Selected_candidates(r+1),N,1000,K,L,Order);
                    d(mm,r+1) = sum(P_m.*P_rplus1)/(1000-N)-d(mm,1:r)*A(r+1,1:r)';
                else
                    d(mm,position) = sum(P_m.*P_m)/(1000-N)-A_lpha(mm,1:position-1).^2* (E(1,1:position-1)');
                    c=sum(P_m.*z(N+1:1000))/(1000-N)-A_lpha(mm,1:position-1)*(E(1,1:position-1).*G(1,1:position-1))';
                    g(mm)=c/d(mm,position);
                end
            end
        end
    end
    Q = g.^2.*d(:,position)';
    [Q_M,sorted]=sort(Q,'descend');
    next_candidate=sorted(1,1);
    if(Q_M(1,1) > (4/(1000-N))*M_S_E)
        G(1,position) = g(next_candidate);
        E(1,position)=d(next_candidate,position);
        Selected_candidates(position)=next_candidate;
        A(position,1:position-1) = A_lpha(next_candidate,1:position-1);
        M_S_E = M_S_E-Q_M(1,1);
    end
    Candidates(next_candidate,:)=-1;
end
a=a_cof(G,A);
v1=Modloutput(a,Selected_candidates,x(1,1:1000),K,L,N,Order);
mse_absolute_1st_set=(sum((v1(N+1:1000)-z(N+1:1000)).^2))/(1000-N);
mse_relative_1st_set=(100*sum((v1(N+1:1000)-z(N+1:1000)).^2))/((1000-N)*var(z(N+1:1000)));
v2=Modloutput(a,Selected_candidates,x(1,1001:2000),K,L,N,Order);
mse_absolute_2nd_set=(sum((v2(N+1:1000)-z(N+1001:2000)).^2))/(1000-N);
mse_relative_2nd_set=(100*sum((v2(N+1:1000)-z(N+1001:2000)).^2))/((1000-N)*var(z(N+1001:2000)));
v3=Modloutput(a,Selected_candidates,x(1,2001:3000),K,L,N,Order);
mse_absolute_3rd_set=(sum((v3(N+1:1000)-z(N+2001:3000)).^2))/(1000-N);
mse_relative_3rd_set=(100*sum((v3(N+1:1000)-z(N+2001:3000)).^2))/((1000-N)*var(z(N+2001:3000)));


