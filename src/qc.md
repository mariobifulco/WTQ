# Approaches to Quantum Computing

Quantum Computing (QC) is all about tackling problems in a fundamentally different way compared to classical computing.

The core idea is to leverage the phenomena of quantum mechanics—like **superposition** and **entanglement**—to dramatically speed up the process of finding a solution.

Besides the goal of achieving faster results, the main hope is to be able to "express" more with quantum computers. This means having the right tools to represent and solve problems that are **intrinsically non-classical**. A classic example: running simulations of real-world quantum-level particle systems, which is currently impossible for even the largest classical supercomputers as systems get bigger.

Unlike classical computing, where the transistor-based architecture is the universal standard, we currently don't have a single standard way of building a quantum computer. This means every vendor is proposing their own technique for doing quantum, each coming with its own set of unique pros and cons. It’s a very exciting hardware race!

These approaches can generally be categorized along two main axes:

- **Type of Hardware Technology Used**
  - Superconductors (IBM, Google, IQM, DWave, Rigetti, ...)
  - Trapped ions (Quantinuum, IonQ, ...)
  - Neutral atoms (Pasqal, QuEra, ...)
  - Photons (Quandela, Xanadu, ...)
  - Semiconductor spin qubits (Intel, QuTech, ...)
- **Nature of the Computation**
  - **Analog:** The physical system described by the qubits evolves globally. *Think of this as a direct quantum simulator, where the hardware naturally mirrors the problem you're trying to solve.*
  - **Digital:** The physical system evolves locally, meaning we have precise control over individual qubits. *This is the familiar quantum circuit model, like stringing together logic gates step-by-step.*
  - **Mix** (Often a combination of both, sometimes called a hybrid architecture).

## A (Non-Exhaustive) Map of Quantum Computing

![A map illustrating different quantum computing technologies and approaches](./imgs/q_map.png)
