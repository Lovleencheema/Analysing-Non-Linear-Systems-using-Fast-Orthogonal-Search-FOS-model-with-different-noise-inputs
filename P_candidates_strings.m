function s=P_candidates_strings(K,L,Order)
j=factorial(K+L+1+Order)/(factorial(K+L+1)*factorial(Order));
s=32*ones(j,7*Order);

r=1;
s(1,1)=49;
for i=1:Order
    s(r+1:r+number_of_candidates_in_nthorder(K+L+1,i),1:(i*7))=P_candidates_stringsin_nthorder(K,L,i);
    r=r+number_of_candidates_in_nthorder(K+L+1,i);
end;