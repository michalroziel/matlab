
function [koeffizienten, yFit, fehlerQuadratisch] = calculate_regression(x, y, grad)
    

    if check_Data(x, y) == false
        fprintf(' \n Die Daten sind ungueltig. \n');
        error('Fehler!');
    end

    maxGrad = length(x) - 2;

    if grad < 0 || floor(grad) ~= grad
        fprintf(' \n Der Grad muss eine positive ganze Zahl sein. \n');
        error('Fehler!');
    end

    % Wichtig : Für Grad m benötigen wir mindestens m+1 Datenpunkte .
    % deshlab falls nicht der fall ist : error !
    if grad > maxGrad
        error('Der Grad darf maximal %d sein.', maxGrad);
    end

    % umwandeln / checken ob die eigaben auch
    % Spalten vectors sind
    x = x(:);
    y = y(:);

    % Wir können die Koeffizienten der Polynomregression berechnen, indem wir die Normalengleichung verwenden.
    % Hierbei ist danach A die Matrix, die Regressions Matrix. 

    % beispiel : 
    % p(x) = a*x^2 + b*x + c
    % für 5 Data Points und grad 2 braucht das Polynom 3 Koeffizienten 

    % length(x) - Anzah der Datenpunkte
    % grad + 1  - Anzahl der Koeffizienten 
    A = zeros(length(x), grad + 1);

    % wir füllen die matrix für alle Datenpunkte bis zum gewählten grad 
    for k = 0:grad

        % wichtig : punktoperator für punktweise berechnung

        % k = 0: x.^0 = 1
        % für k =1: x.^1 = x
        % für k =2: x.^2 = x^2 
        % k=0 ist hier die letze Spalte
        A(:, grad + 1 - k) = x.^k;

        %A = [x.^2   x   1]
        % ist die korrepsondierenre Matrix zu: 
        % MATRIX = a*x^2 + b*x + c    
    end

    % Jetzt können wir die Koeffizienten mit dem \ operator berechnen
    koeffizienten = A \ y;


    % Berechnung der Werte des angepassten Polynom für die gegebenen x-Werte
    yFit = A * koeffizienten;

    % ordinary least squares Fehler : Summe der quadrierten fehler 
    % hierbei fehler : zwischen den tatsächlichen y-Werten und den angepassten y-Werten
    % 
    fehlerQuadratisch = sum((y - yFit).^2);


end


