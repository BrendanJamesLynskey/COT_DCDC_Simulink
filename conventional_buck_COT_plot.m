% Plot conv buck waveforms
close all

% If results vectors are unavailable, create them
if exist('t') == 0
    t   = out.simout.time;
    i_O = out.simout.signals.values(:, 1);
    i_L = out.simout.signals.values(:, 2);
    v_O = out.simout.signals.values(:, 3);
    q   = out.simout.signals.values(:, 4);
end


% Plot results
nfig = 1;

figure(nfig); nfig = nfig+1;
grid;
plot(t, i_L, 'r');
title('Inductor current i_L');


figure(nfig); nfig = nfig+1;
grid;
plot(t, v_O, 'b');
title('Output voltage v_O');

figure(nfig); nfig = nfig+1;
grid;
plot(t, i_O, 'b');
title('Output current i_O');

figure(nfig); nfig = nfig+1;
grid;
plot(t, q, 'r');
title('Switching signal');

