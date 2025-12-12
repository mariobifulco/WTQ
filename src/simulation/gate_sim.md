# Simulators for Gate-Based Quantum Computing

## Naive Simulation (State Vector Simulation)

This method consists of creating the matrix that describes the entire quantum circuit. The computation of the final state (the output) then translates into a single matrix multiplication operation.

The problem with this technique is that the matrix dimension grows **exponentially** with the number of qubits ($2^n \times 2^n$ matrix size, where $n$ is the number of qubits). This makes the method impractical for circuits with many qubits (typically anything over 30-40 qubits is impossible to simulate even on supercomputers).

## Tensor Network (TN) Simulation

Tensor networks are mathematical tools primarily designed for the simulation of **many-body quantum problems**.

The operation of **tensor contraction** allows the network to be simplified, thus streamlining all subsequent calculations.

There are different simplification operations, and the **order** in which they are performed is highly relevant to the quality and efficiency of the result.

### CPU-Based TN (Matrix Product State - MPS)

The **Matrix Product State (MPS)** is a one-dimensional version of tensor networks. It is particularly useful for simulating circuits with **low entanglement** (or low "area law" scaling).

![MPS](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOkMDR80pUpw_Lx8duxvzDbqq_Va87qQ7fEw&s)

### GPU-Based TN (Tree Tensor Network - TTN / MERA)

These often involve multi-dimensional versions of the tensor network, which are typically executed on **GPUs** for greater efficiency.

You can specify the maximum dimension of the **bonds** (the links between the network nodes, often called the *bond dimension* or $\chi$). This allows you to limit the complexity of the circuit, but it also introduces an approximation error into the final measurement result (a trade-off between speed and accuracy).

If the required bond dimension is too large, the calculation is often truncated using **Singular Value Decomposition (SVD)**.

![TTN](https://quantum-journal.org/wp-content/uploads/2023/03/ttn1.png)

## Pauli Propagation

I am not familiar with this specific technique.
