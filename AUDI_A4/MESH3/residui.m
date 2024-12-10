clear all, close all, clc

%% Residui 
% Specifica il percorso al file log.simpleFoam
filePath = 'log.simpleFoam';

% Leggi il file come testo
fileData = fileread(filePath);

% Estrai le righe che contengono residui per Ux, Uy, Uz, omega, k
residualLines = regexp(fileData, ...
    'Solving for (Ux|Uy|Uz|omega|k|p), Initial residual = ([\d\.e-]+), Final residual = ([\d\.e-]+)', ...
    'tokens');

% Inizializza le variabili
UxResidualsFinal = [];
UyResidualsFinal = [];
UzResidualsFinal = [];
omegaResidualsFinal = [];
kResidualsFinal = [];
pResidualsFinal = [];

UxResidualsInitial = [];
UyResidualsInitial = [];
UzResidualsInitial = [];
omegaResidualsInitial = [];
kResidualsInitial = [];
pResidualsInitial = [];

iterations = [];

% Itera sulle righe estratte
for i = 1:length(residualLines)
    token = residualLines{i};
    variable = token{1}; % Nome della componente (Ux, Uy, Uz, omega, k)
    finalRes = str2double(token{3}); % Residuo finale
    initialRes = str2double(token{2}); % Residuo iniziale 

    % Salva il residuo nella variabile corretta
    switch variable
        case 'Ux'
            UxResidualsFinal = [UxResidualsFinal; finalRes];
            UxResidualsInitial = [UxResidualsInitial; initialRes];
        case 'Uy'
            UyResidualsFinal = [UyResidualsFinal; finalRes];
            UyResidualsInitial = [UyResidualsInitial; initialRes];
        case 'Uz'
            UzResidualsFinal = [UzResidualsFinal; finalRes];
            UzResidualsInitial = [UzResidualsInitial; initialRes];
        case 'omega'
            omegaResidualsFinal = [omegaResidualsFinal; finalRes];
            omegaResidualsInitial = [omegaResidualsInitial; initialRes];
        case 'k'
            kResidualsFinal = [kResidualsFinal; finalRes];
            kResidualsInitial = [kResidualsInitial; initialRes];
        case 'p'
            pResidualsFinal = [pResidualsFinal; finalRes];
            pResidualsInitial = [pResidualsInitial; initialRes];
    end
end

pResidualsFinal = [pResidualsFinal(4:4:end)];
pResidualsInitial = [pResidualsInitial(4:4:end)];

% Assumi che ci siano N iterazioni
N = max([length(UxResidualsFinal), length(UyResidualsFinal), length(UzResidualsFinal), length(omegaResidualsFinal), length(kResidualsFinal), length(pResidualsFinal)]);
iterations = (1:N)';

%% Grafico residui finali
figure;
semilogy(iterations, UxResidualsFinal, 'r', 'DisplayName', 'Ux');
hold on;
semilogy(iterations, UyResidualsFinal, 'g', 'DisplayName', 'Uy');
semilogy(iterations, UzResidualsFinal, 'b', 'DisplayName', 'Uz');
semilogy(iterations, omegaResidualsFinal, 'c', 'DisplayName', 'omega');
semilogy(iterations, kResidualsFinal, 'y', 'DisplayName', 'k');
semilogy(iterations, pResidualsFinal, 'm', 'DisplayName', 'p');

grid on;
xlabel('Iterations');
ylabel('Final residuals');
title('Residuals Ux, Uy, Uz, omega, k, p vs Iterations');
legend show;
hold off;


%% Grafico residui iniziali
figure;
semilogy(iterations, UxResidualsInitial, 'r', 'DisplayName', 'Ux');
hold on;
semilogy(iterations, UyResidualsInitial, 'g', 'DisplayName', 'Uy');
semilogy(iterations, UzResidualsInitial, 'b', 'DisplayName', 'Uz');
semilogy(iterations, omegaResidualsInitial, 'c', 'DisplayName', 'omega');
semilogy(iterations, kResidualsInitial, 'y', 'DisplayName', 'k');
semilogy(iterations, pResidualsInitial, 'm', 'DisplayName', 'p');

grid on;
xlabel('Iterations');
ylabel('Initial residuals');
title('Residuals Ux, Uy, Uz, omega, k, p vs Iterations');
legend show;
hold off;