classdef FOS
        properties ( SetAccess = public )
            Selected_candidates = 0;
            z=0;
            K=0;
            L=0;
            N=0;
            a=0;
            Order=0;
            mse_absolute_1st_set = 0;
            mse_relative_1st_set = 0;
            mse_absolute_2nd_set = 0;
            mse_relative_2nd_set = 0;
            mse_absolute_3rd_set = 0;
            mse_relative_3rd_set = 0;
    end
    
    methods
        function obj = FOS(x,y,Noise_percentage,K,L,Order)
            
 [obj.z,obj.Order,obj.Selected_candidates,obj.K,obj.L,obj.N,obj.a,obj.mse_absolute_1st_set,obj.mse_relative_1st_set,obj.mse_absolute_2nd_set,obj.mse_relative_2nd_set,obj.mse_absolute_3rd_set,obj.mse_relative_3rd_set]= fast_orthogonal_search(x,y,Noise_percentage,K,L,Order);
    end
    end
end

