%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Jet Pro Engine Analysis Tool
%Daniel Sagan, Eddie Li, and Kyle Neville
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [TSFC] = Jet_Engine_Analysis_Tool(pi_c, pi_f, beta, f, f_ab, b)
%Flight Conditions      %Units
M_a = 2.3;
gamma_a = 1.4;          %gamma atmosphere
R = 8314.46/28.8;
T_a = 215;              %K
P_a = 12;               %kPa
T_oa = T_a*(1+(gamma_a-1)/2*M_a^2);                         %total pressure
P_oa = P_a*(1+(gamma_a-1)/2*M_a^2)^(gamma_a/(gamma_a-1));


% a-->2 (Through the diffuser)
eta_d = 0.92;
if M_a <= 1
    pi_ds = 1;
elseif M_a > 1 && M_a < 5
    pi_ds = 1 - 0.075*(M_a-1)^1.35;
else
    print("The code is invalid for this Mach Number");
    quit
end

T_o2 = T_oa;
P_o2 = P_a*(1+eta_d*(gamma_a-1)/2*M_a^2)^(gamma_a/(gamma_a-1))*pi_ds;

%2-->3f (Through the fan)
%beta = 2;
gamma_f = gamma_a;
C_beta = 200;
c_pf = 8314.46/28.8*gamma_f/(gamma_f-1);
e_f = 0.95;
%pi_f = 1.3;
eta_f = (pi_f^((gamma_f-1)/gamma_f)-1)/((pi_f^((gamma_f-1)/gamma_f/e_f)-1));

P_o3f = P_o2*pi_f;
T_o3f = T_o2*(1+1/eta_f*(pi_f^((gamma_f-1)/gamma_f)-1));

w_f = -c_pf*(T_o3f-T_o2)*(1+beta);

Drag_f = C_beta*M_a^2*(P_a/101.325)*beta^1.5;

%% 3f-->3 (Through the compressor)
gamma_c = gamma_f;
c_pc = 8314.46/28.8*gamma_c/(gamma_c-1);
e_c = 0.95;
%pi_c = 20;
eta_c = (pi_c^((gamma_c-1)/gamma_c)-1)/((pi_c^((gamma_c-1)/gamma_c/e_c)-1));

P_o3 = P_o3f*pi_c;
T_o3 = T_o3f*(1+1/eta_c*(pi_c^((gamma_c-1)/gamma_c)-1));

w_c = -c_pc*T_o3f/eta_c*(pi_c^((gamma_c-1)/gamma_c)-1);

%% 3-->4 (Through the combustor)
gamma_b = 1.33;
c_pb = 8314.46/28.8*gamma_b/(gamma_b-1);
pi_b = 0.97;
eta_b = 0.98;
Q_r = 43e+6;
To_o4_max = 1500;
b_max = 0.1;
C_b = 500;

T_o4 = (Q_r*f*eta_b+T_o3*(1-b)*c_pc)/(c_pb*(1+f-b));
P_o4 = P_o3*pi_b;
T_o4_max = To_o4_max + C_b*(b/b_max)^0.5

%% 4-->51 (Through the HP Turbine)
gamma_HPT = gamma_b;
e_HPT = 0.97;
eta_mHPT = 0.95;
c_pHPT = 8314.46/28.8*gamma_HPT/(gamma_HPT-1);

T_o51 = T_o4-c_pc/c_pHPT*1/(1+f-b)*1/eta_mHPT*(T_o3-T_o3f);
eta_HPT = (1-T_o51/T_o4)/(1-(T_o51/T_o4)^(1/e_HPT));
P_o51 = P_o4*(1+1/eta_HPT*(T_o51/T_o4-1))^(gamma_HPT/(gamma_HPT-1));

%% 51+3'--> 5m (Through the bleed air mixer)
T_o5m = ((1-b+f)*T_o51+b*T_o3)/(1+f);
P_o5m = P_o51*(T_o5m/T_o51)^(gamma_HPT/(gamma_HPT-1))*(T_o51/T_o3)^(gamma_HPT/(gamma_HPT-1)*b/(1+f));

