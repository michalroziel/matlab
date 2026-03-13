function regressionUntermenue(x, y)

    % Berechnung des maximal erlaubten Gradess
    % wir lassen den user es aber auch selbst aussuchen 
    maxGrad = length(x) - 2;

    % loop zum wiederholten abfragen
    while true

        fprintf('\n XXX Regressionsmenue XXX \n\n');

        % wir printen was momentan vorliegt
        % werte von x und y
        fprintf(' \n Daten Aktuell : \n');
        fprintf(' \n x = \n');
        disp(x);
        fprintf(' \n y = \n');
        disp(y);

        % wir können nicht mehr wie maximaler grad bestimmen        
        fprintf(' \n Maximal erlaubter Grad: %d \n', maxGrad);
        fprintf(' \n A - Grad manuell changen \n');
        fprintf(' \n B - Optimalen Grad automatisch bestimmen \n');
        fprintf(' \n C - Zurück zum Initial Menu \n');


        wahl = input('Bitte waehlen Sie eine Option: ', 's');

        % upper wie String.upperCase 
        % case insensitive machen damit auch a b c funktioniert 
        wahl = upper(wahl);

        switch wahl
            case 'A'
                grad = input('Bitte geben Sie den Grad ein: ');

                try
                    [koeffizienten, yFit, fehlerQuadratisch] = calculate_regression(x, y, grad);
                    zeigeRegressionErgebnis(grad, koeffizienten, yFit, fehlerQuadratisch);
                catch ME
                    fprintf('\nFehler: %s\n', ME.message);
                end

            case 'B'
                [besterGrad, koeffizienten, yFit, fehlerQuadratisch] = optimalenGradFinden(x, y);
                fprintf('\nOptimaler Grad: %d\n', besterGrad);
                zeigeRegressionErgebnis(besterGrad, koeffizienten, yFit, fehlerQuadratisch);

            case 'C'
                break;

            otherwise
                fprintf('\nBitte A, B oder C waehlen.\n');
        end
    end
end

function [besterGrad, besteKoeffizienten, bestesYFit, besterFehler] = optimalenGradFinden(x, y)

    maxGrad = length(x) - 2;
    besterGrad = 0;
    besterFehler = inf;
    besteKoeffizienten = [];
    bestesYFit = [];

    for grad = 0:maxGrad
        [koeffizienten, yFit, fehlerQuadratisch] = calculate_regression(x, y, grad);

        if fehlerQuadratisch < besterFehler
            besterGrad = grad;  
            besterFehler = fehlerQuadratisch;
            besteKoeffizienten = koeffizienten;
            bestesYFit = yFit;
        end
    end
end

function zeigeRegressionErgebnis(grad, koeffizienten, yFit, fehlerQuadratisch)

    fprintf('\nRegression erfolgreich berechnet.\n');
    fprintf('Grad: %d\n', grad);
    disp('Koeffizienten =');
    disp(koeffizienten);
    disp('yFit =');
    disp(yFit);
    fprintf('Quadratischer Fehler: %.6f\n', fehlerQuadratisch);
end
