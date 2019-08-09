function M=number_of_candidates_in_nthorder(N,Order)
M=factorial(N+Order-1)/(factorial(N-1)*factorial(Order));