%% 5m--> 52 (Through the LPT)
gamma_LPT = gamma_HPT;
e_LPT = 0.97;
eta_mLPT = 0.95;
c_pLPT = 8314.46/28.8*gamma_LPT/(gamma_LPT-1);

T_o52 = T_o5m-c_pf/c_pLPT*(1+beta)/(1+f)*1/eta_mLPT*(T_o3f-T_o2);
eta_LPT = (1-T_o52/T_o5m)/(1-(T_o52/T_o5m)^(1/e_LPT));
P_o52 = P_o5m*(1+1/eta_LPT*(T_o52/T_o5m-1))^(gamma_LPT/(gamma_LPT-1));

%% 52 --> 6 (Through the afterburner)
gamma_ab = gamma_LPT;
c_pab = 8314.46/28.8*gamma_ab/(gamma_ab-1);
pi_ab = 0.97;
eta_ab = 0.98;
Q_r = 43e+6;
%f_ab = 0.0;
T_o6_max = 2200;

T_o6 = Q_r*f_ab*eta_ab/c_pab/(1+f+f_ab)+T_o52*(1+f)*c_pLPT/c_pab/(1+f+f_ab);
P_o6 = P_o52*pi_ab;

%% 6+3f --> 7 (Through the mixer)
gamma_m = (gamma_LPT+beta*gamma_f)/(1+beta);
c_pm = 8314.46/28.8*gamma_m/(gamma_m-1);
pi_em = 0.85;

T_o7 = (T_o6+beta*T_o3f)/(1+beta);
P_o7 = pi_em*T_o7^(gamma_m/(gamma_m-1))/(T_o6^(gamma_m/(gamma_m-1)/(1+beta))*T_o3f^(gamma_m/(gamma_m-1)*beta/(1+beta)))*P_o6^(1/(1+beta))*P_o3f^(beta/(1+beta));

%% 7 --> eM (Through the Mixed Nozzle)
gamma_n = gamma_m;
eta_nM = 0.96;
c_pnM = 8314.46/28.8*gamma_n/(gamma_n-1);

T_eM = T_o7*(1-eta_nM*(1-(P_a/P_o7)^((gamma_n-1)/gamma_n)));

u_eM = sqrt(2*eta_nM*c_pnM*T_o7*(1-(P_a/P_o7)^((gamma_n-1)/gamma_n)));

%% 6 --> eH
gamma_nH = gamma_ab;
eta_nH = 0.95;
c_pnH = c_pab;

T_eH = T_o6*(1-eta_nH*(1-(P_a/P_o6)^((gamma_nH-1)/gamma_nH)));

u_eH = sqrt(2*eta_nH*c_pnH*T_o6*(1-(P_a/P_o6)^((gamma_nH-1)/gamma_nH)));

specificThrustH = ((1+f+f_ab)*u_eH-(1)*M_a*sqrt(gamma_a*T_a*8314.46/28.8));
%% 3f --> eC
gamma_nC = gamma_f;
eta_nC = 0.97;
c_pnC = c_pf;

T_eC = T_o3f*(1-eta_nC*(1-(P_a/P_o3f)^((gamma_nC-1)/gamma_nC)));

u_eC = sqrt(2*eta_nC*c_pf*T_o3f*(1-(P_a/P_o3f)^((gamma_nC-1)/gamma_nC)));

specificThrustC = ((beta)*u_eC-(beta)*M_a*sqrt(gamma_a*T_a*8314.46/28.8));
%% Specific Thrust (Mixed)

specificThrustM = ((1+beta+f+f_ab)*u_eM-(1+beta)*M_a*sqrt(gamma_a*T_a*8314.46/28.8))-Drag_f;

TSFCM = (f+f_ab)/specificThrustM;

%% Specific Thrust (Hot and Cold)

specificThrustHC = specificThrustH+specificThrustC-Drag_f;
TSFCHC = (f+f_ab)/specificThrustHC;

%% Outputs
specificThrust = specificThrustM
TSFC = TSFCM*35304;

%% Constraint Evaluation
global constraints; %Constraints
constraints = [pi_c*pi_f-55, T_o4-T_o4_max, T_o6-2200, -specificThrust*100, (750-specificThrust)];
end

