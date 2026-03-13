function [koeffizienten, yFit, fehlerQuadratisch] = berechneRegression(x, y, grad)

    % Einfache Polynom-Regression mit MATLAB-Funktionen

    if ~check_Data(x, y)
        error('Die Daten sind ungueltig.');
    end

    maxGrad = length(x) - 2;

    if grad < 0 || floor(grad) ~= grad
        error('Der Grad muss eine nichtnegative ganze Zahl sein.');
    end

    if grad > maxGrad
        error('Der Grad darf hoechstens %d sein.', maxGrad);
    end

    koeffizienten = polyfit(x, y, grad);
    yFit = polyval(koeffizienten, x);
    fehlerQuadratisch = sum((y - yFit).^2);
end
