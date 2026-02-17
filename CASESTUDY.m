
clc; clear; close all;

m1=12000; m2=10000; m3=8000; m4=7000; m5=6000;

k1=3000; k2=2400; k3=1800; k4=1500; k5=1200;

A = [ (k1+k2)/m1   -k2/m1          0              0              0 ;
     -k2/m2      (k2+k3)/m2     -k3/m2          0              0 ;
       0          -k3/m3      (k3+k4)/m3     -k4/m3           0 ;
       0            0          -k4/m4      (k4+k5)/m4     -k5/m4 ;
       0            0            0           -k5/m5        k5/m5 ];

[EigenVectors, EigenValues] = eig(A);

[EigenVectors, EigenValues] = eig(A);

lambda = diag(EigenValues);    
omega = sqrt(lambda);

disp('Eigenvalues:')
disp(lambda)

disp('Natural Frequencies (rad/s):')
disp(omega)

if all(lambda > 0)
    disp('------------------------------------')
    disp('SYSTEM IS STABLE')
    disp('All eigenvalues are positive')
    disp('------------------------------------')
elseif any(lambda < 0)
    disp('------------------------------------')
    disp('SYSTEM IS UNSTABLE')
    disp('Negative eigenvalue detected')
    disp('------------------------------------')
else
    disp('------------------------------------')
    disp('SYSTEM IS MARGINALLY STABLE')
    disp('Zero eigenvalue detected')
    disp('------------------------------------')
end


w1 = sqrt(EigenValues(1,1));
w2 = sqrt(EigenValues(2,2));
w3 = sqrt(EigenValues(3,3));
w4 = sqrt(EigenValues(4,4));
w5 = sqrt(EigenValues(5,5));

t1 = linspace(0,4*pi/w1,200);

for i = 1:5
    A_mode(i) = EigenVectors(i,1);
    x_mode(i,:) = A_mode(i)*sin(w1*t1);
end

figure
for i = 1:5
    subplot(3,2,i)
    plot(x_mode(i,:),t1,'r','LineWidth',1.5)
    ylim([0 4*pi/w1])
    grid on
    title(['Mass ',num2str(i),' with w1'])
end

t2 = linspace(0,4*pi/w2,200);

for i = 1:5
    A_mode2(i) = EigenVectors(i,2);
    x_mode2(i,:) = A_mode2(i)*sin(w2*t2);
end

figure
for i = 1:5
    subplot(3,2,i)
    plot(x_mode2(i,:),t2,'b','LineWidth',1.5)
    ylim([0 4*pi/w2])
    grid on
    title(['Mass ',num2str(i),' with w2'])
end


t3 = linspace(0,4*pi/w3,200);

figure
for i = 1:5
    subplot(3,2,i)
    plot(EigenVectors(i,3)*sin(w3*t3),t3,'k','LineWidth',1.5)
    ylim([0 4*pi/w3])
    grid on
    title(['Mass ',num2str(i),' with w3'])
end


t4 = linspace(0,4*pi/w4,200);

figure
for i = 1:5
    subplot(3,2,i)
    plot(EigenVectors(i,4)*sin(w4*t4),t4,'m','LineWidth',1.5)
    ylim([0 4*pi/w4])
    grid on
    title(['Mass ',num2str(i),' with w4'])
end


t5 = linspace(0,4*pi/w5,200);

figure
for i = 1:5
    subplot(3,2,i)
    plot(EigenVectors(i,5)*sin(w5*t5),t5,'g','LineWidth',1.5)
    ylim([0 4*pi/w5])
    grid on
    title(['Mass ',num2str(i),' with w5'])
end
