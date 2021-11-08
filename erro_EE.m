%Análise de Erro de Estado Estacionário e Constante de Erro
%Aluno: Mateus Yamada Muller

%Diagrama de Blocos
G0 = tf([2 2],[1 2]); %tipo 0
G1 = tf([2 2],[1 2 0]); %tipo 1
G2 = tf([2 2],[1 2 0 0]); %tipo 2
%G0,G1,G2 %print das funções de malha aberta

sys0 = feedback(G0,1);
sys1 = feedback(G1,1);
sys2 = feedback(G2,1);
%sys0,sys1,sys2 %print dos sistemas com realimentação unitária

%Declaração das funções de entrada
t = 0:0.05:100;
degrau = t>=0;
rampa = t.*degrau;
parabola = (t.^2./2).*degrau;

%Letra a - Respostas
%Sistema Tipo 0
figure(1) 

dg0 = lsim(sys0,degrau,t);
subplot(3,1,1)
plot(t,dg0);
hold on
plot(t,degrau);
hold off
title('Resposta ao Degrau (Tipo 0)');
grid on

rmp0 = lsim(sys0,rampa,t);
subplot(3,1,2)
plot(t,rmp0);
hold on
plot(t,rampa);
hold off
title('Resposta a Rampa (Tipo 0)');
grid on

prb0 = lsim(sys0,parabola,t);
subplot(3,1,3)
plot(t,prb0);
hold on
plot(t,parabola);
hold off
title('Resposta a Parabola (Tipo 0)');
grid on

%Sistema Tipo 1
figure(2) 

dg1 = lsim(sys1,degrau,t);
subplot(3,1,1)
plot(t,dg1);
hold on
plot(t,degrau);
hold off
title('Resposta ao Degrau (Tipo 1)');
grid on

rmp1 = lsim(sys1,rampa,t);
subplot(3,1,2)
plot(t,rmp1);
hold on
plot(t,rampa);
hold off
title('Resposta a Rampa (Tipo 1)');
grid on

prb1 = lsim(sys1,parabola,t);
subplot(3,1,3)
plot(t,prb1);
hold on
plot(t,parabola);
hold off
title('Resposta a Parabola (Tipo 1)');
grid on

%Sistema Tipo 2
figure(3) 

dg2 = lsim(sys2,degrau,t);
subplot(3,1,1)
plot(t,dg2);
hold on
plot(t,degrau);
hold off
title('Resposta ao Degrau (Tipo 2)');
grid on

rmp2 = lsim(sys2,rampa,t);
subplot(3,1,2)
plot(t,rmp2);
hold on
plot(t,rampa);
hold off
title('Resposta a Rampa (Tipo 2)');
grid on

prb2 = lsim(sys2,parabola,t);
subplot(3,1,3)
plot(t,prb2);
hold on
plot(t,parabola);
hold off
title('Resposta a Parabola (Tipo 2)');
grid on

%Letra b - Erros de Estado Estado Estacionário
s = tf([1 0],[0 1]); %função s
s_sqr = tf([1 0 0],[0 0 1]); %função s^2

%Tipo 0 
%degrau 
Kp0 = dcgain(G0);
ess_dgr0 = 1/(1+Kp0)
%rampa
sG_0 = s*G0;
Kv0 = dcgain(sG_0);
ess_rmp0 = 1/Kv0
%parabola
s2G_0 = s_sqr*G0;
Ka0 = dcgain(s2G_0);
ess_pbl0 = 1/Ka0

%Tipo 1 
%degrau 
Kp1 = dcgain(G1);
ess_dgr1 = 1/(1+Kp1)
%rampa
sG_1 = s*G1;
Kv1 = dcgain(sG_1);
ess_rmp1 = 1/Kv1
%parabola
s2G_1 = s_sqr*G1;
Ka1 = dcgain(s2G_1);
ess_pbl1 = 1/Ka1

%Tipo 2 
%degrau 
Kp2 = dcgain(G2);
ess_dgr2 = 1/(1+Kp2)
%rampa
sG_2 = s*G2;
Kv2 = dcgain(sG_2);
ess_rmp2 = 1/Kv2
%parabola
s2G_2 = s_sqr*G2;
Ka2 = dcgain(s2G_2);
ess_pbl2 = 1/Ka2

G3 = tf([2 2],[1 2 0 0 0]); %tipo 2
sys3 = feedback(G3,1);

%Declaração das funções de entrada
t = 0:0.05:100;
degrau = t>=0;
parabola = (0.5.*t.^2./2).*degrau;
cubica = (1./3.*t.^3).*degrau;

s2_sqr = tf([1 0 0],[0 0 1]); %função s^2
s2_cub = tf([1 0 0 0],[0 0 0 1]); %função s^3

%Tipo 3 
%parabola
s2G_3 = s2_sqr*G3;
Kv3 = dcgain(s2G_3);
ess_pbl_2_3 = 1/Kv3
%cubica
s3G_3 = s2_cub*G3;
Ka3 = dcgain(s3G_3);
ess_pbl_3_3 = 1/Ka3
