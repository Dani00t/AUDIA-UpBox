clear all, close all, clc

%% Convergenza Cd vs iterazioni

% Specifica il percorso al file forceCoeff.dat
filePath = 'postProcessing/forceCoeffs1/0/coefficient.dat';

% Leggi il file ignorando le righe di commento
data = readmatrix(filePath, 'FileType', 'text', 'CommentStyle', '#');

% Estrai le colonne dal file
% Assumiamo che la prima colonna sia il tempo/iterazioni e la seconda C_d
iterations = data(:, 1); % Colonna 1: Iterazioni o tempo
Cd = data(:, 2);         % Colonna 2: Coefficiente di resistenza C_d

% Plotta C_d vs Iterazioni
figure;
plot(iterations, Cd, 'b-', 'LineWidth', 1.5);
grid on;
xlabel('Iterations');
ylabel('C_d');
title('C_d vs Iterations');


%% Drag mediato 

% Considerando 2000 iterazioni, medio sulle ultime 500. Quindi medio il cd
% sulle ultime 100, 200, 300, 400, 500 e valuto la differenza del cd medio
% e della deviazione stdrd. Se il cd medio è simile, allora va bene.

nLast = 500;
Cd_last = Cd(end-nLast+1:end); % Estrai gli ultimi nLast valori
iterations_last = iterations(end-nLast+1:end); % Tempo corrispondente (opzionale)

Cd_mean = mean(Cd_last); % Media
Cd_std = std(Cd_last);   % Deviazione standard

% Stampa i risultati
fprintf('Mean C_d on the last %d iterations: %.6f\n', nLast, Cd_mean);
fprintf('Standard deviation C_d on the last %d iterations: %.6f\n', nLast, Cd_std);

figure;
plot(iterations_last, Cd_last, '-o', 'LineWidth', 1.5);
hold on;
yline(Cd_mean, '--r', 'LineWidth', 1.5, 'DisplayName', 'Media');
xlabel('Iterations');
ylabel('Cd');
title(sprintf('Cd on the last %d iterations', nLast));
legend('Cd', 'Average');
grid on;


%% Ciclo for per le ultime 500 iterazioni
windowSizes = [100, 200, 300, 400, 500]; % Dimensioni delle finestre

% Inizializza array per memorizzare i risultati
meanValues = zeros(size(windowSizes));
stdValues = zeros(size(windowSizes));

% Ciclo for sulle finestre
for i = 1:length(windowSizes)
    nLast = windowSizes(i); % Dimensione della finestra corrente
    Cd_last = Cd(end-nLast+1:end); % Estrai gli ultimi nLast valori

    % Calcola la media e la deviazione standard
    meanValues(i) = mean(Cd_last);
    stdValues(i) = std(Cd_last);

    % Stampa i risultati
    fprintf('Window: last %d iterations\n', nLast);
    fprintf(' - Mean drag C_d: %.6f\n', meanValues(i));
    fprintf(' - Standard deviation C_d: %.6f\n\n', stdValues(i));
end

% Grafico (opzionale)
figure;
plot(windowSizes, meanValues, '-o', 'LineWidth', 1.5, 'DisplayName', 'Media');
hold on;
errorbar(windowSizes, meanValues, stdValues, 's', 'LineWidth', 1.5, 'DisplayName', 'Dev. Std.');
xlabel('Number of iterations considered');
ylabel('Cd');
title('Mean value and standard deviation of drag coefficient C_d');
legend('Average', 'Standard deviation');
grid on;