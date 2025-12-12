# Digital Quantum Computing

When we talk about digital quantum computing, we are referring to the **gate-based** world. This is where most of the quantum players are found, and each vendor showcases its particular strengths:

* **IBM:** Focuses on the sheer **number of qubits** they can build (scaling up).
* **Quantinuum (using trapped ions):** Focuses on a **low error rate** (high fidelity).
* **Google:** Focuses on being able to demonstrate **quantum advantage** (solving a problem faster than the best classical machine).

## What are Quantum Gates?

Unlike classical bits, qubits are much more complex objects because they exist in a superposition of states. Due to this complexity, most of the fundamental gates act as **single-qubit operations** . (In the classical world, bits are "just" on or off, and you combine them with gates like AND, OR, and NOT to compute.)

Here is a list of quantum gates (non-exhaustive, but they form a **universal set**):

* **Controlled-NOT (C-Not) Gate** (The key 2-qubit gate for creating entanglement!):

    $$\begin{bmatrix}
    1 & 0 & 0 & 0 \\
    0 & 1 & 0 & 0 \\
    0 & 0 & 0 & 1 \\
    0 & 0 & 1 & 0
    \end{bmatrix}$$

* **Hadamard (H) Gate** (The most famous gate—it puts a qubit into a perfect superposition):

    $$\frac{1}{\sqrt 2}\begin{bmatrix}
    1 & 1 \\
    1 & -1
    \end{bmatrix}$$

* **Phase (S) Gate** (A single-qubit rotation):

    $$\begin{bmatrix}
    1 & 0 \\
    0 & i
    \end{bmatrix}$$

* **T Gate** (Also a single-qubit rotation, but a very specific one):

    $$\begin{bmatrix}
    1 & 0 \\
    0 & e^{i\pi / 4}
    \end{bmatrix}$$

The first three gates (C-NOT, H, S) are part of the **Clifford set** and can actually be simulated fairly easily on a classical computer. However, the addition of the **T gate** is crucial because it makes efficient classical simulation impossible—it's what gives the system its full quantum power!

Unlike analog systems (like annealing), these gates are **universal**, meaning they can theoretically express any type of quantum computation.

The presence of gates allows us to control individual qubits at every moment. This **local control** is what makes this type of computation "digital" (similar to how classical circuits work, just with far more powerful components).

## Why Not Use Only Gates?

Long story short: you absolutely **could**, and people do! (For example, using a process called **Trotterization** to emulate annealing on a gate-based machine.)

The main issue is that current qubits are still few and highly prone to error (they are *noisy*). So, while gate-based systems are universal, they are still far from the performance levels you can achieve by using more specialized quantum computing approaches for specific tasks with tailor-made tools (like using annealing for optimization). We are waiting for better hardware!
