clc;
clear;
close all;

% 1.Input section
disp('Enter Mass Values (kg)');
m1 = input('m1 = ');
m2 = input('m2 = ');
m3 = input('m3 = ');
m4 = input('m4 = ');
m5 = input('m5 = ');

disp('Enter Spring Stiffness Values (N/m)');
k1 = input('k1 = ');
k2 = input('k2 = ');
k3 = input('k3 = ');
k4 = input('k4 = ');
k5 = input('k5 = ');


% 2.The matrix A represents the stiffness/mass ratio for each DOF
A = [ k1/m1       -k1/m1          0            0            0 ;
     -k1/m2  (k1+k2)/m2     -k2/m2          0            0 ;
       0       -k2/m3      (k2+k3)/m3     -k3/m3        0 ;
       0         0          -k3/m4      (k3+k4)/m4    -k4/m4 ;
       0         0            0          -k4/m5      (k4+k5)/m5 ];

[EigenVectors, EigenValues] = eig(A);

lambda = diag(EigenValues);      % Eigenvalues
omega  = sqrt(lambda);           % Natural Frequencies (rad/s)
freqHz = omega/(2*pi);           % Natural Frequencies (Hz)

% 4. DISPLAY RESULTS
disp('======================================')
disp('        EIGENVALUE ANALYSIS')
disp('======================================')

disp('Eigenvalues (lambda):')
disp(lambda)

fprintf('\nNatural Frequencies:\n')
fprintf('w1 = %.6f rad/s   (f1 = %.6f Hz)\n', omega(1), freqHz(1));
fprintf('w2 = %.6f rad/s   (f2 = %.6f Hz)\n', omega(2), freqHz(2));
fprintf('w3 = %.6f rad/s   (f3 = %.6f Hz)\n', omega(3), freqHz(3));
fprintf('w4 = %.6f rad/s   (f4 = %.6f Hz)\n', omega(4), freqHz(4));
fprintf('w5 = %.6f rad/s   (f5 = %.6f Hz)\n', omega(5), freqHz(5));

% 5. STABILITY CHECK
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

% 6. EIGENVALUE PLOT
figure;
plot(real(lambda), imag(lambda), 'bo', ...
    'LineWidth',2, 'MarkerSize',8);

grid on;
xlabel('Real Part');
ylabel('Imaginary Part');
title('Eigenvalues on Complex Plane');

xline(0,'k--','LineWidth',1.5);   % Imaginary axis
yline(0,'k--','LineWidth',1.5);   % Real axis
axis equal;

