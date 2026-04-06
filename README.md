 ---                                                                                      

## Latency & Stability

| Metric | **80B** (inline dispatch) | **128B** (outlined dispatch) | Delta |            
  | :--- | :---: | :---: | :---: |
| **LATENCY** | | | |                                                                    
| min | 770 ns | 1,149 ns | **-33%** |                                                 
| p50 | 1,830 ns | 2,290 ns | **-20%** |                                                 
| p99 | 2,170 ns | 2,670 ns | **-19%** |
| p99.9 | 3,620 ns | 4,030 ns | **-10%** |                                               
| max | 10,350 ns | 10,410 ns | ~0% |                                                  
| **STABILITY** | | | |                                                                  
| avg | 1,836 ns | 2,293 ns | **-20%** |                                                 
| stdev | 159 ns | 188 ns | **-15%** |
| spike > 100μs | **0** | **0** | — |                                                    
| **THROUGHPUT** | | | |                                                                 
| dispatched/cycle | 600 | 600 | — |
| total dispatched | 600,000,000 | 600,000,000 | — |                                     
| total returned | 600,000,000 | 600,000,000 | — |                                       
   
---                                                                                      

## Codegen Path Differences

| | **80B** | **128B** |                                                                 
  | :--- | :--- | :--- |                                                                 
| Dispatch | Inline | Outlined (`noinline` helper) |
| Copy strategy | Full memcpy (80B) | Selective field copy (32B used / 128B total) |     
| Cache lines per slot | 2 | 2–3 |                                                       
| Prefetch | Skip (< cache line) | Emit (`llvm.prefetch` i+4) |                          
                                                                                           
---                                                                                    

## Platform Architecture

| Feature | Spec |
  | :--- | :--- |
| Architecture | Zen 4 (Ryzen 5 7500F) |                                                 
| Cores | 6C / 12T |
| Cache Line | 64 B |                                                                    
| L1d | 32 KB per core |                                                               
| L2 | 1 MB per core |
| L3 | 32 MB shared |                                                                    
| Memory Model | TSO (x86) |
| Store-Release | `MOV` (zero barrier cost) |                                            
                                                                                           
---

## Technical Notes

* **80B wins by ~20% across the board.** Inline dispatch eliminates call/ret overhead;   
  full 80B memcpy is faster than 128B selective copy due to fewer GEP instructions.
* **Max latency identical (~10μs)** — both hit the same ceiling, likely L3/TLB miss. No  
  OS jitter with isolated cores.
* **x86 TSO advantage:** Atomic store-release emits as plain `MOV` — zero barrier cost.
* **RT throttle disabled:** `sched_rt_runtime_us=-1` removes the kernel's default        
  950ms/1s RT CPU budget cap.
* **Same `.jo` source · same compiler · only struct size differs.** 