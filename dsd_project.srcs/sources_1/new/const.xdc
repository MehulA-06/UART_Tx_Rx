# ----------------------------------------------------------------------------
# Clock (100MHz)
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN Y9 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]

# ----------------------------------------------------------------------------
# Buttons (Center=Reset, Down=Transmit)
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN P16 [get_ports {reset_btn}]
set_property IOSTANDARD LVCMOS18 [get_ports {reset_btn}]
set_property PACKAGE_PIN R16 [get_ports {transmit_btn}]
set_property IOSTANDARD LVCMOS18 [get_ports {transmit_btn}]

# ----------------------------------------------------------------------------
# Switches (Data to Transmit)
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN F22 [get_ports {SW[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {SW[0]}]
set_property PACKAGE_PIN G22 [get_ports {SW[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {SW[1]}]
set_property PACKAGE_PIN H22 [get_ports {SW[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {SW[2]}]
set_property PACKAGE_PIN F21 [get_ports {SW[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {SW[3]}]
set_property PACKAGE_PIN H19 [get_ports {SW[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {SW[4]}]
set_property PACKAGE_PIN H18 [get_ports {SW[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {SW[5]}]
set_property PACKAGE_PIN H17 [get_ports {SW[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {SW[6]}]
set_property PACKAGE_PIN M15 [get_ports {SW[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {SW[7]}]

# ----------------------------------------------------------------------------
# LEDs (Received Data Display)
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN T22 [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
set_property PACKAGE_PIN T21 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property PACKAGE_PIN U22 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property PACKAGE_PIN U21 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property PACKAGE_PIN V22 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
set_property PACKAGE_PIN W22 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
set_property PACKAGE_PIN U19 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
set_property PACKAGE_PIN U14 [get_ports {LED[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[7]}]

# ----------------------------------------------------------------------------
# UART PINS (Loopback Test Setup)
# ---------------------------------------------------------------------------- 
# JA1 (Pin Y11) -> RxD (FPGA Input)
set_property PACKAGE_PIN Y11 [get_ports {RxD}]
set_property IOSTANDARD LVCMOS33 [get_ports {RxD}]

# JA2 (Pin AA11) -> TxD (FPGA Output)
set_property PACKAGE_PIN AA11 [get_ports {TxD}]
set_property IOSTANDARD LVCMOS33 [get_ports {TxD}]