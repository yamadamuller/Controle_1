%Análise de Lugar das Raízes e Ganho Crítico
%Aluno: Mateus Yamada Muller

%Função de TransferÊncia de Malha Aberta
A = [0 1 0; 0 0 1; -160 -56 -14];
B = [0; 1; 14];
C = [1 0 0];
D = [0];
[num,den] = ss2tf(A,B,C,D);
G = tf(num,den);

%Letra A ganho crítico Kcr para marginalmente estável
Kcr = margin(G)
G2 = tf(Kcr*num,den);
sys1 = feedback(G2,1);
rlocus(G2);

%Letra B 
for K = 0:0.5:Kcr 
    G3 = tf(K*num,den);
    sys2 = feedback(G3,1);
    subplot(3,1,1)
    rlocus(G3)
    title('Lugar das Raízes')
    subplot(3,1,2)
    pzmap(sys2)
    title('Polos de Malha Fechada')
    hold on
end
hold off

%Letra C
K2 = 30;
G3 = tf(K2*num,den);
sys3 = feedback(G3,1);
subplot(3,1,3)
stepplot(sys3,20);
title('Resposta ao Degrau')
grid on
