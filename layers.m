clear all, close all, clc

%% Calcolo della dimensione x delle celle
Lv_x = 6;           % numero del livello
Lv_0 = 0.5;         % [m] lo imposto da blockMesh facendo lunghezzaX,Y,Z/n°celleX,Y,Z/ 
x = Lv_0/2^Lv_x     % [m] grandezza cella al livello Lv_x

%% Calcolo dello spessore dello strato limite per mercedes stationwagon
y_plus = 80;        % Non dimensional distance perpendicular to the surface (can be 30 - 300)
L = 4.7095;          % [m] length of the car
U = 30;             % [m/s] velocity of the freestream air
rho = 1.225;        % [kg/m^3] density
mu = 1.81e-5;       % [Pa*s] dynamic viscosity
nu = mu/rho;        % [m^2/s] cinematic viscosity = mu/rho Aria standard

Re = rho*U*L/mu;            % reynolds number
Cf = 0.026/Re^(1/7);        % friction coefficient
T_wall = Cf*rho*U^2/2;      % shear stress
U_fric = sqrt(T_wall/rho);  % friction velocity

DeltaS = y_plus*mu/(U_fric*rho); % Heigth of the first cell centre for the desired y_plus!!!!!

firstLayerThickness = 2*DeltaS

% SpessoreSL = 0.37*L/2/Re^(1/5)

