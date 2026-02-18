# 📊 Case Study on Stability of a 5 DOF System Through Eigenvalue Analysis

**Author:** ANSH PATEL  
**Roll No:** 23BME047  
**Course:** Mechanical Vibrations / Engineering Mechanics  
**Tool Used:** MATLAB


---

## 🔷 1. Project Overview  
This case study models a **5-degree-of-freedom (DOF) coupled spring-mass system**.  

The objectives of this project are to:

- Determine the **natural frequencies** of the system  
- Analyze the **eigenvalues**  
- Check the **stability** of the system  
- Visualize eigenvalues in the **complex plane**  

The system is represented using a stiffness–mass matrix formulation and solved using MATLAB.

---

## 🔷 2. Problem Description  

In multi-degree-of-freedom mechanical systems:

- Masses are interconnected using springs  
- Each mass affects the motion of adjacent masses  
- The system behavior depends on stiffness and mass distribution  

The governing equation of motion leads to an **eigenvalue problem**, where:

- Eigenvalues represent squared natural frequencies  
- Eigenvectors represent mode shapes  

The goal is to:

1. Construct the system matrix  
2. Compute eigenvalues  
3. Calculate natural frequencies  
4. Check stability  
5. Plot eigenvalues  

---

## 🔷 3. Mathematical Formulation  

### 3.1 System Matrix (A)

$$
A =
\begin{bmatrix}
\frac{k_1}{m_1} & -\frac{k_1}{m_1} & 0 & 0 & 0 \\
-\frac{k_1}{m_2} & \frac{k_1+k_2}{m_2} & -\frac{k_2}{m_2} & 0 & 0 \\
0 & -\frac{k_2}{m_3} & \frac{k_2+k_3}{m_3} & -\frac{k_3}{m_3} & 0 \\
0 & 0 & -\frac{k_3}{m_4} & \frac{k_3+k_4}{m_4} & -\frac{k_4}{m_4} \\
0 & 0 & 0 & -\frac{k_4}{m_5} & \frac{k_4+k_5}{m_5}
\end{bmatrix}
$$

Where:

- $m_i$ = mass of the $i^{th}$ DOF  
- $k_i$ = stiffness of the $i^{th}$ spring  

---

### 3.2 Eigenvalue Equation

$$
A \mathbf{x} = \lambda \mathbf{x}
$$

Natural frequencies are obtained as:

$$
\omega_i = \sqrt{\lambda_i}
$$

And frequency in Hz:

$$
f_i = \frac{\omega_i}{2\pi}
$$

---

## 🔷 4. MATLAB Implementation

```matlab
clc;
clear;
close all;

% Input Section
disp('Enter Mass Values (kg)');
m1 = input('m1 = '); m2 = input('m2 = '); m3 = input('m3 = ');
m4 = input('m4 = '); m5 = input('m5 = ');

disp('Enter Spring Stiffness Values (N/m)');
k1 = input('k1 = '); k2 = input('k2 = '); k3 = input('k3 = ');
k4 = input('k4 = '); k5 = input('k5 = ');

% System Matrix
A = [ k1/m1       -k1/m1          0            0            0 ;
     -k1/m2  (k1+k2)/m2     -k2/m2          0            0 ;
       0       -k2/m3      (k2+k3)/m3     -k3/m3        0 ;
       0         0          -k3/m4      (k3+k4)/m4    -k4/m4 ;
       0         0            0          -k4/m5      (k4+k5)/m5 ];

% Eigenvalue Analysis
[EigenVectors, EigenValues] = eig(A);
lambda = diag(EigenValues);
omega  = sqrt(lambda);
freqHz = omega/(2*pi);

disp('Eigenvalues:')
disp(lambda)

fprintf('\nNatural Frequencies:\n')
fprintf('w1 = %.6f rad/s (f1 = %.6f Hz)\n', omega(1), freqHz(1));
fprintf('w2 = %.6f rad/s (f2 = %.6f Hz)\n', omega(2), freqHz(2));
fprintf('w3 = %.6f rad/s (f3 = %.6f Hz)\n', omega(3), freqHz(3));
fprintf('w4 = %.6f rad/s (f4 = %.6f Hz)\n', omega(4), freqHz(4));
fprintf('w5 = %.6f rad/s (f5 = %.6f Hz)\n', omega(5), freqHz(5));

% Stability Check
if all(lambda > 0)
    disp('SYSTEM IS STABLE')
elseif any(lambda < 0)
    disp('SYSTEM IS UNSTABLE')
else
    disp('SYSTEM IS MARGINALLY STABLE')
end

% Eigenvalue Plot
figure;
plot(real(lambda), imag(lambda), 'bo','LineWidth',2,'MarkerSize',8);
grid on;
xlabel('Real Part');
ylabel('Imaginary Part');
title('Eigenvalues on Complex Plane');
xline(0,'k--');
yline(0,'k--');
axis equal;
```

---

## 🔷 5. Example Results  

For the input values:

- Masses:  
  $m_1=12000$, $m_2=10000$, $m_3=8000$, $m_4=7000$, $m_5=6000$ kg  

- Stiffnesses:  
  $k_1=3000$, $k_2=2400$, $k_3=1800$, $k_4=1500$, $k_5=1200$ N/m  

| Mode | Eigenvalue ($\lambda$) | $\omega$ (rad/s) | $f$ (Hz) |
|------|------------------------|------------------|----------|
| 1 | 0.0250 | 0.1581 | 0.0251 |
| 2 | 0.1482 | 0.3849 | 0.0612 |
| 3 | 0.3524 | 0.5936 | 0.0944 |
| 4 | 0.7599 | 0.8717 | 0.1387 |
| 5 | 0.5827 | 0.7633 | 0.1214 |

---

## 🔷 6. Stability Condition  

- If all $\lambda_i > 0$ → **Stable System**  
- If any $\lambda_i = 0$ → **Marginally Stable**  
- If any $\lambda_i < 0$ → **Unstable System**  

---

## 🔷 7. Learning Outcomes  

✔ Application of Linear Algebra in mechanical systems  
✔ Eigenvalue analysis of multi-DOF systems  
✔ Stability analysis using matrix methods  
✔ MATLAB implementation of vibration problems  

---

## 🔷 8. Future Enhancements  

- Add damping matrix  
- Plot mode shapes  
- Extend to higher DOF systems  
- Convert to Python (NumPy implementation)  

---

## 📌 Conclusion  

This project demonstrates how a **5 DOF spring-mass system** can be modeled using matrix algebra.  
By solving the eigenvalue problem:

$$



the natural frequencies and stability characteristics of the system are determined, showcasing the practical application of linear algebra in mechanical vibration analysis.
