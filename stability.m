%Análise de Estabilidade
%Aluno: Mateus Yamada Muller

%Diagrama de blocos
%Realimentação Negativa Unitária

%G(s)=K(s + 20)/(s^3 + 5s^2 + 6s)
K = 1;
num1 = [0 0 K 20*K];
den1 = [1 5 6 0];
G=tf(num1,den1);
%H(s) = 1 
num2 = [0 0 0 1];
den2 = [0 0 0 1];
H=tf(num2,den2);
%Realimentação
sys=feedback(G,H);

G,H,sys %print das funções 

%Letra a e b - análise de estabilidade
for K = 1:0.5:5 %por convenção K > 0
    fprintf('K = %d \n',K);
    num1 = [0 0 K 20*K];
    den1 = [1 5 6 0];
    G=tf(num1,den1);
    num2 = [0 0 0 1];
    den2 = [0 0 0 1];
    H=tf(num2,den2);
    sys=feedback(G,H);
    B=isstable(sys);
    
    if B==logical(1)
        P=pole(sys)
        if K==2
            disp('Sistema Criticamente Estável');
        else
            disp('Sistema Estável');
        end
    else
        P=pole(sys)
        disp('Sistema Instável');
    end
    
end

%Letra c - Resposta ao Degrau
K2 = 1;
sys2 = sistema(K2);
subplot(3,1,1)
stepplot(sys2,40);
title('Resposta ao Degrau Unitário (K=1)');
grid on

K3 = 2;
sys3 = sistema(K3);
subplot(3,1,2)
stepplot(sys3,40);
title('Resposta ao Degrau Unitário (K=2)');
grid on

K4 = 3;
sys4 = sistema(K4);
subplot(3,1,3)
stepplot(sys4,40);
title('Resposta ao Degrau Unitário (K=3)');
grid on

function sys = sistema(K)
    num1 = [0 0 K 20*K];
    den1 = [1 5 6 0];
    G=tf(num1,den1);
    %H(s) = 1 
    num2 = [0 0 0 1];
    den2 = [0 0 0 1];
    H=tf(num2,den2);
    %Realimentação
    sys=feedback(G,H);
end

