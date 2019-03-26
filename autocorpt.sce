clc;
clear;

function Rxx = autocor(N,L)
    // Cria um sinal aleatório AWGN
    x = rand(1, N*L, "normal");
   
    // Preenche uma matriz NxN com zeros
    Rxx = zeros(N,N);
    
    // Loop principal
    for l = 0 : L-1
        // Cria L-diferentes vetores de partes segmentadas
        // a partir do vetor original
        xl = x(1 + l*N : N + l*N);
        
        for t = 0 : N - 1
            x_aux = zeros(1, N);
            // Cria t sinais deslocados 
            // a partir do sinal já segmentado xl
            x_aux(1 : N-t) = x_aux(1 : N-t) + xl(1+t : N);
            // Preenche e soma as matrizes resultantes
            Rxx(t+1, : ) = xl .* x_aux + Rxx(t+1, : );
        end
    end
    
    Rxx = Rxx/L;
endfunction
