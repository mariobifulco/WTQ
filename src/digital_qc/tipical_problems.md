# Typical Gate-Based Problems

## Quantum Kernel

Kernels have been used long before quantum computers came along. Their main purpose is to map examples (data points) into a **higher-dimensional space**, where classification tasks become much simpler.

They are famously used in **Support Vector Machines (SVMs)** to classify non-linearly separable data, and in **Convolutional Neural Networks (CNNs)** to extract features from images.

```python
from qiskit_ibm_runtime import SamplerV2
from qiskit.circuit.library import zz_feature_map
from qiskit_machine_learning.kernels import FidelityQuantumKernel
from qiskit_machine_learning.state_fidelities import ComputeUncompute

sampler = SamplerV2(mode=backend) # Any backend, IBM, IQM, Simulation on CPU/GPU
FidelityQuantumKernel(
    fidelity=ComputeUncompute(sampler=sampler), 
    # zz_feature_map is just one possible map
    feature_map=zz_feature_map(feature_dimension=3, reps=2, entanglement='linear')
)
```

![feature_map.png](https://quantum.cloud.ibm.com/assets-docs-learning/_next/image?url=%2Fdocs%2Fimages%2Fapi%2Fqiskit%2Fcircuit_library-5.avif&w=3840&q=75)

Quantum kernels simplify classification incredibly fast because they map the data into a space whose dimensions grow **exponentially** with the number of features (qubits) used. This exponentially large space is what potentially gives us a quantum advantage in Machine Learning!

**Defining a 'Good' Kernel:**

To be useful, a quantum kernel must strike a balance:

- **Complex enough to be non-simulable:** If it can be simulated efficiently classically, why bother with a quantum computer? Currently, this complexity often means it's not yet efficiently executable on noisy real quantum hardware.
- **Expressive enough to be helpful:** Unlike classical kernels, quantum ones are formed by first building a **feature map** (which encodes the classical data into a quantum state) and then using that map in a **compute-uncompute** procedure (a neat trick that leverages the **reversible nature of quantum operations**!).
- **The big question:** How do we figure out if a feature map is actually *good* for a given dataset? This is a major area of research right now!

## Grover Search

Grover's algorithm is a quantum search algorithm designed for an **unsorted set of items**. *Think of it like looking for a name in a phone book where the names are randomly scattered.*

Intuitively, what the algorithm does is repeatedly sample the search space, but cleverly making the probability of measuring the target states **collapse** onto the desired examples. It's essentially an amplitude amplification process.

```python
from qiskit import QuantumCircuit
from qiskit.circuit.library import ZGate, MCMTGate

def grover_oracle(marked_states):
    if not isinstance(marked_states, list):
        marked_states = [marked_states]
    num_qubits = len(marked_states[0])
    qc = QuantumCircuit(num_qubits)
    for target in marked_states:
        rev_target = target[::-1]
        zero_inds = [ind for ind in range(num_qubits) if rev_target.startswith("0", ind)]
        qc.x(zero_inds)
        # MCMTGate is a Multi-Controlled Multi-Target gate
        qc.compose(MCMTGate(ZGate(), num_qubits - 1, 1), inplace=True)
        qc.x(zero_inds)
    return qc

marked_states = ["1000", "0100", "0010", "0001"] # These are the solutions we are looking for
oracle = grover_oracle(marked_states)
```

![Grover circuit](https://www.researchgate.net/publication/352678726/figure/fig1/AS:11431281274618704@1725032307983/Quantum-circuit-of-Grovers-algorithm-A-quantum-circuit-implementing-Grovers-algorithm.tif)

While incredibly useful and relatively easy to implement, Grover's algorithm provides **"only" a quadratic speed-up** (it takes \\(O(\sqrt{N})\\) steps instead of \\(O(N)\\) classically). This is a big deal, but it means it doesn't fundamentally change the complexity class of the problems it's used for (unlike Shor's algorithm, which we'll see next!).

*If you want to dive deeper, check out 3Blue1Brown's excellent videos:*

[3B1B - Grover](https://www.youtube.com/watch?v=RQWpF2Gb-gU&t=1981s)

[3B1B - Grover DLC](https://www.youtube.com/watch?v=Dlsa9EBKDGI)

## QAOA (Quantum Approximate Optimization Algorithm)

QAOA is a gate-based optimization method that also returns **approximate solutions**.

It falls under the family of **Variational Quantum Algorithms (VQAs)**. This means the quantum circuit is **parameterized** (it has tunable knobs) and interacts with a classical computer in a loop to optimize those circuit parameters.

1. **Quantum Part:** Runs the circuit and measures the output.
2. **Classical Part:** Takes the measurement, calculates the cost (how good the solution was), and decides how to adjust the parameters.

Once the parameters are optimized, they allow us to get a high-quality "solution" to the problem.

```python
from qiskit.quantum_info import SparsePauliOp
from qiskit.circuit.library import QAOAAnsatz

cost_hamiltonian = SparsePauliOp.from_list([('IZZ', 1.0), ('ZIZ', 1.0), ('ZZI', 1.0)])
circuit = QAOAAnsatz(cost_operator=cost_hamiltonian, reps=2).decompose(reps=2)
circuit.measure_all()
```

![QAOA](https://miro.medium.com/1*C49naMOXKuQ-jChTrArz2Q.png)

The circuit structure is straightforward, but performance tends to degrade significantly as the problems get larger. This is a common issue with VQAs on current-generation hardware.

There are alternatives, such as NDAR or Trotterization (which we mentioned earlier), that researchers are developing to try and improve on QAOA's performance.

## Shor Factorization

Shor's algorithm is probably the most famous one when discussing quantum computing.

The reason it's so popular (and feared) is that it dramatically changes the complexity class of factorization: from a presumed **exponential** time to **poly-logarithmic** time. This is the ultimate "game-changer" for cryptography, as it would break the widely used RSA encryption scheme.

Shor's algorithm for factoring the number 15

![Shor](https://stem.mitre.org/quantum/quantum-algorithms/images/shor-3.png)

Currently, there are no readily available, pre-built implementations of Shor's algorithm that can factor large numbers, and the algorithm itself is constantly being improved and optimized in academic literature.

In the literature, there are also other algorithms besides Shor's that are presumed to be better.

The main issue with Shor's algorithm is that it requires (to factor RSA-2048) at least **1 million noisy qubits** (until last year, it needed 20 million).
