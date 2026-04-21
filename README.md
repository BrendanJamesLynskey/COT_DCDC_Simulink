# ⚡ Constant-On-Time Buck Converter — Simulink Model

A MATLAB/Simulink model of a **constant on-time (COT)** controlled synchronous buck DC-DC converter, with supporting MATLAB scripts for parameter setup, simulation, and result plotting.

Adapted from the NPTEL course *NOC July 2021 — Control and Tuning Methods in Switched Mode Power Converters* by Prof. Santanu Kapat (IIT Kharagpur).

## Files

| File | Purpose |
|------|---------|
| `conventional_buck_COT.slx` | Simulink model of the synchronous buck with COT control loop |
| `conventional_buck_COT_params.m` | Converter, control, and stimulus parameters (Vin, Vout, L, C, Ton, load steps) |
| `conventional_buck_COT_sim.m` | Runs the Simulink simulation from the MATLAB prompt |
| `conventional_buck_COT_plot.m` | Plots switching waveforms and load-step transient response |

## Running

```matlab
conventional_buck_COT_params   % load parameters into the workspace
conventional_buck_COT_sim      % run the Simulink model
conventional_buck_COT_plot     % plot results
```

The Simulink model uses only elements from the basic Simulink library — **no Simscape blocks required**.

## Context

COT is one of the simplest high-performance buck control schemes — at each switching event the high-side FET is driven on for a fixed time `Ton`, and the comparator decides when to switch again based on the sensed output (typically the ripple across the output capacitor ESR). Compared with fixed-frequency voltage-mode and current-mode PWM schemes, COT offers:

- Near-ideal load-step response (single-cycle correction).
- Very low loop-component count — no compensation network, no PWM ramp generator.
- Frequency that varies with `Vin`, `Vout`, and load — which can complicate EMI filter design.

For a broader discussion of COT alongside voltage-mode, current-mode, hysteretic, and PFM control, see the sibling [DC-DC Converter Control Techniques](https://github.com/BrendanJamesLynskey/DCDC_Control_Techniques) interactive presentation.

## References

- NPTEL, *Control and Tuning Methods in Switched Mode Power Converters* (Prof. Santanu Kapat, IIT Kharagpur) — [nptel.ac.in](https://nptel.ac.in/)
- Erickson &amp; Maksimović, *Fundamentals of Power Electronics*, 3rd ed., Springer, 2020.
- Texas Instruments, *D-CAP™ control topology* — application notes describing commercial COT buck regulators.

## License

Educational use. Content © Brendan Lynskey 2023.
