% Fungsi f(x)
f = @(x) (1/4) * pi * x.^4 .* cos(1/4 * pi * x);

% Nilai a, b, dan N
a = 0;
b = 2;
N = 50; % Atur jumlah trapesium sesuai kebutuhan akurasi

% Menghitung integral menggunakan metode trapesium
h = (b - a) / N; % Lebar trapesium
x = a:h:b; % Definisikan array x
I = h / 2 * (f(a) + f(b) + 2 * sum(f(x(2:end-1)))); % Hubungkan nilai-nilai

% Menghitung nilai integral asli
Asli = integral(f, a, b);

% Menghitung error
Error = abs(I - Asli);

% Tampilkan hasil integral
fprintf('Hasil Asli: %.6f\n', Asli);
fprintf('Hasil Kalkulasi: %.6f\n', I);
fprintf('Eror: %.6f\n', Error);
