# Quantum Error

The quantum computers currently available are heavily affected by noise (or decoherence).

This is why we talk about **NISQ** (Noisy Intermediate-Scale Quantum) devices. "Intermediate-Scale" refers to the fact that they have a relatively small number of qubits, and "Noisy" means the qubits are highly susceptible to errors.

The main goal for those building quantum computers is to achieve **fault-tolerant** devices.

A fault-tolerant quantum computer is resilient to errors in the physical qubits. It allows us to work entirely with **logical qubits**, which are subject only to the probability distribution of the quantum circuit itself, without interference from hardware noise. This is the Holy Grail of quantum computing!

Currently, efforts to make quantum computer results as robust as possible rely on two main strategies: **error mitigation** and **error correction**.
