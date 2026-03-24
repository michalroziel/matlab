
% wir möchten die bisherigen regressionen auch in den plot einzeichnen 
% somit können wir die verschiedenen regressionen vergleichen
function plotVergleichRegressionen(x, y, gradHistory, yFitHistory)

    % same as before : 
    % alle vektoren in spaltenvektoren umwandeln
    x = x(:);
    y = y(:);

    % wir sortieren die x werte aufsteigend
    % index merkt sich die ursprüngliche position der x werte, damit xFit in der richtignen reihenfolge 
    % grundsätzlich sortieren, damit die lines von links nach rechts verlaufen
    [xSort, index] = sort(x);

    % % lines erzeugt verschiedene Farben für jede vorhandene Regression
    farben = lines(length(gradHistory));

    figure;
    % wir plotten die DP als schwarze Kreise
    plot(x, y, 'ko', 'MarkerFaceColor', 'k');

    % Anforderung : nur einmal zeichnen
    hold on;

    % wir iterieren über alle vorhandenen Regressionen und plotten sie
    for i = 1:length(gradHistory)
        plot(xSort, yFitHistory(index, i), 'LineWidth', 2.0);
    end

    % Plot beschriftung
    grid on;  
    xlabel('x');
    ylabel('y');
    title('Vergleich der bisherigen Regressionsfunktionen');

    legenden = {'Datenpunkte'};

    for i = 1:length(gradHistory)
        legenden{end + 1} = sprintf('Regression %d (Grad %d)', i, gradHistory(i));
    end

    legend(legenden, 'Location', 'best');
end
