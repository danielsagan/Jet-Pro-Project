results1 = [0,0,0];
results2 = [0,0,0];
results3 = [0,0,0];
results4 = [0,0,0];

cases = [32.3259,1.7,8,0.0225,0,0.02,0,273,100;...
    50,1.1,1.7774,0.0191,0,0,0.87,225,25;...
    24.2763,1.7,0.1205,0.0088,0,0,0.9,240,40;...
    8.3073,1.7,0.3689, 0.0302,0,0.1,2.3,215,12];
%% Pic
results1 = [0,0,0];
results2 = [0,0,0];
results3 = [0,0,0];
results4 = [0,0,0];

for pi_c = [1:0.1:55]
    [a,b] =Jet_Engine_grapher(pi_c,cases(1,2),cases(1,3),cases(1,4),cases(1,5),cases(1,6),cases(1,7),cases(1,8),cases(1,9));
    results1 = [results1; pi_c, a,b];
    [a,b] = Jet_Engine_grapher(pi_c,cases(2,2),cases(2,3),cases(2,4),cases(2,5),cases(2,6),cases(2,7),cases(2,8),cases(2,9));
    results2 = [results2; pi_c, a,b];
    [a,b] = Jet_Engine_grapher(pi_c,cases(3,2),cases(3,3),cases(3,4),cases(3,5),cases(3,6),cases(3,7),cases(3,8),cases(3,9));
    results3 = [results3; pi_c, a,b];
    [a,b] = Jet_Engine_grapher(pi_c,cases(4,2),cases(4,3),cases(4,4),cases(4,5),cases(4,6),cases(4,7),cases(4,8),cases(4,9));
    results4 = [results4; pi_c, a,b];
end

figure
yyaxis left;
plot(results1(:,1),results1(:,2),results2(:,1),results2(:,2),results3(:,1),results3(:,2),results4(:,1),results4(:,2));
ylabel('TSFC (kg/Ns)');
yyaxis right;
plot(results1(:,1),results1(:,3),results2(:,1),results2(:,3),results3(:,1),results3(:,3),results4(:,1),results4(:,3));
ylabel('Specific Thrust (N)');
legend('Mission 1','Mission 2','Mission 3', 'Mission 4');
title('Varying Compressor Compression Ratio');
xlabel('\pi_c');

%% Pi_f
results1 = [0,0,0];
results2 = [0,0,0];
results3 = [0,0,0];
results4 = [0,0,0];

for pi_f = [1:0.01:1.7]
    [a,b] =Jet_Engine_grapher(cases(1,1),pi_f,cases(1,3),cases(1,4),cases(1,5),cases(1,6),cases(1,7),cases(1,8),cases(1,9));
    results1 = [results1; pi_f, a,b];
    [a,b] = Jet_Engine_grapher(cases(2,1),pi_f,cases(2,3),cases(2,4),cases(2,5),cases(2,6),cases(2,7),cases(2,8),cases(2,9));
    results2 = [results2; pi_f, a,b];
    [a,b] = Jet_Engine_grapher(cases(3,1),pi_f,cases(3,3),cases(3,4),cases(3,5),cases(3,6),cases(3,7),cases(3,8),cases(3,9));
    results3 = [results3; pi_f, a,b];
    [a,b] = Jet_Engine_grapher(cases(4,1),pi_f,cases(4,3),cases(4,4),cases(4,5),cases(4,6),cases(4,7),cases(4,8),cases(4,9));
    results4 = [results4; pi_f, a,b];
end

figure
yyaxis left;
plot(results1(:,1),results1(:,2),results2(:,1),results2(:,2),results3(:,1),results3(:,2),results4(:,1),results4(:,2));
ylabel('TSFC (kg/Ns)');
yyaxis right;
plot(results1(:,1),results1(:,3),results2(:,1),results2(:,3),results3(:,1),results3(:,3),results4(:,1),results4(:,3));
ylabel('Specific Thrust (N)');
legend('Mission 1','Mission 2','Mission 3', 'Mission 4');
title('Varying Fan Compression Ratio');
xlabel('\pi_f');
xlim([1,1.7]);

