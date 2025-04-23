C = [120 140 139; 124 220 120; 114 130 122];
x1 = transpose(C(1,:));
x2 = transpose(C(2,:));
x3 = transpose(C(3,:));
A = ak_dctmtx(3);

% Matriz intermediária
T = [transpose(A*x1); transpose(A*x2); transpose(A*x3)]

% Matriz final
final_dct = [A*T(:,1), A*T(:,2), A*T(:,3)]

% Cálculo da DFT
function [X] = dft(x)
  % Tamanho da sequência
  N = length(x);
  % Inicializa o vetor de saída da DFT
  X = zeros(1, N);
  % Cálculo da DFT
  for k = 0:N-1
      for n = 0:N-1
          X(k+1) = X(k+1) + x(n+1) * exp(-1j * 2 * pi * k * n / N);
      end
  end
end
% Matriz intermediária
T = [dft(x1); dft(x2); dft(x3)]

% Matriz final
T_final = [transpose(dft(T(:,1))), transpose(dft(T(:,2))), transpose(dft(T(:,3)))]
