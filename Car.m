classdef Car
    % Car data
    % Parámetros másicos y coeficientes
    properties (Constant)

        KA = 28000; %Rigidez suspensión delantera N/m
        KB = 28000 ; %Rigidez suspensión trasera N/m
        m = 1600 ; %Masa suspendida
        bA = 2000 ; %Amortiguación suspensión delantera N*s/m
        bB = 2000; %Amortiguación suspensión trasera N*s/m
        a = 1.2 ; %Distancia CG al tren delantero m
        b = 2 ; %Distancia CG al tren trasero m
        Ix = 6140 ; %Momento de inercia respecto a eje x Kg*m²
        Iy = 27600 ; %Momento de inercia respecto a eje y Kg*m²
        W = 1.6 ; %Distancia entre ejes m
    end
end