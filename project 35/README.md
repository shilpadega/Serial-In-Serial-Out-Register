# 4-Bit Johnson Counter Using Verilog

## Overview

This project implements a 4-bit Johnson Counter using Verilog HDL.

A Johnson Counter is a modified synchronous shift register in which
the inverted output of the last flip-flop is fed back to the input
of the first flip-flop.

It is also known as a:

- Twisted Ring Counter
- Switch-Tail Ring Counter
- Möbius Counter

## Features

- 4-bit Johnson Counter
- Synchronous shift operation
- Active-high asynchronous reset
- Verilog HDL implementation
- Self-checking testbench
- Automatic PASS/FAIL verification
- VCD waveform generation
- GTKWave compatible

## Project Structure

```text
johnson-counter-verilog/
│
├── README.md
│
├── rtl/
│   └── johnson_counter.v
│
├── tb/
│   └── johnson_counter_tb.v
│
└── simulation/
    └── simulation_output.txt
