# Jo

# Jo — 6 Workers, Cross-Platform Performance

> **Benchmark Specs:** 132B Order · 1024-slot ring · 100 items/cycle · 1M cycles
> *Note: avg/stdev trimmed to p99.9 · min/max are raw (untrimmed)*

---

## 📊 Latency & Stability Comparison

| Metric | **ARM64** (Apple M2 Max · macOS) | **x86_64** (i7-1185G7 · Linux · isolcpus) | **x86_64** (Ryzen 5 7500F · Linux · isolcpus) |
| :--- | :---: | :---: | :---: |
| **LATENCY** | | | |
| min | 166 ns | 111 ns | **39 ns** |
| p50 | 375 ns | 118 ns | **50 ns** |
| p99 | 542 ns | 130 ns | **50 ns** |
| p99.9 | 875 ns | 137 ns | **90 ns** |
| max | 23,333 ns | 18,002,753 ns | **3,012,639 ns** |
| **STABILITY** | | | |
| avg | 386 ns | 119 ns | **48.1 ns** |
| stdev | 85 ns | 2.7 ns | **4.2 ns** |
| p50 → p99 | 167 ns | 12 ns | **0 ns** |

---

## 🏗️ Platform Architecture Details

| Feature | **ARM64** (M2 Max) | **x86_64** (i7-1185G7) | **x86_64** (Ryzen 5 7500F) |
| :--- | :--- | :--- | :--- |
| **Architecture** | Apple Silicon | Tiger Lake | Zen 4 |
| **Cores** | 8P + 2E | 4C / 8T | 6C / 12T |
| **Cache Line** | 128 B | 64 B | 64 B |
| **L1d** | 128 KB | 192 KB | 32 KB per core |
| **L2** | 16 MB | 5 MB | 1 MB per core |
| **L3** | 96 MB (SLC) | 12 MB | 32 MB |
| **Memory Model** | **Weak** (ARMv8) | **TSO** (x86) | **TSO** (x86) |
| **Store-Release** | `STLR` | `MOV` | `MOV` |

---

## 📝 Technical Post-Mortem

* **x86 TSO Advantage:** 12 atomic ops/cycle all emit as **plain `MOV`** — zero barrier cost.
* **ARM64 Pipeline Stall:** 12 atomic ops/cycle emit as `STLR`/`LDAR` — explicit pipeline stall per op.
* **Zen 4 p50 = p99:** Zero jitter between p50 and p99. Dispatch latency is effectively constant at 50 ns.
* **Zen 4 vs Tiger Lake:** Same ISA, same memory model — Zen 4's 2.4x improvement comes from microarchitectural gains (branch prediction, cache bandwidth, out-of-order depth).
* **x86 max outliers:** i7-1185G7 max 18ms = SMI (BIOS-level, consumer laptop). Ryzen 5 7500F max 3ms = SMI (desktop, less frequent, shorter duration).
* **Consistency:** Same `.jo` source · same compiler · different target in `target.jo.toml`.