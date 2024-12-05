This repository demonstrates a subtle race condition in a simple VHDL counter. The `enable` signal is not synchronized with the clock, leading to potential issues when `enable` changes near the clock edge. The solution shows how to synchronize `enable` using a flip-flop to prevent the race condition.