results1 = [0,0,0];
results2 = [0,0,0];
results3 = [0,0,0];
results4 = [0,0,0];

for beta = [0:0.1:8]
    [a,b] =Jet_Engine_grapher(cases(1,1),cases(1,2),beta,cases(1,4),cases(1,5),cases(1,6),cases(1,7),cases(1,8),cases(1,9));
    results1 = [results1; beta, a,b];
    [a,b] = Jet_Engine_grapher(cases(2,1),cases(2,2),beta,cases(2,4),cases(2,5),cases(2,6),cases(2,7),cases(2,8),cases(2,9));
    results2 = [results2; beta, a,b];
    [a,b] = Jet_Engine_grapher(cases(3,1),cases(3,2),beta,cases(3,4),cases(3,5),cases(3,6),cases(3,7),cases(3,8),cases(3,9));
    results3 = [results3; beta, a,b];
    [a,b] = Jet_Engine_grapher(cases(4,1),cases(4,2),beta,cases(4,4),cases(4,5),cases(4,6),cases(4,7),cases(4,8),cases(4,9));
    results4 = [results4; beta, a,b];
end

mask = results1 > 0;
results1 = results1.*mask;
mask = results2 > 0;
results2 = results2.*mask;
mask = results3 > 0;
results3 = results3.*mask;
mask = results4 > 0;
results4 = results4.*mask;


figure
yyaxis left;
plot(results1(:,1),results1(:,2),results2(:,1),results2(:,2),results3(:,1),results3(:,2),results4(:,1),results4(:,2));
ylabel('TSFC (kg/Ns)');
yyaxis right;
plot(results1(:,1),results1(:,3),results2(:,1),results2(:,3),results3(:,1),results3(:,3),results4(:,1),results4(:,3));
ylabel('Specific Thrust (N)');
legend('Mission 1','Mission 2','Mission 3', 'Mission 4');
title('Varying Bypass Ratio');
xlabel('\beta');

results1 = [0,0,0];
results2 = [0,0,0];
results3 = [0,0,0];
results4 = [0,0,0];

for f = [0:0.001:1]
    [a,b] =Jet_Engine_grapher(cases(1,1),cases(1,2),cases(1,3),f,cases(1,5),cases(1,6),cases(1,7),cases(1,8),cases(1,9));
    results1 = [results1; f, a,b];
    [a,b] = Jet_Engine_grapher(cases(2,1),cases(2,2),cases(2,3),f,cases(2,5),cases(2,6),cases(2,7),cases(2,8),cases(2,9));
    results2 = [results2; f, a,b];
    [a,b] = Jet_Engine_grapher(cases(3,1),cases(3,2),cases(3,3),f,cases(3,5),cases(3,6),cases(3,7),cases(3,8),cases(3,9));
    results3 = [results3; f, a,b];
    [a,b] = Jet_Engine_grapher(cases(4,1),cases(4,2),cases(4,3),f,cases(4,5),cases(4,6),cases(4,7),cases(4,8),cases(4,9));
    results4 = [results4; f, a,b];
end

mask = results1 > 0;
results1 = results1.*mask;
mask = results2 > 0;
results2 = results2.*mask;
mask = results3 > 0;
results3 = results3.*mask;
mask = results4 > 0;
results4 = results4.*mask;

figure
yyaxis left;
plot(results1(:,1),results1(:,2),results2(:,1),results2(:,2),results3(:,1),results3(:,2),results4(:,1),results4(:,2));
ylabel('TSFC (kg/Ns)');
yyaxis right;
plot(results1(:,1),results1(:,3),results2(:,1),results2(:,3),results3(:,1),results3(:,3),results4(:,1),results4(:,3));
ylabel('Specific Thrust (N)');
legend('Mission 1','Mission 2','Mission 3', 'Mission 4');
title('Varying Fuel-Air Ratio');
xlabel('f');

