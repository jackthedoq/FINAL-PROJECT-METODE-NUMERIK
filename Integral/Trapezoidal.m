% Definisikan fungsi
f = @(x) cos(x) + sin(x).^2;

% Batas integral
a = 0;
b = pi/2;

% Jumlah trapesium (bisa disesuaikan sesuai kebutuhan)
N = 1000;

% Lebar trapesium
h = (b - a) / N;

% Hitung nilai integral menggunakan metode trapesium
x = a:h:b; % Definisikan array x
integral_result = h / 2 * (f(a) + f(b) + 2 * sum(f(x(2:end-1))));

% Tampilkan hasil
disp(['Hasil integral: ', num2str(integral_result)]);

