function s = listOrder(K,L,Order)
M=factorial(K+L+1+Order)/(factorial(K+L+1)*factorial(Order));
s=-1*ones(floor(M),2*Order);
r=1;
for i=1:Order
    s(r+1:r+number_of_candidates_in_nthorder(K+L+1,i),1:(i*2))=candidatesof_nthorder(K,L,i);
    r=r+number_of_candidates_in_nthorder(K+L+1,i);
end;

