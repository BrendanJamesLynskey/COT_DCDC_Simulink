% Parameters for conventional (non-sync) buck
% VMC and CMC available

% Timing params
% NB: COT produces variable Fsw, but adaptation possible
Fsw     = 0.5e6;
Tsw     = 1/Fsw;

Tstep_max   = Tsw / 10e2;
RelTol      = 1e-12;

DCM_en  = 1;

% Enable current-mode control
% Note: VMC with COT modulator is 'V^2 control'
CMC_en  = 1;

% Basic buck electrical params
L       = 0.5e-6;
C       = 200e-6;
R       = 1;

Vin     = 12;
Vref    = 1;
D       = Vref/Vin;

% On-time can be adapted to Vin, to make constant Fsw:
%   Ton = L.Ipk / (Vin - Vo)
% Also possible to adapt for constant V-ripple
COT_onTime      = Tsw * D;

% Min off-time needed to measure valley-current
COT_minOffTime  = Tsw / 20;

% Parasitics
r_L = 5e-3;
r_D = 5e-3;
v_D = 0.55;
r_C = 3e-3;

%r_dson_bot = 5e-3;
r_dson_top = 5e-3;


%Io_max = 20;

% Ramp params
%V_ramp_max  = 10;
%V_ramp_min  = 0;

% PID controller parameters
Kp = 400;
Ki = 25e3;
Kd = 0;

% Initial conditions, which can reduce sim start-up time
I_L_int = 0.5;
V_C_int = 1.0;

