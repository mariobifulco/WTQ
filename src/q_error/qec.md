# Quantum Error Correction (QEC)

The core idea behind QEC is to use multiple physical qubits to represent a single **logical qubit**. This redundancy is what allows us to detect and fix errors.

QEC is most often associated with gate-based models, but similar techniques can also be used in annealing models.

QEC is typically described using the code notation \\([[n, k, d]]\\), where:

* \\(n\\) is the number of **physical qubits** used.
* \\(k\\) is the number of **logical qubits** produced (the number of useful qubits you get out).
* \\(d\\) is the **error detection distance**. It means we can detect up to \\(d - 1\\) errors and correct up to \\(\\lfloor\\frac{d-1}{2}\\rfloor\\) errors.

## Naive QEC (Gate-Based)

For gate-based models, the general estimate is that roughly **one thousand physical qubits** might be needed to create one robust, error-free logical qubit. This enormous ratio is what makes fault tolerance such a difficult engineering challenge.

## Quantum Annealing Correction (QAC)

This is a specific error correction method designed for annealing hardware. In QAC, every logical variable is associated with **three physical qubits** in the system, and correction is achieved using a **majority vote** among the three.

In a way, the necessary **minor embedding** process can also be considered an error reduction technique, as it creates chains of physical qubits (of arbitrary length) to represent all the required logical connections. If a link in the chain fails, the others in the chain can help mask the error.

QAC can also be applied as a post-processing step to the minor embedding result, but the downside is that it significantly reduces the size of the problem that can be represented on the machine.

This is essentially the \\([[3, 1, 3]]\\) code (3 physical qubits, 1 logical qubit, distance 3).

## Gross Code QEC

Proposed by IBM for their superconducting models, this code aims for a much better ratio. It requires **144 physical qubits** to represent **12 logical qubits**.

This represents the \\([[144, 12, 12]]\\) code.

## Iceberg Code QEC

Introduced by Quantinuum for their trapped ion machines, this scheme uses only **two additional qubits** to help correct \\(k\\) data qubits.

This represents the \\([[k + 2, k, 2]]\\) code.
