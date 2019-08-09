function modelout(sp,a,k,l,percentage,Order)
disp('-------------------------------------------------------------------------------------------------');
disp(['         ','Equation of the Identified System (when P is ',num2str(percentage),'%)  ']);
disp('-------------------------------------------------------------------------------------------------');
M=size(a,2);
c=P_candidates_strings(k,l,Order);
disp(['y[n]=',num2str(a(1,1))]);
for n=2:M
    disp(['     ','+','(',num2str(a(1,n)),')',char(c(sp(1,n),:))]);
end;
disp('-----------------------------------------------------------------------');


