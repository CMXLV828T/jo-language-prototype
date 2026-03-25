#  Jo

# Jo — 6 Workers, Cross-Platform Performance

> **Benchmark Specs:** 132B Order · 1024-slot ring · 100 items/cycle · 1M cycles
> *Note: avg/stdev trimmed to p99.9 · min/max are raw (untrimmed)*

---

## 📊 Latency & Stability Comparison

| Metric | **ARM64** (Apple M2 Max · macOS) | **x86_64** (i7-1185G7 · Linux · isolcpus) |
| :--- | :---: | :---: |
| **LATENCY** | | |
| min | 166 ns | **111 ns** |
| p50 | 375 ns | **118 ns** |
| p99 | 542 ns | **130 ns** |
| p99.9 | 875 ns | **137 ns** |
| max | 23,333 ns | 18,002,753 ns (SMI) |
| **STABILITY** | | |
| avg | 386 ns | **119 ns** |
| stdev | 85 ns | **2.7 ns** |
| p50 → p99 | 167 ns | **12 ns** |

---

## 🏗️ Platform Architecture Details

| Feature | **ARM64** | **x86_64** |
| :--- | :--- | :--- |
| **Cores** | 8P + 2E | 4C / 8T |
| **Cache Line** | 128 B | 64 B |
| **L1d** | 128 KB | 192 KB |
| **Memory Model** | **Weak** (ARMv8) | **TSO** (x86) |
| **Store-Release** | `STLR` | **`MOV`** (Plain) |

---

## 📝 Technical Post-Mortem

* **x86 TSO Advantage:** 12 atomic ops/cycle all emit as **plain `MOV`** — zero barrier cost.
* **ARM64 Pipeline Stall:** 12 atomic ops/cycle emit as `STLR`/`LDAR` — explicit pipeline stall per op.
* **x86 max 18ms:** Identified as **SMI** (System Management Interrupt). BIOS-level interrupt, not suppressible on consumer laptops.
* **Consistency:** Same `.jo` source · same compiler · different target in `target.jo.toml`.