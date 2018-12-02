clear
clc

global constraints;
lb = [1 1.1 0 0 0 0];
ub = [55 1.7 8 1 1 0.1];

bestST = 0;

for i = 1:100
    
    x0 = [rand*(ub(1) - lb(1)) + lb(1), rand*(ub(2) - lb(2)) + lb(2), rand*(ub(3) - lb(3)) + lb(3), rand*(ub(4) - lb(4)) + lb(4), rand*(ub(5) - lb(5)) + lb(5), rand*(ub(6) - lb(6)) + lb(6)];
    
    options = optimoptions('fmincon', 'Algorithm', 'sqp', 'OptimalityTolerance',1e-8, 'MaxFunctionEvaluations',10000);
    [x, fval, exitflag] = fmincon(@STFun, x0, [],[],[],[],lb, ub, @mycon, options);
    ST=fval;
    if ((ST < bestST) && (ST < 0) && ((exitflag == 1) || (exitflag == 0)))
        bestST = -ST;
        bestx = x;
        bestx_x0 = x0;
    end
    
end

function ST = STFun(x)
ST = -Jet_Engine_Analysis_Tool3(50,1.1,1.7774, x(4), 0, 0);
end

function [c,ceq] = mycon(x)
global constraints
c = [constraints(1), constraints(2), constraints(3), constraints(4)];
ceq = [];
end