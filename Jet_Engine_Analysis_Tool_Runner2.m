clear
clc

global constraints;
x0 = [40.7377,1.1001,0.3043,0.02,0.02,0.02,0.02,0.05]'; %[pi_c,pi_f,beta,f_TO,f_ab_TO,f_C,f_AB_C,b]
lb = [1 1.1 0 0 0 0 0 0];
ub = [55 1.7 8 1 0.1 0.1 0.1 0.1];

bestTSFC = 1000;

for i = 1:10
    
    x0 = [rand*(ub(1) - lb(1)) + lb(1), rand*(ub(2) - lb(2)) + lb(2), rand*(ub(3) - lb(3)) + lb(3), rand*(ub(4) - lb(4)) + lb(4), rand*(ub(5) - lb(5)) + lb(5), rand*(ub(6) - lb(6)) + lb(6), rand*(ub(7) - lb(7)) + lb(7), rand*(ub(8) - lb(8)) + lb(8)];
    
    options = optimoptions('fmincon','Display','iter', 'Algorithm', 'sqp');
    [x, fval, exitflag] = fmincon(@TSFCFun, x0, [],[],[],[],lb, ub, @mycon, options);
    TSFC=fval;
    if ((TSFC < bestTSFC) && (TSFC > 0) && ((exitflag == 1) || (exitflag == 0)))
        bestTSFC = TSFC;
        bestx = x;
        bestx_x0 = x0;
    end
    
end

function TSFC = TSFCFun(x)
alpha = 0.1;
TSFC = alpha*Jet_Engine_Analysis_Tool(x(1), x(2), x(3), x(4), x(5), x(8)) + (1-alpha)*Jet_Engine_Analysis_Tool2(x(1), x(2), x(3), x(6), x(7), x(8));
end

function [c,ceq] = mycon(x)
global constraints
global constraints2
c = [constraints(1), constraints(2), constraints(3), constraints(4),constraints2(1), constraints2(2), constraints2(3), constraints2(4)];
ceq = [constraints(5), constraints2(5)];
end