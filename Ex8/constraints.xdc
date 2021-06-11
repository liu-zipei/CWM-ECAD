##############################################
# Part         - xcvu9p
# Package      - fsgd2104
# Speed grade  - -2L
# Xilinx Reference Board is VCU1525
###############################################################################
create_clock -period 10 name clk [get_ports clk_p]
set_clock_groups -asynchronous -group [get_clocks clk -include_generated_clocks]

set_property PACKAGE_PIN AY38 [get_ports clk_n]
set_property IOSTANDARD DIFF_SSTL12 [get ports clk_n]

set_property PACKAGE_PIN AY37 [get_ports clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get ports clk_p]

set_property PULLUP true [get_ports rst_n]
set_property PACKAGE_PIN BD21 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get ports rst_n]

set_property PACKAGE_PIN AU22 [get_ports heating]
set_property IOSTANDARD LVCMOS18 [get ports heating]

set_property PACKAGE_PIN AT22 [get_ports cooling]
set_property IOSTANDARD LVCMOS18 [get ports cooling]

set_property PACKAGE_PIN BC21 [get_ports temperature_0]
set_property IOSTANDARD LVCMOS18 [get ports temperature_0]

set_property PACKAGE_PIN BB21 [get_ports temperature_1]
set_property IOSTANDARD LVCMOS18 [get ports temperature_1]

set_property PACKAGE_PIN BA20 [get_ports temperature_2]
set_property IOSTANDARD LVCMOS18 [get ports temperature_2]

set_property PACKAGE_PIN AL20 [get_ports temperature_3]
set_property IOSTANDARD LVCMOS18 [get ports temperature_3]

set_property PACKAGE_PIN AT20 [get_ports temperature_4]
set_property IOSTANDARD LVCMOS18 [get ports temperature_4]

# General configuration - Do not modify
set_property CFGBVS GND                                [current_design]
set_property CONFIG_VOLTAGE 1.8                        [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true           [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN {DIV-1} [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES       [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4           [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES        [current_design]

#############################################################################################################