results1 = [0,0,0];
results2 = [0,0,0];
results3 = [0,0,0];
results4 = [0,0,0];

for f_ab = [0:0.01:1]
    [a,b] =Jet_Engine_grapher(cases(1,1),cases(1,2),cases(1,3),cases(1,4),f_ab,cases(1,6),cases(1,7),cases(1,8),cases(1,9));
    results1 = [results1; f_ab, a,b];
    [a,b] = Jet_Engine_grapher(cases(2,1),cases(2,2),cases(2,3),cases(2,4),f_ab,cases(2,6),cases(2,7),cases(2,8),cases(2,9));
    results2 = [results2; f_ab, a,b];
    [a,b] = Jet_Engine_grapher(cases(3,1),cases(3,2),cases(3,3),cases(3,4),f_ab,cases(3,6),cases(3,7),cases(3,8),cases(3,9));
    results3 = [results3; f_ab, a,b];
    [a,b] = Jet_Engine_grapher(cases(4,1),cases(4,2),cases(4,3),cases(4,4),f_ab,cases(4,6),cases(4,7),cases(4,8),cases(4,9));
    results4 = [results4; f_ab, a,b];
end

figure
yyaxis left;
plot(results1(:,1),results1(:,2),results2(:,1),results2(:,2),results3(:,1),results3(:,2),results4(:,1),results4(:,2));
ylabel('TSFC (kg/Ns)');
yyaxis right;
plot(results1(:,1),results1(:,3),results2(:,1),results2(:,3),results3(:,1),results3(:,3),results4(:,1),results4(:,3));
ylabel('Specific Thrust (N)');
legend('Mission 1','Mission 2','Mission 3', 'Mission 4');
title('Varying Fuel-Air Ratio in Afterburner');
xlabel('f_{ab}');

results1 = [0,0,0];
results2 = [0,0,0];
results3 = [0,0,0];
results4 = [0,0,0];

for b = [0:0.01:1]
    [a,c] =Jet_Engine_grapher(cases(1,1),cases(1,2),cases(1,3),cases(1,4),cases(1,5),b,cases(1,7),cases(1,8),cases(1,9));
    results1 = [results1; b, a,c];
    [a,c] = Jet_Engine_grapher(cases(2,1),cases(2,2),cases(2,3),cases(2,4),cases(2,5),b,cases(2,7),cases(2,8),cases(2,9));
    results2 = [results2; b, a,c];
    [a,c] = Jet_Engine_grapher(cases(3,1),cases(3,2),cases(3,3),cases(3,4),cases(3,5),b,cases(3,7),cases(3,8),cases(3,9));
    results3 = [results3; b, a,c];
    [a,c] = Jet_Engine_grapher(cases(4,1),cases(4,2),cases(4,3),cases(4,4),cases(4,5),b,cases(4,7),cases(4,8),cases(4,9));
    results4 = [results4; b, a,c];
end

mask = results1 > 0;
results1 = results1.*mask;
mask = results2 > 0;
results2 = results2.*mask;
mask = results3 > 0;
results3 = results3.*mask;
mask = results4 > 0;
results4 = results4.*mask;

figure
yyaxis left;
plot(results1(:,1),results1(:,2),results2(:,1),results2(:,2),results3(:,1),results3(:,2),results4(:,1),results4(:,2));
ylabel('TSFC (kg/Ns)');
yyaxis right;
plot(results1(:,1),results1(:,3),results2(:,1),results2(:,3),results3(:,1),results3(:,3),results4(:,1),results4(:,3));
ylabel('Specific Thrust (N)');
legend('Mission 1','Mission 2','Mission 3', 'Mission 4');
title('Varying Bleed Air Ratio');
xlabel('b');
