clear
clc

global constraints;
global constraints2;
%[pi_c,pi_f,beta,f_TO,f_ab_TO, b_TO ,f_C, f_AB_C,b_C]
lb = [1 1.1 0 0 0 0 0 0 0];
ub = [55 1.7 8 1 0.1 0.1 0.1 0.1 0.1];

bestTSFC = 1000;

for i = 1:50
    
    x0 = [rand*(ub(1) - lb(1)) + lb(1), rand*(ub(2) - lb(2)) + lb(2), rand*(ub(3) - lb(3)) + lb(3), rand*(ub(4) - lb(4)) + lb(4), rand*(ub(5) - lb(5)) + lb(5), rand*(ub(6) - lb(6)) + lb(6), rand*(ub(7) - lb(7)) + lb(7), rand*(ub(8) - lb(8)) + lb(8), rand*(ub(9) - lb(9)) + lb(9)];
    
    options = optimoptions('fmincon', 'Algorithm', 'sqp','OptimalityTolerance',1e-8, 'MaxFunctionEvaluations',10000, 'MaxIterations',10000);
    [x, fval, exitflag] = fmincon(@TSFCFun, x0, [],[],[],[],lb, ub, @mycon, options);
    TSFC=fval;
    if ((TSFC < bestTSFC) && (TSFC > 0) && ((exitflag == 1) || (exitflag == 0)))
        bestTSFC = TSFC;
        bestx = x;
        bestx_x0 = x0;
    end
    
end

function TSFC = TSFCFun(x)
alpha = 0.01;
TSFC = alpha*Jet_Engine_Analysis_Tool(x(1), x(2), x(3), x(4), x(5), x(6)) + (1-alpha)*Jet_Engine_Analysis_Tool2(x(1), x(2), x(3), x(7), x(8), x(9));
end

function [c,ceq] = mycon(x)
global constraints
global constraints2
c = [constraints(1), constraints(2), constraints(3), constraints(4),constraints2(1), constraints2(2), constraints2(3), constraints2(4)];
ceq = [constraints(5), constraints2(5)];
end