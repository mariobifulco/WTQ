# Simulating Quantum Computing

To prototype and test ideas, it is essential to make use of **simulators**. They come in various forms and their usefulness depends on several factors:

* **Type of computation being simulated:** Are you modeling a gate-based circuit, an annealing process (like D-Wave), or a mixed/analog-digital approach?
* **Available hardware:** What resources do you have? Are you running the simulation on a **CPU**, **GPU**, or a specialized accelerator?
* **Output quality guarantees:** Do you need a perfect, noise-free result, or do you need to simulate a realistic quantum device *with* noise to perform **error mitigation** tests? (i.e., simulating with or without noise).
