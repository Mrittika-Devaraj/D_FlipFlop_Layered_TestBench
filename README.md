# D Flip-Flop Using SystemVerilog

## Overview
This project implements a D Flip-Flop with an active-low asynchronous reset using SystemVerilog.

A layered testbench is developed to verify the functionality of the design through different input combinations.

## Testbench Architecture
The testbench consists of the following components:

- **Transaction:** Stores the input and output values.
- **Generator:** Generates test transactions.
- **Driver:** Applies inputs to the DUT.
- **Monitor:** Observes the DUT inputs and outputs.
- **Scoreboard:** Compares actual outputs with expected outputs.
- **Environment:** Connects and manages all testbench components.

## Verification
The testbench checks:
- Asynchronous reset operation.
- Data storage on the positive clock edge.
- Different combinations of reset and data inputs.

## Tools Used
- SystemVerilog
- Siemens Questa / EDA Playground

## Project Objective
To understand and implement a basic layered testbench architecture for functional verification of a digital circuit.
