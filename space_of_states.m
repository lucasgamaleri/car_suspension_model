% Parámetros
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

% Matrices de coeficientes
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
%Funcion de salida
C = [1 0 0 0 0 0];
D = 0;

%Espacio de estados
sys = ss(A,B,C,D);
G = tf(sys);