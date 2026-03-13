function lineare_reg_start()
    
    % die Konsole und die Variablen in dem Workspace clearen.
    clc;
    clear;
    
    x = [];
    y = [];

    % variablen um zu checken ob unsere data geloaded ist
    dataLoaded = false;
    
    % while(1) Schleife um das Programm nutzen zu können
    while true

        fprintf('\n XXX Lineare Regression - Main Menu XXX \n\n');
        fprintf('A - Daten punktweise eingeben \n');
        fprintf('B - Daten aus vorhandenen Vektoren laden \n');
        fprintf('C - Mit bereits geladenen Daten weiterarbeiten \n');
        fprintf('D - Programm beenden \n');
        
        wahl = input(' \nBitte wählen Sie eine Option: ' , 's');
        
        switch wahl
            case 'A'
                [x, y, dataLoaded] = datenPunktWeise();
                
            case 'B'
                [x, y, dataLoaded] = datenAusVektoren();
                
            case 'C'
                if dataLoaded
                    regressionUntermenue(x, y);
                else
                    % Message dass noch keine Daten geladen sind
                    fprintf(' \n Es sind noch keine Daten geladen. \n ');
                end
                
            case 'D'
                fprintf(' \n Programm wird beendet. \n');
                break;
                
            otherwise
                fprintf('\n Verstehe ich nicht. Bitte A bis D wählen. \n');
        end
    end
end
