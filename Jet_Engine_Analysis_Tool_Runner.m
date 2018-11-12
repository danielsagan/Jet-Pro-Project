% f = @(x,y) x.*exp(-x.^2-y.^2)+(x.^2+y.^2)/20;
% g = @(x,y) x.*y/2+(x+2).^2+(y-2).^2/2-2;
% 
% 
% fimplicit(g)
% axis([-6 0 -1 7])
% hold on
% fcontour(f)
% plot(-.9727,.4685,'ro');
% legend('constraint','f contours','minimum');
% hold off
% x0 = [-2 1];
% options = optimoptions('fmincon','Algorithm','interior-point','Display','iter');
% gfun = @(x) deal(g(x(1),x(2)),[]);
% [x,fval,exitflag,output] = fmincon(fun,x0,[],[],[],[],[],[],gfun,options);
% 
% %minimize
% x0 = [20,1.6,1,0.02,0.02,0.1];
% %constraints
% %t_o4
% %Specific Thrust
% %b
% options = optimoptions('fmincon','Algorithm','interior-point','Display','iter');
% gfun = @(x) deal(g(x(1),x(2)),[]);
% [x,fval,exitflag,output] = fmincon(fun,x0,[],[],[],[],[],[],gfun,options);

inputs = [19,1.3,2,0.02,0.02,0.1];

TSFCFun(inputs)
x0 = [19, 1.3, 2, 0.02, 0.02, 0.1]
lb = [0 1.1 1 0 0 0]
ub = [55 1.7 8 1 1 0.1]
options = optimoptions('fmincon','Algorithm','interior-point','Display','iter');

x = fmincon(@TSFCFun,x0,[],[],[],[],lb,ub,@mycon)

function TSFC = TSFCFun(x)
TSFC = Jet_Engine_Analysis_Tool(x(1), x(2), x(3), x(4), x(5), x(6));
end

function [c,ceq] = mycon(x)
c = [x(1)*x(2)-55,T_o4];
ceq = [];
end