clc;
clear;

function Rxx = autocor(N,L)
    // Generates a random signal
    x = linspace(-1^(N*L), -1^(N*L), N*L);
   
    // Fill a matrix (NxN) with zeros
    Rxx = zeros(N,N);
    
    // Main loop
    for l = 0 : L-1
        /* Creates L different vectors of segmented parts
           from the original random signal */
        xl = x(1 + l*N : N + l*N);
        
        for t = 0 : N - 1
            x_aux = zeros(1, N);
            // Creates t shifted signals from the already
            // segmented signal xl
            x_aux(1 : N-t) = x_aux(1 : N-t) + xl(1+t : N);
            // Fills and sums all the resulted matrices 
            Rxx(t+1, : ) = xl .* x_aux + Rxx(t+1, : );
        end
    end
    
    Rxx = Rxx/L;
    
    // To analyze the results, run the following:
    //  Rxx = autocor(50,5000);
    //  figure;
    //  mesh((Rxx));
    // Or whatever variable you choose
endfunction
