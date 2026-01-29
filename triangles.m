    
    % - - - - - - - - - - - - - - -   - 
    % Compute the outerTriangle
    % - - - - - - - - - - - - - - - - - 
    
    
    x1 = 0;  y1 = 0;
    x2 = 4;  y2 = 0;
    
    % die Seitenlänge ist 4cm und die Höhe des dreiecks kann berechnet werden
    % mit :
    h  = sqrt(4^2 - 2^2);
    
    x3 = 2;  y3 = h;
    
    line([x1,x2], [y1, y2], 'Color', 'k', 'LineWidth',5);
    line([x2,x3], [y2, y3], 'Color', 'k', 'LineWidth',5);
    line([x3,x1], [y3, y1], 'Color', 'k', 'LineWidth',5);
    
    
    fill([x1 x2 x3], [y1 y2 y3], 'yellow');

    hold on;
    
    
    
    
    % Jetzt die MittelPunkte der Linien Verbinden -> green
    
    
    % - - - - - - - - - - - - - - -   - 
    % Compute the inner Triangle
    % - - - - - - - - - - - - - - - - - 
    
    midPoint1 = [(x1 + x2)/2, (y1 + y2)/2];
    midPoint2 = [(x2 + x3)/2, (y2 + y3)/2];
    midPoint3 = [(x3 + x1)/2, (y3 + y1)/2];
    
    
    % Vector of the x- values of our Points
    % (1) as its (x,y)
    % at the end -> (1) to finish of triangle
    xM = [midPoint1(1) midPoint2(1) midPoint3(1) midPoint1(1)];
    
    % Vector of the y- values of our Points
    yM = [midPoint1(2) midPoint2(2) midPoint3(2) midPoint1(2)];
    
    line(xM,yM,'Color','green','LineWidth',5);
    
    % Fill Inner triangle with red 
    fill(xM, yM, 'r');
    
    % - - - - - - - - - - - - - - -   - 
    % Calculate the Centre of the outer Triangle
    % - - - - - - - - - - - - - - - - - 
    
    % here in x-axis
    cx_outer = (x1 + x2 + x3)/3;
    % here i y-axis
    cy_outer = (y1 + y2 + y3)/3;
    
    % - - - - - - - - - - - - - - -   - 
    % Calculate the Centre of the inner Triangle
    % - - - - - - - - - - - - - - - - - 
    
    cx_inner = (midPoint1(1) + midPoint2(1) + midPoint3(1))/3;
    cy_inner = (midPoint1(2) + midPoint2(2) + midPoint3(2))/3;
    
    % plot two Blue stars as centre 
    plot(cx_outer, cy_outer, 'b*', 'MarkerSize', 15);  
    plot(cx_inner, cy_inner, 'b*', 'MarkerSize', 15);  



    % - - - - - - - - - - - - - - -   - 
    % Plot inner Circle
    % - - - - - - - - - - - - - - - - - 
    
    r_in = h/3;                               % define radius of inner circle
    

    theta = 0:0.01:2*pi;                      % Winkel Schritt für Schritt
    
    x_in  = cx_outer + r_in*cos(theta);       % x-Koords
    y_in  = cy_outer + r_in*sin(theta);       % y-Koords
    
    hold on;
    
    plot(x_in, y_in, 'k', 'LineWidth',2);
    
    % - - - - - - - - - - - - - - -   - 
    % Plot outer Circle 
    % - - - - - - - - - - - - - - - - - 
    
    
    r_out = 2*h/3;                            % define radius of outer circle
    
    theta = 0:0.01:2*pi;     
    
    x_out = cx_outer + r_out*cos(theta);
    y_out = cy_outer + r_out*sin(theta);
    
    plot(x_out, y_out, 'k','LineWidth',2);


    % - - - - - - - - - - - - - - -   - 
    % make outer cirlce the inner circle of a square
    % and create such square
    % - - - - - - - - - - - - - - - - - 
    
    % Inkreisradius des Quadrats = äußerer Kreis

    r_quad_in = r_out;              

    a_quad = 2 * r_quad_in;         % Seitenlänge
    s = a_quad / 2;                 % halbe Seitenlänge

    % Four Corners of the square 
    % hierbei sind diese achsenparallel 

    % Vector with x coordinates 
    xq = [cx_outer - s, cx_outer + s, cx_outer + s, cx_outer - s, cx_outer - s];
    % Vector with y coordinates 
    yq = [cy_outer - s, cy_outer - s, cy_outer + s, cy_outer + s, cy_outer - s];
    
    plot(xq, yq, 'r', 'LineWidth', 3);


    
    % fill(xq, yq, 'c');   % Cyan = Hellblau
    % covers everything 





    axis equal;
