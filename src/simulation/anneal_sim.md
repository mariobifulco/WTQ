# Simulators for Anneal-Based Quantum Computing

## Simulated Annealing

D-Wave provides a classical version of quantum annealing called **Simulated Annealing**. In this classical approach, there is **no quantum tunneling** to help the system escape local minima; instead, it relies purely on thermal fluctuations. This is useful for comparison and classical testing.

## Hybrid Solvers

Before moving to closed-source solutions, D-Wave offered a product called **Qbsolv**. This was a **hybrid solver** that combined classical techniques (like Tabu Search) with quantum annealing runs to search for the solution. This is necessary because real-world problems are often too large or too dense (too many connections) to fit onto the sparse topology of the quantum chip.

## Quantum-Inspired Computing

An alternative to D-Wave comes from Fujitsu with their **Digital Annealer**. The local simulator for this technology can handle up to 1,000 variables, while the real-time solvers are available via API.

This represents (to my knowledge) the only major alternative to D-Wave in the annealing space. The key difference is that the process here is always **classical**, but it is **quantum-inspired**. Although it's not entirely clear how this translates into practical, measurable differences compared to high-performance classical optimization methods, the architecture is specifically designed to efficiently solve the same QUBO-type problems.
