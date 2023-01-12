% Script to sim disturbances to conventional buck, with COT Control
%
% Adapted from NPTEL online course:
%   "Control and Tuning Methods in Switched Mode Power Converters"
%
% NB: no Simscape elements used in this project; only basic Simulink used
%
% Brendan Lynskey, 2023
%

clear all
close all
clc

% Basic setup
conventional_buck_COT_params;
Tsim    = 3e3 * Tsw;

% Part 1 - basic operation
Vin     = 12;
Vref    = 1;
R       = 0.5;
t_oset1 = 0;
out1    = sim("conventional_buck_COT");

% Part 2 - load step-up
Vin     = 12;
Vref    = 1;
R       = 0.05;
I_L_int = out1.simout.signals.values(end, 1);
V_C_int = out1.simout.signals.values(end, 3);
t_oset2 = out1.simout.time(end);
out2    = sim("conventional_buck_COT");

% Part 3 - Vref step
Vin     = 12;
Vref    = 1.2;
R       = 0.05;
I_L_int = out2.simout.signals.values(end, 1);
V_C_int = out2.simout.signals.values(end, 3);
t_oset3 = out2.simout.time(end) + t_oset2;
out3    = sim("conventional_buck_COT");

% Part 4 - Vin step
Vin     = 5;
Vref    = 1.2;
R       = 0.05;
I_L_int = out3.simout.signals.values(end, 1);
V_C_int = out3.simout.signals.values(end, 3);
t_oset4 = out3.simout.time(end) + t_oset3;
out4    = sim("conventional_buck_COT");

% Part 5 - load step-down
Vin     = 5;
Vref    = 1.2;
R       = 50;
I_L_int = out4.simout.signals.values(end, 1);
V_C_int = out4.simout.signals.values(end, 3);
t_oset5 = out4.simout.time(end) + t_oset4;
out5    = sim("conventional_buck_COT");


% Generate results vectors
t   = [ out1.simout.time + t_oset1;...
        out2.simout.time + t_oset2;...
        out3.simout.time + t_oset3;...
        out4.simout.time + t_oset4;...
        out5.simout.time + t_oset5];

i_O = [ out1.simout.signals.values(:, 1);...
        out2.simout.signals.values(:, 1);...
        out3.simout.signals.values(:, 1);...
        out4.simout.signals.values(:, 1);...
        out5.simout.signals.values(:, 1)];

i_L = [ out1.simout.signals.values(:, 2);...
        out2.simout.signals.values(:, 2);...
        out3.simout.signals.values(:, 2);...
        out4.simout.signals.values(:, 2);...
        out5.simout.signals.values(:, 2)];

v_O = [ out1.simout.signals.values(:, 3);...
        out2.simout.signals.values(:, 3);...
        out3.simout.signals.values(:, 3);...
        out4.simout.signals.values(:, 3);...
        out5.simout.signals.values(:, 3)];

q   = [ out1.simout.signals.values(:, 4);...
        out2.simout.signals.values(:, 4);...
        out3.simout.signals.values(:, 4);...
        out4.simout.signals.values(:, 4);...
        out5.simout.signals.values(:, 4)];

% Plot results
conventional_buck_COT_plot;
