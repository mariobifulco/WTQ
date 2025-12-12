# Quantum Error Mitigation (QEM)

This is a set of techniques used to try and minimize the error (or noise) currently affecting our noisy quantum systems.

IBM provides some pre-built techniques that are accessible via the **"resilience-level"** parameter in their runtime environments.

We typically discuss QEM in the context of gate-based quantum models.

## Twirled Readout Error eXtinction (TREX) / Measurement Twirling

Resilience **Level 1**

This technique estimates the error in the measurement gates across the various qubits. It is particularly useful for circuits that involve many measurement operations (like those found in quantum kernel algorithms).

Circuits that have only a single measurement qubit (e.g., in a purely quantum classification scenario) generally do not benefit much from this technique.

## Zero Noise Extrapolation (ZNE)

Resilience **Level 2**

The quantum circuit is executed multiple times, with an increasing number of **identity operations** (often implemented using double CNOT or double SWAP gates) strategically inserted. This makes the circuit "deeper" without changing its intended function. This allows us to gather data on how the noise scales with the circuit depth, and then mathematically **extrapolate** the measured result back to the theoretical zero-noise point.

## Gate Twirling

Resilience **Level 2**

This involves performing preliminary tests to understand exactly how much a single specific gate (like a CNOT or an arbitrary rotation) contributes to the overall error in the circuit. By characterizing the average effect of the noise on individual gates, we can improve the accuracy of our final result when analyzing the full circuit.
