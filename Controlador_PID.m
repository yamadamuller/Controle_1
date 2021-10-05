%Controlador PID 
%Aluno: Mateus Yamada Muller

R1 = 1000; %1k ohms
C1 = 1e-6; %1u faraday
num1 = [R1];
den1 = [R1*C1 1];
%Z1 = R1/(R1C1s + 1)
Z1=tf(num1,den1);

R2 = 1000; %1k ohms
C2 = 1e-6; %1u faraday
num2 = [R2*C2 1];
den2 = [C2 0];
%Z2 = (R2C2s + 1)/C2s
Z2=tf(num2,den2);

R3 = 1000; %1k ohms
num3 = [R3];
den3 = [1];
%Z3 = R3
Z3=tf(num3,den3);

R4 = 1000; %1k ohms
num4 = [R4];
den4 = [1];
%Z4 = R4
Z4=tf(num4,den4);

Z1,Z2,Z3,Z4 %print das funções dos componentes

sys1 = -Z2/Z1 %inversor eletrônico RC
sys2 = -Z4/Z3 %inversor eletrônico R
sys3 = sys1*sys2 %função de transferência do PID

H = tf(sys3)
pzmap(H) %mapa de polos e zeros do sistema
