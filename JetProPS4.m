pratio = @(x) (1+0.96*209.44*(209.44-106.367*(tand(25)-tand(x)))/1010.38/267.26)^(1.4/0.4);
R = @(x) 0.5-0.5*160.367/-209.44*(tand(x)+tan(25));
hold on;
fplot(pratio);
fplot(R);
xlim([-25 25]);
ylim([0,2]);
title('Pressure Ratio across Stage and Degree of Reaction');
xlabel('\alpha_1 (Degrees)');
ylabel('Pressure Ratio Across/Degree of Reaction');
legend('Pressure Ratio','Degree of Reaction')
