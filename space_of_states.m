%% Parámetros
global KA
global KB
global m
global bA
global bB
global a
global b
global Ix
global Iy
global W

KA = Car.KA;
KB = Car.KB;
m = Car.m;
bA = Car.bA;
bB = Car.bB;
a = Car.a;
b = Car.b;
Ix = Car.Ix;
Iy = Car.Iy;
W = Car.W;

%% Matrices de coeficientes
A = [-2*(KA + KB)/m    ,           0      , 2*(a+b)*(KA - KB)/m      , -2*(bA + bB)/m      ,        0         , 2*(a+b)*(bA - bB)/m   ; ...
            0        , -2*W^2*(KA + KB)/Ix ,        0               ,        0          , -2*W^2*(bA + bB)/Ix ,         0           ; ...
	2*(a+b)*(KA - KB)/Iy,           0      , -2*(a+b)*(a*KA + b*KB)/Iy , 2*(a+b)*(bA - bB)/Iy ,        0         , -2*(a+b)*(a*bA + b*bB)/Iy ; ...
	0 , 0 , 0 , 1 , 0 , 0 ; ...
	0 , 0 , 0 , 0 , 1 , 0 ; ...
	0 , 0 , 0 , 0 , 0 , 1];

B =	[KA , KA , KB , KB , bA , bA , bB , bB ; ...
	W*KA , -W*KA , W*KB , -W*KB , W*bA , -W*bA , W*bB , -W*bB ; ...
	-a*KA , -a*KA , b*KB , b*KB , -a*bA , -a*bA , b*bB , b*bB];
B = [B; zeros(3,8)];
%% Funcion de salida
C = [1 W/4 0 0 0 0];
D = zeros(1,8);

%% Creacion de espacio de estados y función de transferencia
[b1,a1] = ss2tf(A,B,C,D,1); %Numerador, denominador h1
[b2,a2] = ss2tf(A,B,C,D,2); %Numerador, denominador h2
[b3,a3] = ss2tf(A,B,C,D,3); %Numerador, denominador h3
[b4,a4] = ss2tf(A,B,C,D,4); %Numerador, denominador h4
[b5,a5] = ss2tf(A,B,C,D,5); %Numerador, denominador h_dot1
[b6,a6] = ss2tf(A,B,C,D,6); %Numerador, denominador h_dot2
[b7,a7] = ss2tf(A,B,C,D,7); %Numerador, denominador h_dot3
[b8,a8] = ss2tf(A,B,C,D,8); %Numerador, denominador h_dot4

%% Modelado del tiempo de muestreo
Fs = 16; %Frecuencia Hz
N = 100; %Numero de iteraciones
dt = 1/Fs; 
t = dt*(0:N-1); %Tiempo

%% Modelado matemático del impulso unitario
ux = [1 1 zeros(1,N-2)];