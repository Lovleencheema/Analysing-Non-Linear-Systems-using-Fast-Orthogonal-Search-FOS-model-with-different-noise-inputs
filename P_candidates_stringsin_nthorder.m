function s= P_candidates_stringsin_nthorder(k,l,Order)
N=k+l+1;
M=number_of_candidates_in_nthorder(N,Order);
s=32*ones(M,2*Order);
r=1;
orderminus1=Order-1;

if Order==1
    s=P_candidates_strings_xandyterms(k,l);
else
    a=P_candidates_strings_xandyterms(k,l);
    b=P_candidates_stringsin_nthorder(k,l,orderminus1);
    for i=1:N
        for o=(1+number_of_candidates_in_nthorder(N,orderminus1)-number_of_candidates_in_nthorder(N+1-i,orderminus1)):number_of_candidates_in_nthorder(N,orderminus1)
            s(r,1:7)=a(i,1:7);
            s(r,8:7+size(b,2))=b(o,:);
            r=r+1;
        end;
    end;
end

