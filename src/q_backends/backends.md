# Quantum backends

## IBM quantum

```python
def get_quantum_backend():
    from qiskit import generate_preset_pass_manager
    from qiskit_ibm_runtime import QiskitRuntimeService
    backend = QiskitRuntimeService(channel='ibm_cloud', token=TOKEN_IBM, instance=CRN_IBM).least_busy()
    pm = generate_preset_pass_manager(backend=backend, optimization_level=3)
    return backend, pm
```

## IBM CPU

```python
def get_classical_backend():
    from qiskit_aer import AerSimulator
    from qiskit import generate_preset_pass_manager
    backend = AerSimulator(method='matrix_product_state')
    pm = generate_preset_pass_manager(backend=backend, optimization_level=3)
    return backend, pm
```

## IQM quantum

```python
# Adapter to use IQM backend with pre-exhisting Qiskit code
def get_iqm_quantum_backend():
    from types import SimpleNamespace
    from iqm.qiskit_iqm import IQMProvider, transpile_to_IQM
    backend = IQMProvider(SERVER_IQM, token=TOKEN_IQM).get_backend()
    run = lambda x: transpile_to_IQM(x, backend, optimization_level=3)
    pm = SimpleNamespace(run=run)
    return backend, pm
```

## DWave hybrid solver

```python
from dwave.system.samplers import LeapHybridCQMSampler

solver = LeapHybridCQMSampler()
cqm_sampleset = solver.sample(cqm, num_reads=100)
```

## DWave quantum

```python
import dimod
from dwave.system import EmbeddingComposite, DWaveSampler

bqm, _default_back_function = dimod.cqm_to_bqm(cqm)
solver = EmbeddingComposite(DWaveSampler())
bqm_sampleset = solver.sample(bqm, num_reads=100)
```

## DWave CPU

```python
import dimod
from dwave.samplers import SimulatedAnnealingSampler

bqm, _default_back_function = dimod.cqm_to_bqm(cqm)
solver = SimulatedAnnealingSampler()
bqm_sampleset = solver.sample(bqm, num_reads=100)
```
