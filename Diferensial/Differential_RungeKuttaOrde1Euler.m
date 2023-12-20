% Program Penyelesaian Persamaan Diferensial dengan Metode Runge-Kutta Orde 1 (Euler)
% dy/dx = sin(2*x) - y*tan(x)

% Definisikan fungsi f(x, y)
f = @(x, y) sin(2*x) - y*tan(x);

% Definisikan solusi analitik
syms y_analytic(x)
y_analytic(x) = dsolve(diff(y_analytic) == f(x, y_analytic), y_analytic(0) == 1);

% Definisikan parameter
x0 = 0; % nilai x awal
xf = 2; % nilai x akhir
y0 = 1; % kondisi awal y(x0)
h = 0.1; % ukuran langkah waktu

% Hitung jumlah langkah
N = (xf - x0) / h;

% Inisialisasi array untuk menyimpan hasil numerik
x_numeric = zeros(1, N+1);
y_numeric = zeros(1, N+1);

% Inisialisasi nilai awal
x_numeric(1) = x0;
y_numeric(1) = y0;

% Metode Runge-Kutta Orde 1 (Euler)
for i = 1:N
    k1 = h * f(x_numeric(i), y_numeric(i));
    
    x_numeric(i+1) = x_numeric(i) + h;
    y_numeric(i+1) = y_numeric(i) + k1;
end

% Solusi analitik
y_analytic_values = double(y_analytic(x_numeric));

% Tampilkan hasil dalam bentuk tabel
error = abs(y_numeric - y_analytic_values);
error_percentage = (error ./ abs(y_analytic_values)) * 100; % Presentase error

table_results = table(x_numeric', y_numeric', y_analytic_values', error', error_percentage', 'VariableNames', {'x', 'NumericSolution', 'AnalyticSolution', 'AbsoluteError', 'ErrorPercentage'});
disp(table_results);

% Plot hasil
figure;
subplot(2, 1, 1);
plot(x_numeric, y_numeric, '-o', x_numeric, y_analytic_values, '-');
legend('Numeric Solution', 'Analytic Solution');
title('Persamaan Diferensial dengan Metode Runge-Kutta Orde 1 (Euler)');
xlabel('x');
ylabel('y(t)');
grid on;

% Tampilkan grid
subplot(2, 1, 2);
plot(x_numeric, error, '-o');
title('Error Plot');
xlabel('x');
ylabel('Absolute Error');
grid on;

% Export to Excel
data = [x_numeric', y_numeric', y_analytic_values', error', error_percentage'];
col_header = {'x', 'NumericSolution', 'AnalyticSolution', 'AbsoluteError', 'ErrorPercentage'};
xlswrite('data_euler.xlsx', col_header, 'Sheet1', 'A1');
xlswrite('data_euler.xlsx', data, 'Sheet1', 'A2');
