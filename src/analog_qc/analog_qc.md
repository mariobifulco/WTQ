# Analog Quantum Computing

When we talk about analog quantum computing, the main player is definitely **D-Wave** with its implementation of **quantum annealing**.

The core idea behind this type of machine is to create a tool capable of solving a very **specific class of problems** [**not all of them!**].

D-Wave's computers are inherently designed for optimization tasks. The optimization problem is first encoded into the Quantum Processing Unit (QPU). After this setup phase, the system naturally evolves towards the state of **lowest energy/minimum entropy**, which magically represents the solution to the problem.

![A graph illustrating the quantum annealing process, where the system (Hamiltonian) is slowly transitioned from an initial state to the final problem state, allowing it to settle into the lowest energy minimum (the solution).](https://upload.wikimedia.org/wikipedia/commons/1/12/Quant-annl.jpg)

## From CSPs to Annealing

Let's imagine a generic **Constraint Satisfaction Problem (CSP)** in a minimization form:

$$\min f(x)\quad s.t.\quad Ax = b$$

The QPU can only natively solve problems in the **QUBO** format (Quadratic Unconstrained Binary Optimization). The problem shown above isn't guaranteed to have only binary variables and definitely has constraints, so we need to transform it into a QUBO.

This can be done in two 'simple' steps (we say simple, but in practice, it can be quite tricky!):

- **Binarize the variables** (using the most appropriate encoding you choose).
- **Use Lagrangian relaxation** to incorporate the constraints as penalties within the objective function.

The resulting QUBO problem is essentially a square, upper-triangular matrix, and can generally be seen as \\(\min x^\top Qx\\), where \\(Q\\) is the matrix and \\(x\\) is the vector of binary variables.

**Fun fact:** Solving a generic QUBO is an **NP-complete problem** (yikes!!), which is why we need quantum speed-up for the toughest instances.

QUBO problems can easily be visualized as graphs—the matrix \\(Q\\) represents the weights of the connections (edges). The challenge is that the QPU for annealing has a **fixed physical topology**, usually represented by a sparse graph (like the *Chimera* or *Pegasus* graphs in D-Wave's systems).

Before running the annealing process, you therefore need to map the problem's *logical* graph onto the QPU's fixed *physical* graph. This step is called **minor embedding** (and guess what? It's also NP-complete!).

![An image illustrating minor embedding: a simpler logical graph (the problem) is mapped onto a more complex, fixed physical graph (the QPU hardware) by using chains of physical qubits to represent a single logical qubit.](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmxYEXCPrN-KLhv4jYczCHAPf4HAmjKxALYA&s)
