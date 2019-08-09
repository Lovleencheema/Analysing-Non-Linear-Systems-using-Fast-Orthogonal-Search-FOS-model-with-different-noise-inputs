function s=candidatesof_nthorder(K,L,Order)
N=K+L+1;
M=number_of_candidates_in_nthorder(N,Order);
s=-1*ones(M,2*Order);
r=1;
orderminus1=Order-1;
if Order==1
    s=x_and_y_terms(K,L);
   else
    a=x_and_y_terms(K,L);
    b=candidatesof_nthorder(K,L,Order-1);
    for i=1:N
        for o=(1+floor(number_of_candidates_in_nthorder(N,orderminus1))- floor(number_of_candidates_in_nthorder(N+1-i,orderminus1))): floor(number_of_candidates_in_nthorder(N,orderminus1))
            s(r,1:2)=a(i,1:2);
            s(r,3:2*Order)=b(o,:);
            r=r+1;
        end;
    end;
end

