# Jo

# Jo — 6 Workers, x86_64 Performance

> **Benchmark Specs:** 128B Order · 16384-slot ring · 100 items/cycle · 1M cycles
> **Environment:** `isolcpus=3,4,5,9,10,11` · Joseph pinned core 2 · `chrt -f 99` · `sched_rt_runtime_us=-1`
> *Note: avg/stdev trimmed to p99.9 · min/max are raw (untrimmed)*

---

## 📊 Latency & Stability

| Metric | **x86_64** (Ryzen 5 7500F · Linux · isolcpus) |
| :--- | :---: |
| **LATENCY** | |
| min | 1,149 ns |
| p50 | 2,290 ns |
| p99 | 2,670 ns |
| p99.9 | 4,030 ns |
| max | 10,410 ns |
| **STABILITY** | |
| avg | 2,293 ns |
| stdev | 188 ns |
| spike > 100μs | **0** |
| **THROUGHPUT** | |
| dispatched/cycle | 600 (100 items × 6 workers) |
| total dispatched | 600,000,000 |
| total returned | 600,000,000 |

---

## 🏗️ Platform Architecture

| Feature | **x86_64** (Ryzen 5 7500F) |
| :--- | :--- |
| **Architecture** | Zen 4 |
| **Cores** | 6C / 12T |
| **Cache Line** | 64 B |
| **L1d** | 32 KB per core |
| **L2** | 1 MB per core |
| **L3** | 32 MB |
| **Memory Model** | TSO (x86) |
| **Store-Release** | `MOV` |

---

## 📝 Technical Notes

* **Selective Field Copy:** Each dispatch copies only the fields the worker reads (32B), not the full struct (128B). 96B saved per dispatch × 600 dispatches/cycle.
* **Dispatch Loop:** Occupied slot → skip this worker, continue to next. All 6 workers evaluated independently per item — loop never exits early due to backpressure on a single worker.
* **x86 TSO Advantage:** Atomic ops emit as plain `MOV` — zero barrier cost.
* **Joseph Isolation:** Joseph pinned to a dedicated core (core 2), separate from all worker cores (3, 4, 5, 9, 10, 11).
* **RT Throttle Disabled:** `sched_rt_runtime_us=-1` removes the kernel's default 950ms/1s RT CPU budget cap.
* **Consistency:** Same `.jo` source · same compiler · runtime environment fully specified above.