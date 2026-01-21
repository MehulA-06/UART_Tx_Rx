UART Transmitter & Receiver (Verilog)

This project implements a Universal Asynchronous Receiver-Transmitter (UART) using Verilog HDL, including both Transmitter (TX) and Receiver (RX) modules. The design is synthesizable, verified through simulation, and successfully implemented on the ZedBoard (Zynq-7000), making it suitable for real hardware communication applications.


Overview

The repository contains a complete UART communication core developed using:
1.Verilog RTL
2.FSM-based control logic
3.Baud rate generator
4.FPGA implementation on ZedBoard (Zynq-7000)

The design supports asynchronous serial communication and follows good digital design practices for FPGA-based systems.

The repository consists of following code:
1.Transmitter (TX)
2.Receiver (RX)
3.Debounce Signal
4.Constraint file
5.Top module


Features

1.UART TX and RX implemented in synthesizable Verilog
2.FSM-based control logic for framing and data transfer
3.Configurable baud rate generator
4.Successfully synthesized, implemented, and tested on ZedBoard
5.Modular and reusable design suitable for SoC/FPGA systems


